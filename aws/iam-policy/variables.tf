variable "service_name" {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable "description" {
  description = "Descriptor for resources"
  type        = string
}

variable "policy_path" {
  description = "The name policy path"
  type        = string
  default     = "/"
}

variable "role_name" {
  description = "The name of the IAM role this policy will be attached to"
  type        = string
}

variable "actions" {
  description = "List of actions allowed by the policy"
  type        = list(string)
}

variable "resources" {
  description = "List of resources the policy grants access to"
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