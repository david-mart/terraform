variable "private_ip_allocation_name" {
  type        = "string"
  description = "Name of the private IP allocation"
}

variable "private_ip_prefix" {
  type        = "string"
  description = "The prefix for the CIDR range for private ip allocation. For example, if CIDR range is 10.96.0.0/16, the prefix would be 10.96.0.0"
}

variable "private_ip_prefix_length" {
  type        = "string"
  description = "The prefix length for the CIDR range for private ip allocation. For example, if CIDR range is 10.96.0.0/16, the prefix length would be '16'"
}

variable "network_url" {
  type        = "string"
  description = "The network url for the vpc which has the private ip allocation"
}
