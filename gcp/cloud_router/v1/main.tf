provider "google" {
  region  = "${var.region}"
  project = "${var.project_id}"
}

data "google_compute_network" "network" {
  name    = "${var.network}"
  project = "${var.project_id}"
}

resource "google_compute_router" "router" {
  name    = "${var.cloud_router_name}"
  network = "${data.google_compute_network.network.name}"
  region  = "${var.region}"

  bgp {
    asn                  = "${var.asn}"
    advertise_mode       = "${var.advertise_mode}"
    advertised_groups    = ["${var.advertised_groups}"]
    advertised_ip_ranges = "${var.advertisted_ip_ranges}"
  }
}
