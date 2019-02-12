output "vpn-peer-ip" {
  value       = "${google_compute_vpn_tunnel.tunnel1.peer_ip}"
  description = "IP Address of the VPN Peer"
}

output "remote-subnet01" {
  value       = "${google_compute_route.route1.dest_range}"
  description = "Subnet of the Internal-Network outside of GCP"
}
