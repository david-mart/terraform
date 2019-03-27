resource "google_redis_instance" "cache" {
  name         = "${var.name}-cache"
  display_name = "${var.display_name}"

  # STANDARD_HA will provision in two unique zones
  # If we need to designate the zones, we can add the location parameters.
  tier = "${var.tier}"

  memory_size_gb = "${var.memory_size}"

  region             = "${var.region}"
  authorized_network = "${var.authorized_network}"
  redis_version      = "${var.redis_version}"
  display_name       = "${var.name}"

  # This IP address should be in RFC1918 space (private ip). It should not used
  # by the customer's vpc. It should not be used by other MemoryStore instances.
  reserved_ip_range = "${var.reserved_ip_range}"
}
