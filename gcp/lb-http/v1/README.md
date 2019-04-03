<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| backend\_params | Comma-separated encoded list of parameters in order: health check path, service port name, service port, backend timeout seconds | list | `<list>` | no |
| backend\_protocol | The protocol with which to talk to the backend service | string | `"HTTP"` | no |
| backends | Map backend indices to list of backend maps. | map | `<map>` | no |
| cdn | Set to `true` to enable cdn on backend. | string | `"false"` | no |
| certificate | Content of the SSL certificate. Required if `ssl` is `true` and `ssl_certificates` is empty. | string | `""` | no |
| create\_url\_map | Set to `false` if url_map variable is provided. | string | `"true"` | no |
| firewall\_networks | Names of the networks to create firewall rules in | list | `<list>` | no |
| firewall\_projects | Names of the projects to create firewall rules in | list | `<list>` | no |
| http\_forward | Set to `false` to disable HTTP port 80 forward | string | `"true"` | no |
| ip\_version | IP version for the Global address (IPv4 or v6) - Empty defaults to IPV4 | string | `""` | no |
| name | Name for the forwarding rule and prefix for supporting resources | string | n/a | yes |
| private\_key | Content of the private SSL key. Required if `ssl` is `true` and `ssl_certificates` is empty. | string | `""` | no |
| project | The project to deploy to, if not set the default provider project is used. | string | `""` | no |
| region | Region for cloud resources | string | `"us-central1"` | no |
| security\_policy | The resource URL for the security policy to associate with the backend service | string | `""` | no |
| ssl | Set to `true` to enable SSL support, requires variable `ssl_certificates` - a list of self_link certs | string | `"false"` | no |
| ssl\_certificates | SSL cert self_link list. Required if `ssl` is `true` and no `private_key` and `certificate` is provided. | list | `<list>` | no |
| target\_tags | List of target tags for health check firewall rule. | list | `<list>` | no |
| url\_map | The url_map resource to use. Default is to send all traffic to first backend. | string | `""` | no |
| use\_ssl\_certificates | If true, use the certificates provided by `ssl_certificates`, otherwise, create cert from `private_key` and `certificate` | string | `"false"` | no |

## Outputs

| Name | Description |
|------|-------------|
| backend\_services | The backend service resources. |
| external\_ip | The external IP assigned to the global fowarding rule. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->