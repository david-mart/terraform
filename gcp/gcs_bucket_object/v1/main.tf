#
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

data "google_client_config" "current" {}

locals {
  location   = "${var.region != "" ? var.region : data.google_client_config.current.region}"
  project_id = "${var.project_id != "" ? var.project_id : data.google_client_config.current.project}"
}

data "google_project" "current" {
  project_id = "${local.project_id}"
}

locals {
  default_role_entities = [
    "OWNER:project-owners-${data.google_project.current.number}",
    "READER:project-viewers-${data.google_project.current.number}",
  ]
}

resource "google_storage_bucket_object" "default" {
  count  = "${length(var.object_list)}"
  bucket = "${var.bucket_name}"
  name   = "${lookup(var.object_list[count.index],"destination")}"
  source = "${lookup(var.object_list[count.index],"source")}"
}

resource "google_storage_object_acl" "default" {
  count       = "${length(var.object_list)}"
  bucket      = "${var.bucket_name}"
  object      = "${lookup(var.object_list[count.index],"destination")}"
  role_entity = ["${concat(local.default_role_entities, var.role_entities)}"]
  depends_on  = ["google_storage_bucket_object.default"]
}
