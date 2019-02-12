<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| access_config | The access config block for the instances. Set to [] to remove external IP. | list | `<list>` | no |
| automatic_restart | Automatically restart the instance if terminated by GCP - Set to false if using preemptible instances | string | `true` | no |
| autoscaling | Enable autoscaling. | string | `false` | no |
| autoscaling_cpu | Autoscaling, cpu utilization policy block as single element array. https://www.terraform.io/docs/providers/google/r/compute_autoscaler.html#cpu_utilization | list | `<list>` | no |
| autoscaling_lb | Autoscaling, load balancing utilization policy block as single element array. https://www.terraform.io/docs/providers/google/r/compute_autoscaler.html#load_balancing_utilization | list | `<list>` | no |
| autoscaling_metric | Autoscaling, metric policy block as single element array. https://www.terraform.io/docs/providers/google/r/compute_autoscaler.html#metric | list | `<list>` | no |
| block_project-ssh-keys | Boolean to enable or disable project-wide ssh key usage. | string | `false` | no |
| can_ip_forward | Allow ip forwarding. | string | `false` | no |
| compute_image | Image used for compute VMs. | string | `projects/ubuntu-os-cloud/global/licenses/ubuntu-1404-trusty` | no |
| cooldown_period | Autoscaling, cooldown period in seconds. | string | `60` | no |
| depends_id | The ID of a resource that the instance group depends on. | string | `` | no |
| description | A description of the managed instance group. | string | `Managed Compute Instance Group` | no |
| disk1_disk_auto_delete | Whether or not the disk1 should be auto-deleted. | string | `true` | no |
| disk1_disk_type | The disk1 tmp disk type. Can be either pd-ssd, local-ssd, or pd-standard. | string | `pd-ssd` | no |
| disk1_size_gb | The size of the tmp disk in gigabytes. | string | `75` | no |
| disk1_source_img | The URL (self_link) of the source image to build this desk from | string | - | yes |
| disk2_disk_auto_delete | Whether or not the disk2 should be auto-deleted. | string | `true` | no |
| disk2_disk_type | The disk2  disk type. Can be either pd-ssd, local-ssd, or pd-standard. | string | `pd-ssd` | no |
| disk2_size_gb | The size of the disk in gigabytes. | string | `500` | no |
| disk2_source_img | The URL (self_link) of the source image to build this desk from | string | - | yes |
| disk_auto_delete | Whether or not the disk should be auto-deleted. | string | `true` | no |
| disk_size_gb | The size of the image in gigabytes. If not specified, it will inherit the size of its base image. | string | `0` | no |
| disk_type | The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard. | string | `pd-ssd` | no |
| distribution_policy_zones | The distribution policy for this managed instance group when zonal=false. Default is all zones in given region. | list | `<list>` | no |
| hc_healthy_threshold | Health check, healthy threshold. | string | `1` | no |
| hc_initial_delay | Health check, intial delay in seconds. | string | `30` | no |
| hc_interval | Health check, check interval in seconds. | string | `30` | no |
| hc_path | Health check, the http path to check. | string | `/` | no |
| hc_port | Health check, health check port, if different from var.service_port, if not given, var.service_port is used. | string | `` | no |
| hc_timeout | Health check, timeout in seconds. | string | `10` | no |
| hc_unhealthy_threshold | Health check, unhealthy threshold. | string | `10` | no |
| http_health_check | Enable or disable the http health check for auto healing. | string | `true` | no |
| instance_labels | Labels added to instances. | map | `<map>` | no |
| local_cmd_create | Command to run on create as local-exec provisioner for the instance group manager. | string | `:` | no |
| local_cmd_destroy | Command to run on destroy as local-exec provisioner for the instance group manager. | string | `:` | no |
| machine_type | Machine type for the VMs in the instance group. | string | `f1-micro` | no |
| max_replicas | Autoscaling, max replicas. | string | `5` | no |
| metadata | Map of metadata values to pass to instances. | map | `<map>` | no |
| min_replicas | Autoscaling, min replics. | string | `1` | no |
| mode | The mode in which to attach this disk, either READ_WRITE or READ_ONLY. | string | `READ_WRITE` | no |
| module_enabled |  | string | `true` | no |
| name | Name of the managed instance group. | string | - | yes |
| network | Name of the network to deploy instances to. | string | `default` | no |
| network_ip | Set the network IP of the instance in the template. Useful for instance groups of size 1. | string | `` | no |
| preemptible | Use preemptible instances - lower price but short-lived instances. See https://cloud.google.com/compute/docs/instances/preemptible for more details | string | `false` | no |
| project | The project to deploy to, if not set the default provider project is used. | string | `` | no |
| region | Region for cloud resources. | string | `us-central1` | no |
| rolling_update_policy | The rolling update policy when update_strategy is ROLLING_UPDATE | list | `<list>` | no |
| service_account_email | The email of the service account for the instance template. | string | `default` | no |
| service_account_scopes | List of scopes for the instance template service account | list | `<list>` | no |
| service_port | Port the service is listening on. | string | - | yes |
| service_port_name | Name of the port the service is listening on. | string | - | yes |
| size | Target size of the managed instance group. | string | `1` | no |
| ssh_fw_rule | Whether or not the SSH Firewall Rule should be created | string | `true` | no |
| ssh_source_ranges | Network ranges to allow SSH from | list | `<list>` | no |
| startup_script | Content of startup-script metadata passed to the instance template. | string | `` | no |
| subnetwork | The subnetwork to deploy to | string | `default` | no |
| subnetwork_project | The project the subnetwork belongs to. If not set, var.project is used instead. | string | `` | no |
| target_pools | The target load balancing pools to assign this group to. | list | `<list>` | no |
| target_tags | Tag added to instances for firewall and networking. | list | `<list>` | no |
| update_strategy | The strategy to apply when the instance template changes. | string | `NONE` | no |
| wait_for_instances | Wait for all instances to be created/updated before returning | string | `false` | no |
| zonal | Create a single-zone managed instance group. If false, a regional managed instance group is created. | string | `true` | no |
| zone | Zone for managed instance groups. | string | `us-central1-f` | no |

## Outputs

| Name | Description |
|------|-------------|
| depends_id | Id of the dummy dependency created used for intra-module dependency creation with zonal groups. |
| health_check | The healthcheck for the managed instance group |
| instance_group | Link to the `instance_group` property of the instance group manager resource. |
| instance_template | Link to the instance_template for the group |
| instances | List of instances in the instance group. Note that this can change dynamically depending on the current number of instances in the group and may be empty the first time read. |
| name | Pass through of input `name`. |
| network_ip | Pass through of input `network_ip`. |
| region_depends_id | Id of the dummy dependency created used for intra-module dependency creation with regional groups. |
| region_instance_group | Link to the `instance_group` property of the region instance group manager resource. |
| service_port | Pass through of input `service_port`. |
| service_port_name | Pass through of input `service_port_name`. |
| target_tags | Pass through of input `target_tags`. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->