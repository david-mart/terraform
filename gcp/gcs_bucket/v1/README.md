<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| force_destroy | When deleting a bucket, this boolean option will delete all contained objects. | string | `false` | no |
| lifecycle_rules |  | list | `<list>` | no |
| name | The name of the bucket - NOTE: The project name will be concatonated to this name. | string | - | yes |
| project_id | The ID of the google project to which the resource belongs. If it is not provided, the provider project is used. | string | `` | no |
| region | The GCS region. If it is not provided, the provider region is used. | string | `` | no |
| role_entities |  | list | `<list>` | no |
| storage_class | The Storage Class of the new bucket. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE. | string | `REGIONAL` | no |
| versioning | Version bucket objects? | string | `false` | no |
| website_config |  | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of bucket. |
| self_link | The URI of the created resource. |
| url | The base URL of the bucket, in the format gs://<bucket-name>. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
