resource "google_compute_disk" "disk1" {
  name = "${var.project_id}-raw-disk1"
  size = "${var.disk1_size_gb}"
  type = "${var.disk1_disk_type}"
  zone = "${var.zone}"
}

resource "google_compute_disk" "disk2" {
  name = "${var.project_id}-raw-disk2"
  size = "${var.disk2_size_gb}"
  type = "${var.disk2_disk_type}"
  zone = "${var.zone}"
}

resource "google_compute_image" "disk1" {
  name        = "${var.project_id}-disk1-image"
  description = "Used to create additional attached disks to instances requiring regional accessibility"
  source_disk = "${google_compute_disk.disk1.self_link}"
}

resource "google_compute_image" "disk2" {
  name        = "${var.project_id}-disk2-image"
  description = "Used to create additional attached disks to instances requiring regional accessibility"
  source_disk = "${google_compute_disk.disk2.self_link}"
}
