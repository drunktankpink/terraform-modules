variable service_name {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable description {
  description = "Descriptor for resources"
  type        = string
}

variable vpc {
  description = "VPC ID for security group"
  type        = string
}

variable from_port {
  description = "From port for security group rule"
  type        = number
}

variable to_port {
  description = "To port for security group rule"
  type        = number
}

variable protocol {
  description = "Protocol for security group rule"
  type        = string
}

variable cidr_blocks {
  description = "CIDR blocks for security group rules"
  type        = list
}