//
resource "google_compute_address" "instances" {
  count        = "${var.amount}"
  project      = "${var.project_id}"
  name         = "${var.name_prefix}-${count.index}"
  region       = "${var.region}"
  address_type = "${var.address_type}"
  subnetwork   = "${var.subnetwork}"
}

resource "google_compute_disk" "instances" {
  count   = "${var.amount}"
  project = "${var.project_id}"
  name    = "${var.name_prefix}-${count.index}"
  type    = "${var.disk_type}"
  size    = "${var.disk_size}"

  # optional
  zone = "${var.zone}"

  image = "${var.disk_image}"

  provisioner "local-exec" {
    command    = "${var.disk_create_local_exec_command_or_fail}"
    on_failure = "fail"
  }

  provisioner "local-exec" {
    command    = "${var.disk_create_local_exec_command_and_continue}"
    on_failure = "continue"
  }

  provisioner "local-exec" {
    when       = "destroy"
    command    = "${var.disk_destroy_local_exec_command_or_fail}"
    on_failure = "fail"
  }

  provisioner "local-exec" {
    when       = "destroy"
    command    = "${var.disk_destroy_local_exec_command_and_continue}"
    on_failure = "continue"
  }
}

data "google_compute_subnetwork" "subnetwork" {
  name = "${var.subnetwork}"
}

resource "google_compute_disk" "disk1" {
  count   = "${var.amount}"
  project = "${var.project_id}"
  name    = "${var.name_prefix}-${count.index}-disk1"
  type    = "${var.disk1_disk_type}"
  size    = "${var.disk1_size_gb}"

  # optional
  zone  = "${var.zone}"
  image = "${var.disk1_source_img}"
}

resource "google_compute_disk" "disk2" {
  count   = "${var.amount}"
  project = "${var.project_id}"
  name    = "${var.name_prefix}-${count.index}-disk2"
  type    = "${var.disk2_disk_type}"
  size    = "${var.disk2_size_gb}"

  # optional
  zone  = "${var.zone}"
  image = "${var.disk2_source_img}"
}

# https://www.terraform.io/docs/providers/google/r/compute_instance.html

resource "google_compute_instance" "instances" {
  count        = "${var.amount}"
  project      = "${var.project_id}"
  name         = "${var.name_prefix}-${count.index}"
  zone         = "${var.zone}"
  machine_type = "${var.machine_type}"
  tags         = ["${var.target_tags}"]

  boot_disk = {
    source      = "${google_compute_disk.instances.*.name[count.index]}"
    auto_delete = false
  }

  attached_disk {
    source = "${google_compute_disk.disk1.*.name[count.index]}"
  }

  attached_disk {
    source = "${google_compute_disk.disk2.*.name[count.index]}"
  }

  # reference: https://cloud.google.com/compute/docs/storing-retrieving-metadata
  metadata {
    description = "Managed by Terraform"

    #user-data = "${replace(replace(var.user_data, "$$ZONE", var.zone), "$$REGION", var.region)}"
    #ssh-keys = "${var.username}:${file("${var.public_key_path}")}"
  }

  network_interface = {
    subnetwork = "${data.google_compute_subnetwork.subnetwork.self_link}"

    #access_config = {
    #  nat_ip = "${google_compute_address.instances.*.address[count.index]}"
    #}
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
    automatic_restart   = "${var.automatic_restart}"
  }

  allow_stopping_for_update = "true"
}

#                   binding a DNS name to the ephemeral IP of a new instance                #
#                            requires google_dns_managed_zone                               #


/*
resource "google_dns_record_set" "dns_record" {
  # name = "${google_compute_instance.instances.*.name[count.index]}.${google_dns_managed_zone.dns_zone.dns_name}"
  # for example: dns_record_name=ansible-dev
  # will be: ansible-dev.cloud.eimertvink.nl
  # name = "${var.dns_record_name}.${google_dns_managed_zone.managed_zone.dns_name}"
  # managed_zone = "${google_dns_managed_zone.managed_zone.name}"
  name = "${var.dns_record_name}.${var.dns_zone}"
  managed_zone = "${var.dns_name}"
  type = "A"
  ttl  = 300

  rrdatas = ["${google_compute_instance.instances.*.network_interface.0.access_config.0.assigned_nat_ip}"]
}
*/

