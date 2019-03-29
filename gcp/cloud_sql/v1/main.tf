data "google_compute_global_address" "peering_address_range" {
  name = "${var.peering_address_range_name}"
}

resource "google_service_networking_connection" "private_vpc_connection" {
  count                   = "${var.service_networking_enabled}"
  provider                = "google-beta"
  network                 = "${var.network_link}"
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = ["${data.google_compute_global_address.peering_address_range.name}"]
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
      ipv4_enabled    = "${var.ipv4_enabled}"
      require_ssl     = "${var.require_ssl}"
      private_network = "${var.network_link}"
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
