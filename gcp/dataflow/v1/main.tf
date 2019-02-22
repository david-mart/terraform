resource "google_dataflow_job" "default" {
  name              = "${var.job_name}"
  template_gcs_path = "${var.template_gcs_path}"
  temp_gcs_location = "${var.temp_gcs_location}"
  parameters        = "${var.job_parameters}"
  max_workers       = "${var.max_workers}"
  on_delete         = "${var.on_delete}"
}
