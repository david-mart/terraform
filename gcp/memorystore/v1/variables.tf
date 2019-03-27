variable "region" {
  type        = "string"
  description = "The region where MemoryStore server(s) will be created"
  default     = "us-central1"
}

variable "name" {
  type        = "string"
  description = "The name for the MemoryStore instance"
}

variable "display_name" {
  type        = "string"
  description = "The display name for the MemoryStore instance"
}

variable "tier" {
  type        = "string"
  default     = "STANDARD_HA"
  description = "The service tier of the instance. Must be either 'BASIC' (standalone server) or 'STANDARD_HA'(primary with replica)"
}

variable "memory_size" {
  type        = "string"
  description = "Redis memory size in GiB"
}

variable "authorized_network" {
  type        = "string"
  description = "The full name of the network to which the instance will be connected"
}

variable "redis_version" {
  type        = "string"
  description = "The version of Redis software. Only available value is REDIS_3_2"
  default     = "REDIS_3_2"
}

variable "reserved_ip_range" {
  type        = "string"
  description = "The CIDR range of internal addresses reserved for this instance. Ranges should be unique and not overlapping with subnets in the network or with other MemoryStore instances. The range should be a /29 block."
}
