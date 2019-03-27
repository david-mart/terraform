# Network Private IP
This is a terraform component that adds a private ip allocation for private
service connections.

A use case for this module is when Cloud SQL database is created with private
ip. You can set the private ip range used by Google for its services. This range
must be in a range not used by the vpc.

## Provider
This module requires the `google-beta` provider. It expects the provider aliased
as `google-beta.private_ip_allocation`. This needs to be hardcoded since
providers are interpreted before interpolation.

## Network module
This module is used in conjunction with the network module. The reason this
functionality is not in the network module is that it relies on parameters only
supported by `google-beta` provider. Including it in the network module would
require users to add the `google-beta` provider even if they don't private ip
allocations.
## Example
```HCL
provider "google-beta" {
  alias   = "private_ip_allocation"
  project = "${var.project_id}"
}

module "private_ip_allocation" {
  source = "git@github.com:sadasystems/terraform_modules.git//gcp/network-private-ip/v1
  private_ip_allocation_name = "${var.private_ip_allocation_name}"
  private_ip_prefix = "${var.private_ip_prefix}"
  private_ip_prefix_length = "${var.private_ip_prefix_length}"
  network_url = "${module.network.self_link}"

  providers {
    google-beta.private_ip_allocation = "google-beta.private_ip_allocation"
  }
}
```
---
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| network\_url | The network url for the vpc which has the private ip allocation | string | n/a | yes |
| private\_ip\_allocation\_name | Name of the private IP allocation | string | n/a | yes |
| private\_ip\_prefix | The prefix for the CIDR range for private ip allocation. For example, if CIDR range is 10.96.0.0/16, the prefix would be 10.96.0.0 | string | n/a | yes |
| private\_ip\_prefix\_length | The prefix length for the CIDR range for private ip allocation. For example, if CIDR range is 10.96.0.0/16, the prefix length would be '16' | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| private\_ip\_url | the url for the private ip allocation |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->