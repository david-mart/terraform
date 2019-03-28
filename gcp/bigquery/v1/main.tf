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

resource "google_bigquery_dataset" "default" {
  dataset_id                 = "${var.dataset_id}"
  project                    = "${var.project_id}"
  friendly_name              = "${var.friendly_name}"
  description                = "${var.dataset_description}"
  location                   = "${var.geo_location}"
  delete_contents_on_destroy = "${var.delete_contents_on_destroy}"
  labels                     = "${var.dataset_labels}"
}

resource "google_bigquery_table" "default" {
  count             = "${length(var.table_list)}"
  project           = "${var.project_id}"
  dataset_id        = "${google_bigquery_dataset.default.dataset_id}"
  table_id          = "${lookup(var.table_list[count.index],"table_name")}"
  description       = "${lookup(var.table_list[count.index],"table_description")}"
  time_partitioning = "${var.time_partitioning}"
  labels            = "${var.table_labels}"
  schema            = "${file("${lookup(var.table_list[count.index],"json_schema_file")}")}"
  depends_on        = ["google_bigquery_dataset.default"]
}
