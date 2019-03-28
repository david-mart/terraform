# Terraform Module

bigquery

## Description

This module is to create datasets and optionally to specify a list of BigQuery tables to generate inside the dataset.  The tables require an individual schema definition in file (json format).

## Table List

This module accepts the inclusion of a list of tables to create. The variable `object_list` is of type list, with a map of values for each table. The format of the map is as follows:

For each table you wish to create, the map must have three fields:

table_name:  A unique name for the resource.

table_description: The table description.

json_schema_file: The location on the filesystem where to find the json scheme definition of the table.  Must be readable/writable by the user executing terraform.

See the example below for full format.

## Paths and Directories

Destination paths are relative to the top-level location where the terraform is being executed.

## Module Example 1 - Create a dataset with two tables

```bash


module "big-query" {
  source                     = "git@github.com:sadasystems/terraform_modules.git//gcp/bigquery/v1"
  dataset_id                 = "my-dataset"
  friendly_name              = "Lots of Data"
  dataset_description        = "Very descriptive description"
  delete_contents_on_destroy =  true
  geo_location               = "US"
  dataset_labels             = {
    env = "production",
    data_type = "fintech"
  }
  time_partitioning = [
    {
      type = "DAY"
    }
  ]
  table_list                 = [
    {
      table_name = "table1",
      table_description = "my table description",
      json_schema_file = "files/table1.json"
    },
    {
      table_name = "table2",
      table_description = "my table description 2",
      json_schema_file = "files/table2.json"
    }
  ]
}

```


## Module Example 2 - Create just a dataset without tables

```bash


module "big-query" {
  source                     = "git@github.com:sadasystems/terraform_modules.git//gcp/bigquery/v1"
  dataset_id                 = "my-other-dataset"
  friendly_name              = "Just a Dataset"
  dataset_description        = "More descriptive description"
  delete_contents_on_destroy =  true
  geo_location               = "US"
  dataset_labels             = {
    env = "production",
    data_type = "adtech"
  }
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| dataset_description | (Optional) A user-friendly description of the dataset. | string | `` | no |
| dataset_id | A unique ID for the resource. Changing this forces a new resource to be created. | string | - | yes |
| dataset_labels | (Optional) A mapping of labels to assign to the dataset resource. | map | `<map>` | no |
| default_partition_expiration_ms | (Optional) The default partition expiration for all partitioned tables in the dataset, in milliseconds. Once this property is set, all newly-created partitioned tables in the dataset will have an expirationMs property in the timePartitioning settings set to this value, and changing the value will only affect new tables, not existing ones. | string | `` | no |
| default_table_expiration_ms | (Optional) The default lifetime of all tables in the dataset, in milliseconds. The minimum value is 3600000 milliseconds (one hour). | string | `` | no |
| delete_contents_on_destroy | (Optional) If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present. | string | `false` | no |
| friendly_name | (Optional) A descriptive name for the dataset. | string | `` | no |
| geo_location | (Optional) The geographic location where the dataset should reside. Possible regional values include: asia-east1, asia-northeast1, asia-southeast1 australia-southeast1, europe-north1, europe-west2 and us-east4. Possible multi-regional values:EU and US. | string | `US` | no |
| project_id | The ID of the google project to which the resource belongs. If it is not provided, the provider project is used. | string | `` | no |
| region | The GCS region. If it is not provided, the provider region is used. | string | `` | no |
| table_id | A unique ID for the resource. Changing this forces a new resource to be created. | string | `` | no |
| table_labels | (Optional) A mapping of labels to assign to the dataset resource. | map | `<map>` | no |
| table_list | (Optional) A list of maps with three keys "table_name", "table_description" and "json_schema_file", specifying which tables to create and the schema files denoting the table structure. | list | `<list>` | no |
| time_partitioning | (Optional) If specified, configures time-based partitioning for this table. | list | `<list>` | no |
| view | (Optional) If specified, configures this table as a view. | map | `<map>` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
