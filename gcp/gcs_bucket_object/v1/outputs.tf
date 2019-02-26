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

output "self_link" {
  value       = "${google_storage_bucket_object.default.*.self_link}"
  description = "A url reference to this object."
}

output "object_name" {
  value       = "${google_storage_bucket_object.default.*.output_name}"
  description = "The name of the object."
}
