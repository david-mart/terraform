<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| file_share_capacity_gb | File share capacity in GB | string | - | yes |
| file_share_name | The name of the fileshare (16 characters or less) | string | - | yes |
| filestore_name | The resource name of the filestore instance. | string | - | yes |
| filestore_tier | The service tier of the instance. | string | - | yes |
| network | The name of the GCE VPC network to which the instance is connected. | string | - | yes |
| network_modes | IP versions for which the instance has IP addresses assigned. | list | - | yes |
| zone | Zone for managed instance groups. | string | - | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->