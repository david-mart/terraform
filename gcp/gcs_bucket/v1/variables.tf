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

variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects."
  default     = "false"
}

variable "lifecycle_rules" {
  description = "The bucket's Lifecycle Rules configuration. A list of multiple blocks of this type are permitted. See module example."
  default     = []
  type        = "list"
}

variable "name" {
  description = "The name of the bucket. Must be unique across all GCS buckets."
  type        = "string"
}

variable "project_id" {
  description = "The ID of the google project to which the resource belongs. If it is not provided, the provider project is used."
  default     = ""
}

variable "region" {
  description = "The GCS region. If it is not provided, the provider region is used."
  default     = ""
}

variable "role_entities" {
  default     = []
  description = "List of role/entity pairs in the form ROLE:entity. See [GCS Bucket ACL documentation](https://cloud.google.com/storage/docs/json_api/v1/bucketAccessControls) for more details. Must be set if predefined_acl is not."
  type        = "list"
}

variable "storage_class" {
  description = "The Storage Class of the new bucket. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE."
  default     = "REGIONAL"
}

variable "versioning" {
  description = "Enable bucket versioning. True or False"
  type        = "string"
  default     = false
}

variable "website_config" {
  description = "Configuration if the bucket acts as a website. This is a list of maps."
  default     = []
  type        = "list"
}
