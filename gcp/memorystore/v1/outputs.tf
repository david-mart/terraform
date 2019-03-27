output "redis_host" {
  description = "hostname or ip address for the redis endpoint"
  value       = "${google_redis_instance.cache.host}"
}

output "redis_port" {
  description = "the port for the redis endpoint"
  value       = "${google_redis_instance.cache.port}"
}
