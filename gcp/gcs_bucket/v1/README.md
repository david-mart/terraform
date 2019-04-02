# Terraform Module

gcs_bucket

## Module Example

```HCL

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

### Example when hosting a website
To create a public website, domain ownership must be established with Google
and the terraform service account must be added as an owner for the domain.

There are multiple places to update. Instructions for both are listed below:
* https://cloud.google.com/storage/docs/domain-name-verification#who-can-create
* https://cloud.google.com/endpoints/docs/openapi/verify-domain-name

```HCL
module "gcs_bucket" {
  source         = "git@github.com:sadasystems/terraform_modules.git//gcp/gcs_bucket/v1"
  name           = "www.foo.dev"
  region         = "us-west2"
  storage_class  = "REGIONAL"
  versioning     = true

  website_config = [{
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| force\_destroy | When deleting a bucket, this boolean option will delete all contained objects. | string | `"false"` | no |
| lifecycle\_rules | The bucket's Lifecycle Rules configuration. A list of multiple blocks of this type are permitted. See module example. | list | `<list>` | no |
| name | The name of the bucket. Must be unique across all GCS buckets. | string | n/a | yes |
| project\_id | The ID of the google project to which the resource belongs. If it is not provided, the provider project is used. | string | `""` | no |
| region | The GCS region. If it is not provided, the provider region is used. | string | `""` | no |
| role\_entities | List of role/entity pairs in the form ROLE:entity. See [GCS Bucket ACL documentation](https://cloud.google.com/storage/docs/json_api/v1/bucketAccessControls) for more details. Must be set if predefined_acl is not. | list | `<list>` | no |
| storage\_class | The Storage Class of the new bucket. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE. | string | `"REGIONAL"` | no |
| versioning | Enable bucket versioning. True or False | string | `"false"` | no |
| website\_config | Configuration if the bucket acts as a website. This is a list of maps. | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of bucket. |
| self\_link | The URI of the created resource. |
| url | The base URL of the bucket, in the format gs://<bucket-name>. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
