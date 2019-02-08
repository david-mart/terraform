variable project_id {
  description = "The project to deploy to, if not set the default provider project is used."
}

variable zone {
  description = "Zone for managed instance groups."
}

variable disk1_disk_type {
  description = "The disk1 tmp disk type. Can be either pd-ssd, local-ssd, or pd-standard."
}

variable disk1_size_gb {
  description = "The size of the tmp disk in gigabytes."
}

variable disk2_disk_type {
  description = "The disk2 disk type. Can be either pd-ssd, local-ssd, or pd-standard."
}

variable disk2_size_gb {
  description = "The size of the disk in gigabytes."
}
