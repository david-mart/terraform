<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| advertise_mode | User-specified flag to indicate which mode to use for advertisement. Valid values of this enum field are: DEFAULT, CUSTOM | string | `DEFAULT` | no |
| advertised_groups | User-specified list of prefix groups to advertise in custom mode. This field can only be populated if advertiseMode is CUSTOM and is advertised to all peers of the router. | list | `<list>` | no |
| advertisted_ip_ranges | User-specified list of individual IP ranges to advertise in custom mode. This field can only be populated if advertiseMode is CUSTOM and is advertised to all peers of the router. | list | `<list>` | no |
| asn | Local BGP Autonomous System Number (ASN). | string | - | yes |
| cloud_router_name | Name of the resource. The name must be 1-63 characters long, and comply with RFC1035 | string | - | yes |
| network | A reference to the network to which this router belongs. | string | - | yes |
| project_id | The ID of the project in which the resource belongs | string | - | yes |
| region | Region for cloud resources. | string | - | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
