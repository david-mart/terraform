variable "region" {
  description = "GC region"
}

variable "zone" {
  description = "GC zone"
}

variable project_id {
  description = "The name of the project"
  default     = ""
}

variable target_tags {
  description = "Tag added to instances for firewall and networking."
  type        = "list"
  default     = ["allow-internal-ssh"]
}

variable network {
  description = "Name of the network to deploy instances to."
}

variable instance_name {
  description = "Name for the database instance. Must be unique and cannot be reused for up to one week."
  default     = ""
}

variable database_version {
  description = "The version of of the database. For example, `MYSQL_5_6` or `POSTGRES_9_6`."
  default     = "MYSQL_5_6"
}

variable master_instance_name {
  description = "The name of the master instance to replicate"
  default     = ""
}

variable tier {
  description = "The machine tier (First Generation) or type (Second Generation). See this page for supportedtiers and pricing: https://cloud.google.com/sql/pricing"
  default     = "db-f1-micro"
}

variable db_name {
  description = "Name of the default database to create"
  default     = "default"
}

variable "databases" {
  description = "A map of database names to create."
  type        = "list"
  default     = []
}

variable db_charset {
  description = "The charset for the default database"
  default     = ""
}

variable db_collation {
  description = "The collation for the default database. Example for MySQL databases: 'utf8_general_ci', and Postgres: 'en_US.UTF8'"
  default     = ""
}

variable user_name {
  description = "The name of the default user"
  default     = "default"
}

variable user_host {
  description = "The host for the default user"
  default     = "%"
}

variable user_password {
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
  default     = ""
}

variable activation_policy {
  description = "This specifies when the instance should be active. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`."
  default     = "ALWAYS"
}

variable authorized_gae_applications {
  description = "A list of Google App Engine (GAE) project names that are allowed to access this instance."
  type        = "list"
  default     = []
}

variable disk_autoresize {
  description = "Second Generation only. Configuration to increase storage size automatically."
  default     = true
}

variable disk_size {
  description = "Second generation only. The size of data disk, in GB. Size of a running instance cannot be reduced but can be increased."
  default     = 10
}

variable disk_type {
  description = "Second generation only. The type of data disk: `PD_SSD` or `PD_HDD`."
  default     = "PD_SSD"
}

variable pricing_plan {
  description = "First generation only. Pricing plan for this instance, can be one of `PER_USE` or `PACKAGE`."
  default     = "PER_USE"
}

variable availability_type {
  description = "(Optional) This specifies whether a PostgreSQL instance should be set up for high availability (REGIONAL) or single zone (ZONAL)."
  default     = "REGIONAL"
}

variable replication_type {
  description = "Replication type for this instance, can be one of `ASYNCHRONOUS` or `SYNCHRONOUS`."
  default     = "SYNCHRONOUS"
}

variable database_flags {
  description = "List of Cloud SQL flags that are applied to the database server"
  default     = []
}

variable backup_configuration {
  description = "The backup_configuration settings subblock for the database setings"
  type        = "map"
  default     = {}
}

variable ip_configuration {
  description = "The ip_configuration settings subblock"
  type        = "list"
  default     = [{}]
}

variable location_preference {
  description = "The location_preference settings subblock"
  type        = "list"
  default     = []
}

variable maintenance_window {
  description = "The maintenance_window settings subblock"
  type        = "list"
  default     = []
}

variable replica_configuration {
  description = "The optional replica_configuration block for the database instance"
  type        = "list"
  default     = []
}

variable peering_cidr_range {
  description = "The CIDR ip address range (minus prefix) of one or more allocated ranges to assign for vpc peering with Google managed services."
  type        = "string"
}

variable peering_cidr_prefix {
  description = "Specify a prefix length (subnet mask), which will determine the range to use with {peering_cidr_range}."
  type        = "string"
}

variable "peering_address_range_name" {
  description = "The name of the address range reservation."
  type        = "string"
}

variable "ipv4_enabled" {
  description = "(Optional) Whether this Cloud SQL instance should be assigned a public IPV4 address. Either ipv4_enabled must be enabled or a private_network must be configured."
  type        = "string"
  default     = "true"
}

variable "require_ssl" {
  description = "(Optional) True if mysqld should default to REQUIRE X509 for users connecting over IP."
  type        = "string"
  default     = "false"
}
