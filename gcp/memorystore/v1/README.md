Memorystore
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| authorized\_network | The full name of the network to which the instance will be connected | string | n/a | yes |
| display\_name | The display name for the MemoryStore instance | string | n/a | yes |
| memory\_size | Redis memory size in GiB | string | n/a | yes |
| name | The name for the MemoryStore instance | string | n/a | yes |
| redis\_version | The version of Redis software. Only available value is REDIS_3_2 | string | `"REDIS_3_2"` | no |
| region | The region where MemoryStore server(s) will be created | string | `"us-central1"` | no |
| reserved\_ip\_range | The CIDR range of internal addresses reserved for this instance. Ranges should be unique and not overlapping with subnets in the network or with other MemoryStore instances. The range should be a /29 block. | string | n/a | yes |
| tier | The service tier of the instance. Must be either 'BASIC' (standalone server) or 'STANDARD_HA'(primary with replica) | string | `"STANDARD_HA"` | no |

## Outputs

| Name | Description |
|------|-------------|
| redis\_host | hostname or ip address for the redis endpoint |
| redis\_port | the port for the redis endpoint |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
