#   Copyright 2019 Sada Systems Inc.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

variable "project_id" {
  description = "The ID of the google project to which the resource belongs. If it is not provided, the provider project is used."
  default     = ""
  type        = "string"
}

variable "region" {
  description = "The GCS region. If it is not provided, the provider region is used."
  type        = "string"
  default     = ""
}

variable "dataset_id" {
  description = "A unique ID for the resource. Changing this forces a new resource to be created."
  type        = "string"
}

variable "friendly_name" {
  description = "(Optional) A descriptive name for the dataset."
  type        = "string"
  default     = ""
}

variable "dataset_description" {
  description = "(Optional) A user-friendly description of the dataset."
  type        = "string"
  default     = ""
}

variable "delete_contents_on_destroy" {
  description = " (Optional) If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present."
  type        = "string"
  default     = false
}

variable "geo_location" {
  description = "(Optional) The geographic location where the dataset should reside. Possible regional values include: asia-east1, asia-northeast1, asia-southeast1 australia-southeast1, europe-north1, europe-west2 and us-east4. Possible multi-regional values:EU and US."
  type        = "string"
  default     = "US"
}

variable "default_partition_expiration_ms" {
  description = "(Optional) The default partition expiration for all partitioned tables in the dataset, in milliseconds. Once this property is set, all newly-created partitioned tables in the dataset will have an expirationMs property in the timePartitioning settings set to this value, and changing the value will only affect new tables, not existing ones. "
  type        = "string"
  default     = ""
}

variable "default_table_expiration_ms" {
  description = "(Optional) The default lifetime of all tables in the dataset, in milliseconds. The minimum value is 3600000 milliseconds (one hour)."
  type        = "string"
  default     = ""
}

variable "dataset_labels" {
  description = "(Optional) A mapping of labels to assign to the dataset resource."
  type        = "map"
  default     = {}
}

variable "table_id" {
  description = "A unique ID for the resource. Changing this forces a new resource to be created."
  type        = "string"
  default     = ""
}

variable "time_partitioning" {
  description = "(Optional) If specified, configures time-based partitioning for this table."
  type        = "list"
  default     = []
}

variable "view" {
  description = "(Optional) If specified, configures this table as a view."
  type        = "map"
  default     = {}
}

variable "table_labels" {
  description = "(Optional) A mapping of labels to assign to the dataset resource."
  type        = "map"
  default     = {}
}

variable "table_list" {
  description = "(Optional) A list of maps with three keys \"table_name\", \"table_description\" and \"json_schema_file\", specifying which tables to create and the schema files denoting the table structure."
  type        = "list"
  default     = []
}
