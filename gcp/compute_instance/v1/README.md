<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| address_type | The type of address to reserve, either INTERNAL or EXTERNAL. | string | `INTERNAL` | no |
| amount | Number of VMs | string | `1` | no |
| automatic_restart | Allow google cloud to restart VM for patching (recommended). | string | `true` | no |
| disk1_disk_auto_delete | Whether or not the disk1 should be auto-deleted. | string | `true` | no |
| disk1_disk_type | The disk1 tmp disk type. Can be either pd-ssd, local-ssd, or pd-standard. | string | `pd-ssd` | no |
| disk1_size_gb | The size of the tmp disk in gigabytes. | string | `0` | no |
| disk1_source_img | The URL (self_link) of the source image to build the disk from. | string | - | yes |
| disk2_disk_auto_delete | Whether or not the disk2 should be auto-deleted. | string | `true` | no |
| disk2_disk_type | The disk2  disk type. Can be either pd-ssd, local-ssd, or pd-standard. | string | `pd-ssd` | no |
| disk2_size_gb | The size of the disk in gigabytes. | string | `0` | no |
| disk2_source_img | The URL (self_link) of the source image to build the disk from. | string | - | yes |
| disk_create_local_exec_command_and_continue |  | string | `:` | no |
| disk_create_local_exec_command_or_fail |  | string | `:` | no |
| disk_destroy_local_exec_command_and_continue |  | string | `:` | no |
| disk_destroy_local_exec_command_or_fail |  | string | `:` | no |
| disk_image | [Available OS images/templates](https://cloud.google.com/compute/docs/images) | string | `centos-cloud/centos-7` | no |
| disk_size | Primary disk' size in GB | string | `20` | no |
| disk_type | pd-standard or pd-ssd | string | `pd-standard` | no |
| machine_type | List of VM sizes: https://github.com/Eimert/terraform-google-compute-engine-instance#machine_type | string | `n1-standard-2` | no |
| name_prefix | hostname format: name_prefix-amount | string | `vm` | no |
| network | Name of the network to deploy instances to. | string | `default` | no |
| project_id | The name of the project | string | - | yes |
| region | GC region | string | `europe-west4` | no |
| subnetwork | The subnetwork to deploy to | string | `default` | no |
| target_tags | Tag added to instances for firewall and networking. | list | `<list>` | no |
| zone | GC zone | string | `europe-west4-c` | no |

## Outputs

| Name | Description |
|------|-------------|
| addresses | VM IP addresses. |
| zones_available | Output gc zones having free space. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->