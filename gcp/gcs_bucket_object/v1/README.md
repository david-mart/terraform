# Terraform Module

gcs_bucket_object

## Description

This module can be used to create new object(s) inside an existing bucket in Google cloud storage service (GCS). You can also assign object-level role entity permissions. The module is not intended for use as a general file/object manager like gsutils. The main use-case is to assist with general provisioning steps, where some files are needed to be populated in GCS buckets in order for the associated provisioning steps to be considered complete.  For example, a Dataflow job that needs to reference a file from a bucket.

## Source Files

It's important to include the files you wish to be uploaded to the bucket.  In the example below, there is a files/ in the terraform source directory where the files to be upload are stored, but it's up to you where you want to store the files, as long as the file is accessible to the module.

## Destroy behavior

When performing a `terraform destroy` the objects that were created will be removed from the referenced bucket.

### A note about object_list variable

The variable `object_list` is of type list, however the type is used in a more complex format with maps to denote the "source" and "destination" locations. Check out the example below to see the proper syntax. So for each file that you wish to upload, you should create one map inside the list, with "source" and "destination" keys/values in each.

## Paths and Directories

Destination paths are relative to the top-level bucket location.

To create "directories" inside the buckets, be sure to prepend the desired directory name with a trailing slash before the filename in the "destination" key.

For example:
```
<my bucket>
file.txt
myfolder/myfile.txt
```
etc.

## Module Example

```bash

module "upload_objects" {
  source                  = "git@github.com:sadasystems/gcp_tf_modules.git//gcp/gcs_bucket_object/v1"
  bucket_name             = "mybucket"
  object_list = [
    {
      source = "files/file1.json",
      destination = "folder1/file1.json"
    },
    {
      source = "files/file2.js",
      destination = "folder2/file2.js"
    },
    {
      source = "files/file3.txt",
      destination = "file3.txt"
    }
  ]
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket_name | The name of the bucket. Must be unique across all GCS buckets. | string | - | yes |
| object_list | A list of maps with two keys "source" and "destination", specifying where files are to be uploaded to the specified bucket, and where in the bucket to put them. | list | - | yes |
| project_id | The ID of the google project to which the resource belongs. If it is not provided, the provider project is used. | string | `` | no |
| region | The GCS region. If it is not provided, the provider region is used. | string | `` | no |
| role_entities | List of role/entity pairs to assign to the object in the form ROLE:entity. See [GCS Bucket ACL documentation](https://cloud.google.com/storage/docs/json_api/v1/bucketAccessControls) for more details. | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| object_name | The name of the object. |
| self_link | A url reference to this object. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
