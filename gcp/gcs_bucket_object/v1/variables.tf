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

variable "object_list" {
  description = "A list of maps with two keys \"source\" and \"destination\", specifying where files are to be uploaded to the specified bucket, and where in the bucket to put them."
  type        = "list"
}

variable "bucket_name" {
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
  description = "List of role/entity pairs to assign to the object in the form ROLE:entity. See [GCS Bucket ACL documentation](https://cloud.google.com/storage/docs/json_api/v1/bucketAccessControls) for more details."
  type        = "list"
}
