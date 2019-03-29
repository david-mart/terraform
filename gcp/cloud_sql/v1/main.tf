data "google_compute_network" "network" {
  name = "${var.network}"
}

resource "google_sql_database_instance" "default" {
  name                 = "${var.instance_name}"
  project              = "${var.project_id}"
  region               = "${var.region}"
  database_version     = "${var.database_version}"
  master_instance_name = "${var.master_instance_name}"

  settings {
    tier                        = "${var.tier}"
    activation_policy           = "${var.activation_policy}"
    authorized_gae_applications = ["${var.authorized_gae_applications}"]
    disk_autoresize             = "${var.disk_autoresize}"
    backup_configuration        = ["${var.backup_configuration}"]

    ip_configuration {
      ipv4_enabled = "${var.ipv4_enabled}"
      require_ssl  = "${var.require_ssl}"
    }

    availability_type   = "${var.availability_type}"     //PostgreSQL only
    location_preference = ["${var.location_preference}"]
    maintenance_window  = ["${var.maintenance_window}"]
    disk_size           = "${var.disk_size}"
    disk_type           = "${var.disk_type}"
    pricing_plan        = "${var.pricing_plan}"
    replication_type    = "${var.replication_type}"
    database_flags      = ["${var.database_flags}"]
  }

  replica_configuration = ["${var.replica_configuration}"]
}

resource "google_sql_database" "db" {
  count     = "${length(var.databases)}"
  name      = "${lookup(var.databases[count.index], "db_name")}"
  project   = "${var.project_id}"
  instance  = "${google_sql_database_instance.default.name}"
  charset   = "${lookup(var.databases[count.index], "db_charset")}"
  collation = "${lookup(var.databases[count.index], "db_collation")}"
}

resource "random_id" "user-password" {
  byte_length = 8
}

resource "google_sql_user" "default" {
  count    = "${length(var.databases)}"
  name     = "${lookup(var.databases[count.index], "db_user")}"
  project  = "${var.project_id}"
  instance = "${google_sql_database_instance.default.name}"
  host     = "${var.user_host}"
  password = "${var.user_password == "" ? random_id.user-password.hex : var.user_password}"
}

// @TODO - Need to convert this over to using native terraform resources , when available.
// See the following issue for details: https://github.com/terraform-providers/terraform-provider-google/issues/2127

resource "null_resource" "vpc-to-services-peering" {
  provisioner "local-exec" {
    command = <<EOF
    gcloud beta services vpc-peerings connect \
    --service servicenetworking.googleapis.com \
    --network ${var.network} \
    --ranges "${var.peering_address_range_name}"  \
    --project=${var.project_id} \
    --quiet
EOF
  }

  depends_on = ["google_sql_database_instance.default", "google_sql_database.db", "google_sql_user.default"]
}

resource "null_resource" "destroy-vpc-to-services-peering" {
  provisioner "local-exec" {
    when = "destroy"

    command = <<EOF
    gcloud compute networks peerings delete cloudsql-mysql-googleapis-com --network ${var.network} --quiet
    gcloud compute networks peerings delete servicenetworking-googleapis-com --network ${var.network} --quiet
EOF
  }
}

resource "null_resource" "add_db_internal_ip" {
  provisioner "local-exec" {
    command = <<EOF
    gcloud beta sql instances patch ${google_sql_database_instance.default.name} --async --network ${var.network}  --quiet 
EOF
  }

  depends_on = ["google_sql_database_instance.default", "google_sql_database.db", "google_sql_user.default", "null_resource.vpc-to-services-peering"]
}

// This will allow us to wait for the add_db_internal_ip operation to properly finish before proceeding on with remove_db_pub_ip
resource "null_resource" "wait_for_completion" {
  provisioner "local-exec" {
    command = <<EOF
    operations_id=`gcloud beta sql operations list --instance ${google_sql_database_instance.default.name} --filter "STATUS:RUNNING" --limit 1 --format="value(name)" --filter "TYPE:UPDATE"`
    gcloud beta sql operations wait --timeout 900 --project ${var.project_id} $$operations_id
EOF
  }

  depends_on = ["google_sql_database_instance.default", "google_sql_database.db", "google_sql_user.default", "null_resource.add_db_internal_ip"]
}

resource "null_resource" "remove_db_pub_ip" {
  provisioner "local-exec" {
    command = <<EOF
    gcloud beta sql instances patch  ${google_sql_database_instance.default.name}  --no-assign-ip 
EOF
  }

  depends_on = ["null_resource.wait_for_completion"]
}
