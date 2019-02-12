resource "google_compute_firewall" "allow-redis" {
 name    = "allow-redis-${var.name}"
 network = "${var.vpc_name}"

 allow {
   protocol = "tcp"
   ports    = ["6379", "16379"]
 }

 source_ranges = [
   "${var.testing_cidr}",
   "${var.subnet_cidr}"
 ]

 target_tags = ["allow-redis-${var.name}"]
}

resource "google_compute_firewall" "allow-public-ssh-redis" {
 name    = "allow-public-ssh-redis-${var.name}"
 network = "${var.vpc_name}"

 allow {
   protocol = "tcp"
   ports    = ["22"]
 }

 source_ranges = [
   "${var.testing_cidr}",
 ]

 target_tags = ["allow-public-ssh-redis-${var.name}"]
}
