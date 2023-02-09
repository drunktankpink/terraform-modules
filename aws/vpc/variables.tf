variable vpc_name {
  description = "Name of VPC"
  type        = string
}

variable vpc_cidr_block {
  description = "CIDR block for VPC"
  type        = string
}

variable instance_tenancy {
  description = "The tenancy option for instances launched into the VPC"
  type        = string
}

variable subnet_netbits {
  description = "Netbits by which to extend vpc cidr"
  type        = number
  default     = 8
}

variable create_nat {
  description = "Determine if a NAT gateway is to be created"
  type        = bool
  default     = false
}

variable create_igw {
  description = "Determine if an internet gateway is to be created"
  type        = bool
  default     = true
}

variable enable_dns_support {
  description = "Decide if to enable/disable DNS support in the VPC"
  type        = bool
  default     = true
}

variable enable_dns_hostnames {
  description = "Decide if to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable create_default_security_group {
  description = "Controls if a default security group is created for the account"
  type        = bool
  default     = true
}

variable map_public_ip_on_launch {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  type        = bool
  default     = true
}

variable tags {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable vpc_tags {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable igw_tags {
  description = "Additional tags for the internet gateway"
  type        = map(string)
  default     = {}
}

variable public_subnet_tags {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {}
}

variable private_subnet_tags {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {}
}