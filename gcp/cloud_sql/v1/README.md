
# Terraform Module

cloud_sql (for private network)

## Description

This module creates a GCP CLoud SQL Instance with any number of included databases.  For the private IP allocation to work correctly, you must first allocate the private IP range.  You can use the GCP Terraform module located in this repo: [network-private-ip]( https://github.com/sadasystems/terraform_modules/tree/feature/EN-34-cloud-sql-update-2/gcp/network-private-ip/v1) to accomplish this.  You must also set ipv4_enabld to "" or false.

A note about instance names.  It is strongly-recommended to add a random string to the instance name, as unique instance names are required by the Cloud SQL service. See below for example.

## Module Example - Cloud SQL w/ Private IP Networking

```HCL

resource "random_id" "name" {
  byte_length = 2
}

module "database" {
  source                = "git@github.com:sadasystems/terraform_modules.git//gcp/cloud_sql/v1"
  project_id            = "my-project"
  region                = "us-west2"
  network               = "my-network"
  zone                  = "us-west2-a"
  instance_name         = "gcp-cloudsql-postgresql-${random_id.name.hex}"
  database_version      = "POSTGRES_9_6"
  tier                  = "db-f1-micro"
  disk_type             = "PD_SSD"
  disk_size             = "100"
  availability_type     = "REGIONAL"
  replication_type      = "SYNCHRONOUS"
  maintenance_window = [{
    day          = 7
    hour         = 23
    update_track = "stable"
  }]
  backup_configuration = [{
    enabled            = true
    start_time         = "02:00"
  }]
  databases = [
    {
      "db_name"      = "lighthousedb"
      "db_user"      = "lighthouse"
      "db_charset"   = "utf8"
      "db_collation" = "en_US.UTF8"
    }
  ]
  database_flags = [
    {
      name  = "autovacuum"
      value = "on"
    }
  ]
  peering_address_range_name = "google-private-ip"
  ipv4_enabled               = false
  service_networking_enabled = true
  require_ssl                = false
}
```

## Module Example - Cloud SQL w/ Public IP Networking

```HCL

resource "random_id" "name" {
  byte_length = 2
}

module "database" {
  source                = "git@github.com:sadasystems/terraform_modules.git//gcp/cloud_sql/v1"
  project_id            = "my-project"
  region                = "us-west2"
  network               = "my-network"
  zone                  = "us-west2-a"
  instance_name         = "gcp-cloudsql-postgresql-${random_id.name.hex}"
  database_version      = "POSTGRES_9_6"
  tier                  = "db-f1-micro"
  disk_type             = "PD_SSD"
  disk_size             = "100"
  availability_type     = "REGIONAL"
  replication_type      = "SYNCHRONOUS"
  maintenance_window = [{
    day          = 7
    hour         = 23
    update_track = "stable"
  }]
  backup_configuration = [{
    enabled            = true
    start_time         = "02:00"
  }]
  databases = [
    {
      "db_name"      = "lighthousedb"
      "db_user"      = "lighthouse"
      "db_charset"   = "utf8"
      "db_collation" = "en_US.UTF8"
    }
  ]
  database_flags = [
    {
      name  = "autovacuum"
      value = "on"
    }
  ]
  peering_address_range_name = "google-private-ip"
  ipv4_enabled               = true
  service_networking_enabled = false
  require_ssl                = false
}
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| activation\_policy | This specifies when the instance should be active. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`. | string | `"ALWAYS"` | no |
| authorized\_gae\_applications | A list of Google App Engine (GAE) project names that are allowed to access this instance. | list | `<list>` | no |
| availability\_type | (Optional) This specifies whether a PostgreSQL instance should be set up for high availability (REGIONAL) or single zone (ZONAL). | string | `"REGIONAL"` | no |
| backup\_configuration | The backup_configuration settings subblock for the database setings | map | `<map>` | no |
| database\_flags | List of Cloud SQL flags that are applied to the database server | list | `<list>` | no |
| database\_version | The version of of the database. For example, `MYSQL_5_6` or `POSTGRES_9_6`. | string | `"MYSQL_5_6"` | no |
| databases | A map of database names to create. | list | `<list>` | no |
| db\_charset | The charset for the default database | string | `""` | no |
| db\_collation | The collation for the default database. Example for MySQL databases: 'utf8_general_ci', and Postgres: 'en_US.UTF8' | string | `""` | no |
| db\_name | Name of the default database to create | string | `"default"` | no |
| disk\_autoresize | Second Generation only. Configuration to increase storage size automatically. | string | `"true"` | no |
| disk\_size | Second generation only. The size of data disk, in GB. Size of a running instance cannot be reduced but can be increased. | string | `"10"` | no |
| disk\_type | Second generation only. The type of data disk: `PD_SSD` or `PD_HDD`. | string | `"PD_SSD"` | no |
| instance\_name | Name for the database instance. Must be unique and cannot be reused for up to one week. | string | `""` | no |
| ip\_configuration | The ip_configuration settings subblock | list | `<list>` | no |
| ipv4\_enabled | (Optional) Whether this Cloud SQL instance should be assigned a public IPV4 address. Either ipv4_enabled must be enabled or a private_network must be configured. | string | `""` | no |
| location\_preference | The location_preference settings subblock | list | `<list>` | no |
| maintenance\_window | The maintenance_window settings subblock | list | `<list>` | no |
| master\_instance\_name | The name of the master instance to replicate | string | `""` | no |
| network\_link | The self_link of the network to deploy instances to. | string | n/a | yes |
| peering\_address\_range\_name | The name of the address range reservation. | string | n/a | yes |
| pricing\_plan | First generation only. Pricing plan for this instance, can be one of `PER_USE` or `PACKAGE`. | string | `"PER_USE"` | no |
| project\_id | The name of the project | string | `""` | no |
| region | GC region | string | n/a | yes |
| replica\_configuration | The optional replica_configuration block for the database instance | list | `<list>` | no |
| replication\_type | Replication type for this instance, can be one of `ASYNCHRONOUS` or `SYNCHRONOUS`. | string | `"SYNCHRONOUS"` | no |
| require\_ssl | (Optional) True if mysqld should default to REQUIRE X509 for users connecting over IP. | string | `"false"` | no |
| service\_networking\_enabled | (Conditional) True if you wish to enable vpc peering with the google service network. This is REQUIRED to be true if you are using private IPs. | string | `"true"` | no |
| target\_tags | Tag added to instances for firewall and networking. | list | `<list>` | no |
| tier | The machine tier (First Generation) or type (Second Generation). See this page for supportedtiers and pricing: https://cloud.google.com/sql/pricing | string | `"db-f1-micro"` | no |
| user\_host | The host for the default user. Only set this for MySQL databases. It will be ignored for PostgreSQL databases | string | `"%"` | no |
| user\_name | The name of the default user | string | `"default"` | no |
| user\_password | The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable. | string | `""` | no |
| zone | GC zone | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| generated\_user\_password | The auto generated default user password if no input password was provided |
| instance\_address | The IPv4 address of the master database instnace |
| instance\_address\_time\_to\_retire | The time the master instance IP address will be reitred. RFC 3339 format. |
| instance\_name | The name of the database instance |
| self\_link | Self link to the master instance |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
