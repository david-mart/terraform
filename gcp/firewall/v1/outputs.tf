output "self_link" {
  description = "The URI of the created resource"
  value       = "${google_compute_firewall.fw.self_link}"
}
