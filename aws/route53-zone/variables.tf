
variable zone_name {
  description = "The name of the Route 53 hosted zone"
  type        = string
}

variable vpc_id {
  description = "The VPC ID for private zones (if applicable)"
  type        = string
  default     = null
}

variable environment {
  description = "Environment (e.g. dev, test, prod)"
  type        = string
}

variable project_name {
  description = "The project this hosted zone is associated with"
  type        = string
}

variable owner {
  description = "Owner of the hosted zone"
  type        = string
}

variable additional_tags {
  description = "Additional tags to apply to the hosted zone"
  type        = map(string)
  default     = {}
}
