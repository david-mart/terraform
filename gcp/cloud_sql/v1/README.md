<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| activation_policy | This specifies when the instance should be active. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`. | string | `ALWAYS` | no |
| authorized_gae_applications | A list of Google App Engine (GAE) project names that are allowed to access this instance. | list | `<list>` | no |
| backup_configuration | The backup_configuration settings subblock for the database setings | map | `<map>` | no |
| database_flags | List of Cloud SQL flags that are applied to the database server | string | `<list>` | no |
| database_version | The version of of the database. For example, `MYSQL_5_6` or `POSTGRES_9_6`. | string | `MYSQL_5_6` | no |
| databases | A map of database names to create. | list | `<list>` | no |
| db_charset | The charset for the default database | string | `` | no |
| db_collation | The collation for the default database. Example for MySQL databases: 'utf8_general_ci', and Postgres: 'en_US.UTF8' | string | `` | no |
| db_name | Name of the default database to create | string | `default` | no |
| disk_autoresize | Second Generation only. Configuration to increase storage size automatically. | string | `true` | no |
| disk_size | Second generation only. The size of data disk, in GB. Size of a running instance cannot be reduced but can be increased. | string | `10` | no |
| disk_type | Second generation only. The type of data disk: `PD_SSD` or `PD_HDD`. | string | `PD_SSD` | no |
| instance_name | Name for the database instance. Must be unique and cannot be reused for up to one week. | string | `` | no |
| ip_configuration | The ip_configuration settings subblock | list | `<list>` | no |
| location_preference | The location_preference settings subblock | list | `<list>` | no |
| maintenance_window | The maintenance_window settings subblock | list | `<list>` | no |
| master_instance_name | The name of the master instance to replicate | string | `` | no |
| network | Name of the network to deploy instances to. | string | - | yes |
| peering_address_range_name | The name of the address range reservation. | string | - | yes |
| peering_cidr_prefix | Specify a prefix length (subnet mask), which will determine the range to use with {peering_cidr_range}. | string | - | yes |
| peering_cidr_range | The CIDR ip address range (minus prefix) of one or more allocated ranges to assign for vpc peering with Google managed services. | string | - | yes |
| pricing_plan | First generation only. Pricing plan for this instance, can be one of `PER_USE` or `PACKAGE`. | string | `PER_USE` | no |
| project_id | The name of the project | string | `` | no |
| region | GC region | string | - | yes |
| replica_configuration | The optional replica_configuration block for the database instance | list | `<list>` | no |
| replication_type | Replication type for this instance, can be one of `ASYNCHRONOUS` or `SYNCHRONOUS`. | string | `SYNCHRONOUS` | no |
| target_tags | Tag added to instances for firewall and networking. | list | `<list>` | no |
| tier | The machine tier (First Generation) or type (Second Generation). See this page for supportedtiers and pricing: https://cloud.google.com/sql/pricing | string | `db-f1-micro` | no |
| user_host | The host for the default user | string | `%` | no |
| user_name | The name of the default user | string | `default` | no |
| user_password | The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable. | string | `` | no |
| zone | GC zone | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| generated_user_password | The auto generated default user password if no input password was provided |
| instance_address | The IPv4 address of the master database instnace |
| instance_address_time_to_retire | The time the master instance IP address will be reitred. RFC 3339 format. |
| instance_name | The name of the database instance |
| self_link | Self link to the master instance |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
