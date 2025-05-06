variable "service_name" {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable "description" {
  description = "Descriptor for resources"
  type        = string
}

variable "environment" {
  description = "Environment (e.g. dev, test, prod)"
  type        = string
}

variable "project_name" {
  description = "The project this IAM role is associated with"
  type        = string
}

variable "assume_role_principals" {
  description = "List of services allowed to assume this role (e.g., 'ec2.amazonaws.com')"
  type        = list(string)
}

variable "owner" {
  description = "Owner of the IAM role"
  type        = string
}

variable "additional_tags" {
  description = "Additional tags to apply to the IAM role"
  type        = map(string)
  default     = {}
}