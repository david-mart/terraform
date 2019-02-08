<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ike_version | IKE protocol version when establishing Phase-I with peer VPN gateway. | string | `1` | no |
| local-internal-subnet01 | Local Internal Subnet for which the VPN Gateway will serve | string | - | yes |
| port-group02 | Group of Ports for Traffic Riding the VPN | list | `<list>` | no |
| project_id | The ID of the project where this VPC will be created | string | - | yes |
| protocol01 | Firewall Rule - Allow Ping | string | `icmp` | no |
| protocol02 | Firewall Rule - Allow Specific TCP traffic | string | `tcp` | no |
| psk | Pointer to Preshared Key for VPN Encryption | string | - | yes |
| region | Region for cloud resources. | string | - | yes |
| remote-internal-subnet01 | Remote LAN-Subnet External to GCP. | string | - | yes |
| remote-vpn-peer-ip | Peer IP Address of VPN GW on Remote End - NON-GCP Environment | string | - | yes |
| vpn-gw | GCP VPN Gateway for Tunnel Termination and remote access to local GCP-Subnet | string | `vpn-gw01` | no |
| vpn-internal-network | Name of VPC the VPN Gateway will serve | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| remote-subnet01 | Subnet of the Internal-Network outside of GCP |
| vpn-peer-ip | IP Address of the VPN Peer |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->