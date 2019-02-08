<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| backend_params | Comma-separated encoded list of parameters in order: health check path, service port name, service port, backend timeout seconds | list | - | yes |
| backend_protocol | The protocol with which to talk to the backend service | string | `HTTP` | no |
| backends | Map backend indices to list of backend maps. | map | - | yes |
| cdn | Set to `true` to enable cdn on backend. | string | `false` | no |
| certificate | Content of the SSL certificate. Required if `ssl` is `true` and `ssl_certificates` is empty. | string | `` | no |
| create_url_map | Set to `false` if url_map variable is provided. | string | `true` | no |
| firewall_networks | Names of the networks to create firewall rules in | list | `<list>` | no |
| firewall_projects | Names of the projects to create firewall rules in | list | `<list>` | no |
| http_forward | Set to `false` to disable HTTP port 80 forward | string | `true` | no |
| ip_version | IP version for the Global address (IPv4 or v6) - Empty defaults to IPV4 | string | `` | no |
| name | Name for the forwarding rule and prefix for supporting resources | string | - | yes |
| private_key | Content of the private SSL key. Required if `ssl` is `true` and `ssl_certificates` is empty. | string | `` | no |
| project | The project to deploy to, if not set the default provider project is used. | string | `` | no |
| region | Region for cloud resources | string | `us-central1` | no |
| security_policy | The resource URL for the security policy to associate with the backend service | string | `` | no |
| ssl | Set to `true` to enable SSL support, requires variable `ssl_certificates` - a list of self_link certs | string | `false` | no |
| ssl_certificates | SSL cert self_link list. Required if `ssl` is `true` and no `private_key` and `certificate` is provided. | list | `<list>` | no |
| target_tags | List of target tags for health check firewall rule. | list | - | yes |
| url_map | The url_map resource to use. Default is to send all traffic to first backend. | string | `` | no |
| use_ssl_certificates | If true, use the certificates provided by `ssl_certificates`, otherwise, create cert from `private_key` and `certificate` | string | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| backend_services | The backend service resources. |
| external_ip | The external IP assigned to the global fowarding rule. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->