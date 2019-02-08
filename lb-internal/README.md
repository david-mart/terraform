<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| backends | List of backends, should be a map of key-value pairs for each backend, mush have the 'group' key. | list | - | yes |
| health_port | Port to perform health checks on. | string | - | yes |
| http_health_check | Set to true if health check is type http, otherwise health check is tcp. | string | `false` | no |
| ip_address | IP address of the internal load balancer, if empty one will be assigned. Default is empty. | string | `` | no |
| ip_protocol | The IP protocol for the backend and frontend forwarding rule. TCP or UDP. | string | `TCP` | no |
| name | Name for the forwarding rule and prefix for supporting resources. | string | - | yes |
| network | Name of the network to create resources in. | string | `default` | no |
| network_project | Name of the project for the network. Useful for shared VPC. Default is var.project. | string | `` | no |
| ports | List of ports range to forward to backend services. Max is 5. | list | - | yes |
| project | The project to deploy to, if not set the default provider project is used. | string | `` | no |
| region | Region for cloud resources. | string | `us-central1` | no |
| session_affinity | The session affinity for the backends example: NONE, CLIENT_IP. Default is `NONE`. | string | `NONE` | no |
| source_tags | List of source tags for traffic between the internal load balancer. | list | - | yes |
| subnetwork | Name of the subnetwork to create resources in. | string | `default` | no |
| target_tags | List of target tags for traffic between the internal load balancer. | list | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| ip_address | The internal IP assigned to the regional fowarding rule. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->