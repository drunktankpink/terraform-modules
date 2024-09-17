variable service_name {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable description {
  description = "Descriptor for resources"
  type        = string
}

variable environment {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable vpc_id {
  description = "VPC ID for security group"
  type        = string
}

variable tags {
  description = "Additional tags to apply to the security group"
  type        = map(string)
  default     = {}
}