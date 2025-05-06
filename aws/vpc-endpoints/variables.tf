variable "vpc_id" {
  description = "VPC ID for VPC Endpoints (e.g. 'vpc-abcd1234)"
  type = string
}

variable "gateway_vpc_endpoints" {
  description = "A map of Gateway VPC endpoints to provision into the VPC. A map of object with the following attribules: 'name' (e.g. 's3' or 'dynamodb'); 'policy' (this is optional and can be specified as 'null')"
  type = map(object({
    name = string
    policy = string
  }))
  default = {}
}

variable "interface_vpc_endpoints" {
  description = "A Map of Interface VPC endpoints to provision into the VPC. A map of objects with the following attribules: 'name', 'security_group_ids', 'private_dns_enabled' are required. 'policy' and 'subnet'ids' are optional and can be specified as 'null' or as an empty list."
  type = map(object({
    name = string
    subnet_ids = list(string)
    policy = string
    security_group_ids = list(string)
    private_dns_enabled = bool
  }))
  default = {}
}