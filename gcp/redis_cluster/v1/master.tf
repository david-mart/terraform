resource "google_compute_disk" "master-data" {
  name  = "redis-data-${var.name}-master"
  type  = "pd-ssd"
  zone  = "${var.region}-a"
  size  = "${var.data_disk_size}"
}

resource "google_compute_instance" "master" {
  name         = "redis-${var.name}-master"
  machine_type = "${var.instance_type}"
  zone         = "${var.region}-a"
  tags         = [
    "allow-public-ssh-redis-${var.name}",
    "allow-redis-${var.name}",
    "nat"
  ]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  attached_disk {
    source = "${google_compute_disk.master-data.self_link}"
  }

  metadata_startup_script = <<INITSCRIPT
${var.redis-base-initscript}

${var.redis-final-initscript}
INITSCRIPT

  metadata {
    ssh-keys = <<EOF
${var.ssh-keys}
EOF
  }

  network_interface {
    subnetwork = "${var.subnet_id}"
  }
}
