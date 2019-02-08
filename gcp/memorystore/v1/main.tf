variable "region" { default = "us-central1" }
variable "name" { }
variable "tier" {
  default = "STANDARD_HA"
}
variable "memory_size" { }
variable "authorized_network" { }

variable "redis_version" {
  default = "REDIS_3_2"
}

variable "display_name" { }
variable "reserved_ip_range" { }

resource "google_redis_instance" "cache" {
  name           = "${var.name}-cache"
  tier           = "${var.tier}"
  memory_size_gb = "${var.memory_size}"

  # STANDARD_HA will provision in two unique zones
  # location_id             = "us-central1-a"
  # alternative_location_id = "us-central1-f"

  authorized_network = "${var.authorized_network}"

  redis_version     = "${var.redis_version}"
  display_name      = "${var.name}"

  # TODO: Not sure if I need to calculate out of colossus networks
  # reserved_ip_range = "192.168.0.0/29"
}
