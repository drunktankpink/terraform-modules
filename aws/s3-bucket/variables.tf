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

variable "service_name" {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable "description" {
  description = "Descriptor for the S3 bucket (e.g. logs, backups)"
  type        = string
}

variable "access_level" {
  description = "Set if bucket ACL is public or private"
  type        = string
  default     = "private"
}

variable "versioning_enabled" {
  description = "Set versioning to enabled or disabled"
  type        = bool
  default     = true
}

variable "encryption_algorithm" {
  description = "The server-side encryption algorithm to use (e.g., AES256, aws:kms)"
  type        = string
  default     = "AES256"
}