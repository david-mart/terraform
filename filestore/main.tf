//
resource "google_filestore_instance" "filestore" {
  name = "${var.filestore_name}"
  zone = "${var.zone}"
  tier = "${var.filestore_tier}"

  file_shares {
    capacity_gb = "${var.file_share_capacity_gb}"
    name        = "${var.file_share_name}"
  }

  networks {
    network = "${var.network}"
    modes   = ["${var.network_modes}"]
  }
}
