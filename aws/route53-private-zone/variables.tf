variable "zone_names" {
  description = "List of private hosted zone names to create (e.g., ['dev.internal.company.com'])"
  type        = list(string)
}

variable "vpc_ids" {
  description = "List of VPC IDs to associate with each private hosted zone"
  type        = list(string)
  validation {
    condition     = length(var.vpc_ids) > 0
    error_message = "At least one VPC ID must be provided for private zone association"
  }
}

variable "environment" {
  description = "Environment (e.g. dev, test, prod)"
  type        = string
}

variable "project_name" {
  description = "The project this hosted zone is associated with"
  type        = string
}

variable "owner" {
  description = "Owner of the hosted zone"
  type        = string
}

variable "additional_tags" {
  description = "Additional tags to apply to the hosted zone"
  type        = map(string)
  default     = {}
}