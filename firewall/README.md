<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | A unique name for the resource, required by GCE | string | - | yes |
| network | The name of the network to attach this firewall to | string | - | yes |
| ports | List of ports and/or port ranges to allow. This can only be specified if the protocol is TCP or UDP | list | `<list>` | no |
| project_id | The name of the project | string | - | yes |
| protocol | The name of the protocol to allow | string | - | yes |
| source_ranges | A list of source CIDR ranges that this firewall applies to. Can't be used for EGRESS | list | - | yes |
| target_tags | A list of target network tags to apply to the firewall rule. | list | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| self_link | The URI of the created resource |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
