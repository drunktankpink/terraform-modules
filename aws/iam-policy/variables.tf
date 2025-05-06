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
  description = "Environment (e.g. dev, test, prod)"
  type        = string
}

variable "project_name" {
  description = "The project this IAM role is associated with"
  type        = string
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