//
resource "google_compute_firewall" "fw" {
  name    = "${var.name}"
  network = "${var.network}"
  project = "${var.project_id}"

  allow {
    protocol = "${var.protocol}"
    ports    = "${var.ports}"
  }

  target_tags   = ["${var.target_tags}"]
  source_ranges = "${var.source_ranges}"
}
