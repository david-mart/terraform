variable "cloud_router_name" {
  description = "Name of the resource. The name must be 1-63 characters long, and comply with RFC1035"
  type        = "string"
}

variable "network" {
  description = "A reference to the network to which this router belongs."
  type        = "string"
}

variable "project_id" {
  description = "The ID of the project in which the resource belongs"
  type        = "string"
}

variable "region" {
  description = "Region for cloud resources."
}

variable "asn" {
  description = "Local BGP Autonomous System Number (ASN)."
}

variable "advertise_mode" {
  description = "User-specified flag to indicate which mode to use for advertisement. Valid values of this enum field are: DEFAULT, CUSTOM"
  type        = "string"
  default     = "DEFAULT"
}

variable "advertised_groups" {
  description = " User-specified list of prefix groups to advertise in custom mode. This field can only be populated if advertiseMode is CUSTOM and is advertised to all peers of the router."
  type        = "list"
  default     = []
}

variable "advertisted_ip_ranges" {
  description = "User-specified list of individual IP ranges to advertise in custom mode. This field can only be populated if advertiseMode is CUSTOM and is advertised to all peers of the router."
  type        = "list"
  default     = []
}

/*
The advertised_ip_ranges block supports:
range - (Optional) The IP range to advertise. The value must be a CIDR-formatted string.
description - (Optional) User-specified description for the IP range.
*/

