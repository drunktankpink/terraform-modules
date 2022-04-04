variable application {
  description = "Descriptor for bucket"
  type        = string
}

variable service_name {
  description = "Name of the service the bucket belongs to"
  type        = string
}

variable access_level {
  description = "Set if bucket ACL is public or private"
  type        = string
  default     = "private"
}

variable versioning_enabled {
  description = "Set versioning to enabled or disabled"
  type        = string
  default     = "enabled"
}