output "private_ip_url" {
  value       = "${google_compute_global_address.private_ip_allocation.self_link}"
  description = "the url for the private ip allocation"
}
