resource "google_compute_global_address" "private_ip_allocation" {
  name          = "${var.private_ip_allocation_name}"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  address       = "${var.private_ip_prefix}"
  prefix_length = "${var.private_ip_prefix_length}"
  network       = "${var.network_url}"

  provider = "google-beta.private_ip_allocation"
}
