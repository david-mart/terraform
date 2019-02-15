# Terraform Module

gcs_bucket

## Module Example

```bash

module "bucket" {
  source           = "git@github.com:sadasystems/gcp_tf_modules.git//gcp/gcs_bucket/v1"
  project_id       = "my-project"
  name             = "mybucket"
  region           = "us-central1"
  storage_class = "NEARLINE"
  lifecycle_rules = [
    {
      action = [
        {
          type = "Delete"
        },
      ]

      condition = [
        {
          age = 90
        },
      ]
    },
  ]
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| force_destroy | When deleting a bucket, this boolean option will delete all contained objects. | string | `false` | no |
| lifecycle_rules | The bucket's Lifecycle Rules configuration. A list of multiple blocks of this type are permitted. See module example. | list | `<list>` | no |
| name | The name of the bucket. Must be unique across all GCS buckets. | string | - | yes |
| project_id | The ID of the google project to which the resource belongs. If it is not provided, the provider project is used. | string | `` | no |
| region | The GCS region. If it is not provided, the provider region is used. | string | `` | no |
| role_entities | List of role/entity pairs in the form ROLE:entity. See [GCS Bucket ACL documentation](https://cloud.google.com/storage/docs/json_api/v1/bucketAccessControls) for more details. Must be set if predefined_acl is not. | list | `<list>` | no |
| storage_class | The Storage Class of the new bucket. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE. | string | `REGIONAL` | no |
| versioning | The bucket's Versioning configuration. | string | `false` | no |
| website_config | Configuration if the bucket acts as a website. | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of bucket. |
| self_link | The URI of the created resource. |
| url | The base URL of the bucket, in the format gs://<bucket-name>. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
