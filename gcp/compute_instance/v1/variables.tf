variable "region" {
  description = "GC region"
  default     = "europe-west4"
}

variable "zone" {
  description = "GC zone"
  default     = "europe-west4-c"
}

variable "amount" {
  description = "Number of VMs"
  default     = "1"
}

variable "name_prefix" {
  description = "hostname format: name_prefix-amount"
  default     = "vm"
}

variable "machine_type" {
  description = "List of VM sizes: https://github.com/Eimert/terraform-google-compute-engine-instance#machine_type"
  default     = "n1-standard-2"
}

variable project_id {
  description = "The name of the project"
}

variable target_tags {
  description = "Tag added to instances for firewall and networking."
  type        = "list"
  default     = ["allow-internal-ssh"]
}

/*
variable "user_data" {
  description = "VM description."
  default = "Managed by terraform plan https://github.com/Eimert/terraform-google-compute-engine-instance"
}
*/

variable "address_type" {
  description = "The type of address to reserve, either INTERNAL or EXTERNAL."
  default     = "INTERNAL"
}

variable "disk_type" {
  description = "pd-standard or pd-ssd"
  default     = "pd-standard"
}

variable "disk_size" {
  description = "Primary disk' size in GB"
  default     = "20"
}

variable "disk_image" {
  description = "[Available OS images/templates](https://cloud.google.com/compute/docs/images)"
  default     = "centos-cloud/centos-7"
}

variable disk1_disk_auto_delete {
  description = "Whether or not the disk1 should be auto-deleted."
  default     = true
}

variable disk1_disk_type {
  description = "The disk1 tmp disk type. Can be either pd-ssd, local-ssd, or pd-standard."
  default     = "pd-ssd"
}

variable "disk1_source_img" {
  description = "The URL (self_link) of the source image to build the disk from."
  type        = "string"
}

variable disk1_size_gb {
  description = "The size of the tmp disk in gigabytes."
  default     = 0
}

variable disk2_disk_auto_delete {
  description = "Whether or not the disk2 should be auto-deleted."
  default     = true
}

variable disk2_disk_type {
  description = "The disk2  disk type. Can be either pd-ssd, local-ssd, or pd-standard."
  default     = "pd-ssd"
}

variable disk2_size_gb {
  description = "The size of the disk in gigabytes."
  default     = 0
}

variable "disk2_source_img" {
  description = "The URL (self_link) of the source image to build the disk from."
  type        = "string"
}

variable "disk_create_local_exec_command_or_fail" {
  default = ":"
}

variable "disk_create_local_exec_command_and_continue" {
  default = ":"
}

variable "disk_destroy_local_exec_command_or_fail" {
  default = ":"
}

variable "disk_destroy_local_exec_command_and_continue" {
  default = ":"
}

variable "automatic_restart" {
  description = "Allow google cloud to restart VM for patching (recommended)."
  default     = "true"
}

variable network {
  description = "Name of the network to deploy instances to."
  default     = "default"
}

variable subnetwork {
  description = "The subnetwork to deploy to"
  default     = "default"
}

/*
variable "dns_name" {
  description = "Descriptive name for dns_zone. Use module google-managed-dns-zone to create."
}

variable "dns_zone" {
  description = "The DNS zone that is pointing to Google' nameservers (if any). A.k.a. Google' DNS SOA (start of authority). Required suffix: . (dot). Use module google-managed-dns-zone to create."
}

variable "dns_record_name" {
  description = "DNS record type == A. For example: 'tower-dev' will become tower-dev.cloud.example.com"
}
*/


/*
variable "username" {
  description = "username of user account to be created"
  default = "google"
}
*/


/*
variable "public_key_path" {
  description = "Only private-key auth is enabled by default. Use `ssh-keygen -t rsa` to generate a public-private keypair."
  default = "~/.ssh/id_rsa.pub"
}
*/

