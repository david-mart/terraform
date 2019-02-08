variable name {
  description = "A unique name for the resource, required by GCE"
}

variable network {
  description = "The name of the network to attach this firewall to"
}

variable protocol {
  description = "The name of the protocol to allow"
}

variable project_id {
  description = "The name of the project"
}

variable ports {
  description = "List of ports and/or port ranges to allow. This can only be specified if the protocol is TCP or UDP"
  type        = "list"
  default     = []
}

variable target_tags {
  description = "A list of target network tags to apply to the firewall rule."
  type        = "list"
}

variable source_ranges {
  description = "A list of source CIDR ranges that this firewall applies to. Can't be used for EGRESS"
  type        = "list"
}
