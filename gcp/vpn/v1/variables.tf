variable "project_id" {
  description = "The ID of the project where this VPC will be created"
}

variable "region" {
  description = "Region for cloud resources."
}

variable "vpn-internal-network" {
  description = "Name of VPC the VPN Gateway will serve"
}

variable "local-internal-subnet01" {
  description = "Local Internal Subnet for which the VPN Gateway will serve"
  type        = "string"
}

variable "vpn-gw" {
  description = "GCP VPN Gateway for Tunnel Termination and remote access to local GCP-Subnet"
  default     = "vpn-gw01"
}

variable "remote-vpn-peer-ip" {
  description = "Peer IP Address of VPN GW on Remote End - NON-GCP Environment"
}

variable "psk" {
  description = "Pointer to Preshared Key for VPN Encryption"
}

variable "remote-internal-subnet01" {
  description = "Remote LAN-Subnet External to GCP."
}

variable "protocol01" {
  description = "Firewall Rule - Allow Ping"
  default     = "icmp"
}

variable "protocol02" {
  description = "Firewall Rule - Allow Specific TCP traffic"
  default     = "tcp"
}

variable "port-group02" {
  description = "Group of Ports for Traffic Riding the VPN"

  default = ["80", "8080", "443", "22"]
  type    = "list"
}

variable "ike_version" {
  description = "IKE protocol version when establishing Phase-I with peer VPN gateway."
  type        = "string"
  default     = 1
}
