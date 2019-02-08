variable zone {
  description = "Zone for managed instance groups."
}

variable filestore_name {
  description = "The resource name of the filestore instance."
  type        = "string"
}

variable file_share_name {
  description = "The name of the fileshare (16 characters or less)"
  type        = "string"
}

variable file_share_capacity_gb {
  description = "File share capacity in GB"
  type        = "string"
}

variable filestore_tier {
  description = "The service tier of the instance."
  type        = "string"
}

variable network {
  description = "The name of the GCE VPC network to which the instance is connected."
  type        = "string"
}

variable network_modes {
  description = "IP versions for which the instance has IP addresses assigned."
  type        = "list"
}
