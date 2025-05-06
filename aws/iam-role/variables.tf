variable "service_name" {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable "description" {
  description = "Descriptor for resources"
  type        = string
}

variable "assume_role_principals" {
  description = "List of services allowed to assume this role (e.g., 'ec2.amazonaws.com')"
  type        = list(string)
}

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

variable "additional_tags" {
  description = "A map of common tags to add to all resources"
  type        = map(string)
  default     = {}
}