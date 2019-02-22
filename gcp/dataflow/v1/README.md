# Terraform Module

dataflow

## Description

This module creates a single Google Cloud Dataflow job.

## Module Calling Example

```bash

module "dataflow" {
  source                = "git@github.com:sadasystems/terraform_modules.git//gcp/dataflow_job/v1"
  job_name              = "my-dataflow-job"
  template_gcs_path     = "gs://my-bucket/templates/template_file"
  temp_gcs_location     = "gs://my-bucket/tmp_dir"
  job_parameters {
    foo = "bar"
  }
  max_workers           = 5
  on_delete             = "drain"

}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| job_name | A unique name for the resource, required by Dataflow | string | - | yes |
| job_parameters | (Optional) Map of key/value pairs to be passed to the Dataflow job (as used in the template). | map | `<map>` | no |
| max_workers | (Optional) The number of workers permitted to work on the job. More workers may improve processing speed at additional cost. | string | `1` | no |
| on_delete | (Optional) One of [drain] or [cancel]. Specifies behavior of deletion during terraform destroy.  If cancelled, the job terminates - any data written remains where it is, but no new data will be processed. If drained, no new data will enter the pipeline, but any data currently in the pipeline will finish being processed.i The default is cancelled, but if a user sets on_delete to drain in the configuration, you may experience a long wait for your terraform destroy to complete. | string | `cancel` | no |
| temp_gcs_location | A writeable location on GCS for the Dataflow job to dump its temporary data. | string | - | yes |
| template_gcs_path | The GCS path to the Dataflow job template. | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| job_state | The current state of the resource, selected from the JobState enum |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->