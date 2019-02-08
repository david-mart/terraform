#
resource "google_compute_vpn_gateway" "target_gateway" {
  name    = "${var.vpn-gw}"
  network = "${var.vpn-internal-network}"
  project = "${var.project_id}"
  region  = "${var.region}"
}

resource "google_compute_address" "vpn_static_ip" {
  name    = "vpn-static-ip"
  project = "${var.project_id}"
  region  = "${var.region}"
}

resource "google_compute_forwarding_rule" "fr_esp" {
  name        = "fr-esp"
  region      = "${var.region}"
  project     = "${var.project_id}"
  ip_protocol = "ESP"
  ip_address  = "${google_compute_address.vpn_static_ip.address}"
  target      = "${google_compute_vpn_gateway.target_gateway.self_link}"
}

resource "google_compute_forwarding_rule" "fr_udp500" {
  name        = "fr-udp500"
  region      = "${var.region}"
  project     = "${var.project_id}"
  ip_protocol = "UDP"
  port_range  = "500"
  ip_address  = "${google_compute_address.vpn_static_ip.address}"
  target      = "${google_compute_vpn_gateway.target_gateway.self_link}"
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  project = "${var.project_id}"
  network = "${var.vpn-internal-network}"

  allow {
    protocol = "${var.protocol01}"
  }

  allow {
    protocol = "${var.protocol02}"
    ports    = "${var.port-group02}"
  }

  allow {
    protocol = "udp"
    ports    = ["4500", "500"]
  }

  allow {
    protocol = "esp"
  }

  source_tags = ["migration"]
}

resource "google_compute_forwarding_rule" "fr_udp4500" {
  name        = "fr-udp4500"
  region      = "${var.region}"
  project     = "${var.project_id}"
  ip_protocol = "UDP"
  port_range  = "4500"
  ip_address  = "${google_compute_address.vpn_static_ip.address}"
  target      = "${google_compute_vpn_gateway.target_gateway.self_link}"
}

resource "google_compute_vpn_tunnel" "tunnel1" {
  name          = "tunnel1"
  region        = "${var.region}"
  project       = "${var.project_id}"
  ike_version   = "${var.ike_version}"
  peer_ip       = "${var.remote-vpn-peer-ip}"
  shared_secret = "${var.psk}"

  local_traffic_selector = [
    "${var.local-internal-subnet01}",
  ]

  target_vpn_gateway = "${google_compute_vpn_gateway.target_gateway.self_link}"

  depends_on = [
    "google_compute_forwarding_rule.fr_esp",
    "google_compute_forwarding_rule.fr_udp500",
    "google_compute_forwarding_rule.fr_udp4500",
  ]
}

resource "google_compute_route" "route1" {
  name                = "route-to-remote-subnet"
  project             = "${var.project_id}"
  network             = "${var.vpn-internal-network}"
  dest_range          = "${var.remote-internal-subnet01}"
  priority            = 1000
  next_hop_vpn_tunnel = "${google_compute_vpn_tunnel.tunnel1.self_link}"
}
