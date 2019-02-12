resource "google_compute_disk" "slave-data" {
  count = "${var.slaves_count}"

  name  = "redis-data-${var.name}-slave-${count.index}"
  type  = "pd-ssd"
  zone  = "${var.region}-a"
  size  = "${var.data_disk_size}"
}

resource "google_compute_instance" "slave" {
  count = "${var.slaves_count}"

  name         = "redis-${var.name}-slave-${count.index}"
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
    source = "${google_compute_disk.slave-data.*.self_link[count.index]}"
  }

  metadata_startup_script = <<INITSCRIPT
${var.redis-base-initscript}

echo slaveof ${google_compute_instance.master.network_interface.0.network_ip} 6379 >> /etc/redis.conf

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
