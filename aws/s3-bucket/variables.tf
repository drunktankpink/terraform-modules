variable service_name {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable description {
  description = "Descriptor for the S3 bucket (e.g. logs, backups)"
  type        = string
}

variable access_level {
  description = "Set if bucket ACL is public or private"
  type        = string
  default     = "private"
}

variable versioning_enabled {
  description = "Set versioning to enabled or disabled"
  type        = bool
  default     = true
}

variable encryption_algorithm {
  description = "The server-side encryption algorithm to use (e.g., AES256, aws:kms)"
  type        = string
  default     = "AES256"
}

variable environment {
  description = "Environment (e.g. dev, test, prod)"
  type        = string
}

variable project_name {
  description = "The project this IAM role is associated with"
  type        = string
}

variable owner {
  description = "Owner of the IAM role"
  type        = string
}

variable additional_tags {
  description = "Additional tags to apply to the IAM role"
  type        = map(string)
  default     = {}
}