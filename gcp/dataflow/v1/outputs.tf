output job_state {
  description = "The current state of the resource, selected from the JobState enum"
  value       = "${google_dataflow_job.default.state}"
}
