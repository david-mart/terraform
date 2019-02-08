#
# This tfvars file is mainly used for testing the module locally for dev work.
# 
network_name = "test-vpc"

subnets = [
  {
    subnet_name = "subnet-red-172-16-1-0-24"
    subnet_ip   = "172.16.1.0/24"
  },
  {
    subnet_name           = "subnet-blue-172-16-2-0-22"
    subnet_ip             = "172.16.2.0/22"
    subnet_private_access = "true"
    subnet_flow_logs      = "true"
  },
  {
    subnet_name   = "subnet-red-172-16-3-0-24"
    subnet_ip     = "172.16.2.0/24"
    subnet_region = "us-west2"
  },
  {
    subnet_name           = "subnet-blue-172-16-4-0-22"
    subnet_ip             = "172.16.4.0/22"
    subnet_private_access = "true"
    subnet_flow_logs      = "true"
  },
]

secondary_ranges = {
  subnet-blue-172-16-2-0-24 = [
    {
      range_name    = "subnet-blue-172-16-2-0-22-secondary-01"
      ip_cidr_range = "192.168.64.0/24"
    },
    {
      range_name    = "subnet-blue-172-16-2-0-22-secondary-02"
      ip_cidr_range = "192.168.96.0/24"
    },
  ]
}
