variable "environment" {
  description = "Environment the resource belongs to (e.g., dev, test, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be one of: dev, test, prod"
  }
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "owner" {
  description = "Owner of the resource"
  type        = string
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  validation {
    condition     = can(cidrhost(var.vpc_cidr_block, 0))
    error_message = "vpc_cidr_block must be a valid IPv4 CIDR block (e.g., 10.0.0.0/16)"
  }
}

variable "subnet_netbits" {
  description = "Netbits by which to extend vpc cidr"
  type        = number
  default     = 8
  validation {
    condition     = var.subnet_netbits >= 4 && var.subnet_netbits <= 12
    error_message = "subnet_netbits must be between 4 and 12 for sane subnetting"
  }
}

variable "instance_tenancy" {
  description = "The tenancy option for instances launched into the VPC"
  type        = string
  validation {
    condition     = contains(["default", "dedicated", "host"], var.instance_tenancy)
    error_message = "instance_tenancy must be one of: default, dedicated, or host"
  }
}

variable "enable_dns_support" {
  description = "Determine if DNS support is enabled/disabled in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Determine if DNS hostnames is enabled/disabled in the VPC"
  type        = bool
  default     = true
}

variable "map_public_ip_on_launch" {
  description = "Determine if public IPs are auto-assigned on launch for public subnets"
  type        = bool
  default     = true
}

variable "create_nat" {
  description = "Determine if a NAT gateway is to be created"
  type        = bool
  default     = false
}

variable "create_internet_gateway" {
  description = "Determine if an internet gateway is to be created"
  type        = bool
  default     = true
}

variable "create_default_security_group" {
  description = "Determine if a default security group is to be created"
  type        = bool
  default     = true
}

variable "create_vpc_flow_logs" {
  description = "Determine if VPC flow logs are to be created"
  type        = bool
  default     = false
}

variable "flow_logs_traffic_type" {
  description = "The type of traffic to log (ALL, ACCEPT, REJECT)"
  type        = string
  default     = "ALL"
  validation {
    condition     = contains(["ALL", "ACCEPT", "REJECT"], var.flow_logs_traffic_type)
    error_message = "flow_logs_traffic_type must be one of: ALL, ACCEPT, or REJECT"
  }
}

variable "flow_logs_destination_type" {
  description = "Destination type for VPC flow logs (cloud-watch-logs or s3)"
  type        = string
  default     = "s3"
  validation {
    condition     = contains(["s3", "cloud-watch-logs"], var.flow_logs_destination_type)
    error_message = "flow_logs_destination_type must be either 's3' or 'cloud-watch-logs'"
  }
}

variable "cloudwatch_log_retention_in_days" {
  description = "Number of days to retain CloudWatch logs (if using CloudWatch)"
  type        = number
  default     = 90
  validation {
    condition     = var.cloudwatch_log_retention_in_days >= 1 && var.cloudwatch_log_retention_in_days <= 3650
    error_message = "cloudwatch_log_retention_in_days must be between 1 and 3650 days"
  }
}

variable "additional_tags" {
  description = "A map of common tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "internet_gateway_tags" {
  description = "Additional tags for the internet gateway"
  type        = map(string)
  default     = {}
}

variable "nat_gateway_tags" {
  description = "Additional tags for the NAT gateway"
  type        = map(string)
  default     = {}
}

variable "eip_tags" {
  description = "Additional tags for elastic IPs"
  type        = map(string)
  default     = {}
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {}
}

variable "public_route_table_tags" {
  description = "Additional tags for the public route table"
  type        = map(string)
  default     = {}
}

variable "private_route_table_tags" {
  description = "Additional tags for the private route table"
  type        = map(string)
  default     = {}
}

variable "default_security_group_tags" {
  description = "Additional tags for the default security group"
  type        = map(string)
  default     = {}
}

variable "vpc_flow_logs_tags" {
  description = "Additional tags for the VPC flow logs"
  type        = map(string)
  default     = {}
}