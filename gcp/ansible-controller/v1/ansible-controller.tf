variable "vpc_name" { }
variable "region" { }
variable "ssh_keys" { }
variable "subnet_id" { }
variable "instance_type" { default = "n1-standard-1" }
variable "dns_name" { }
variable "zone_name" { }
variable "tags" { type = "list" default = [] }

variable "default_tags" { default = ["allow-public-ssh-ansible-controller"] }

output "dns-record" { value = "${google_dns_record_set.default.name}" }
output "public-ip" { value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}" }
output "private-ip" { value = "${google_compute_instance.default.network_interface.0.network_ip}" }

resource "google_compute_instance" "default" {
  allow_stopping_for_update = true

  name         = "ansible-controller"
  machine_type = "${var.instance_type}"
  zone         = "${var.region}-a"

  tags = ["${concat(var.default_tags, var.tags)}"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  metadata_startup_script = <<INITSCRIPT
set -ex

yum install -y epel-release ansible git
yum -y install python-pip
pip install "pywinrm>=0.2.2"

INITSCRIPT

  metadata {
    ssh-keys = <<EOF
${var.ssh_keys}
EOF
  }

  network_interface {
    subnetwork = "${var.subnet_id}"

    access_config {
      network_tier = "STANDARD"
    }
  }
}

resource "google_compute_firewall" "allow-public-ssh-ansible-controller" {
 name    = "allow-public-ssh-ansible-controller"
 network = "${var.vpc_name}"

 allow {
   protocol = "tcp"
   ports    = ["22"]
 }

 source_ranges = [ "0.0.0.0/0" ]

 target_tags = ["allow-public-ssh-ansible-controller"]
}

resource "google_dns_record_set" "default" {
  name = "ansible-controller.${var.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${var.zone_name}"

  rrdatas = ["${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"]
}
