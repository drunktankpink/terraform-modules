variable "simple_records" {
  description = "Basic Route 53 records (e.g., A, CNAME, TXT)"
  type = list(object({
    name    = string
    type    = string
    ttl     = number
    zone_id = string
    records = list(string)
  }))
  default = []

  validation {
    condition = alltrue([
      for record in var.simple_records :
      contains(["A", "AAAA", "CNAME", "TXT", "MX", "SRV"], record.type)
    ])
    error_message = "Record type must be one of A, AAAA, CNAME, TXT, MX, or SRV."
  }

  validation {
    condition = alltrue([
      for record in var.simple_records : 
      record.ttl >= 60 && record.ttl <= 86400
    ])
    error_message = "TTL must be between 60 seconds and 86400 seconds (24 hours)."
  }

  validation {
    condition = alltrue([
      for record in var.simple_records : 
      length(record.records) > 0
    ])
    error_message = "Records list cannot be empty."
  }

  validation {
    condition = alltrue([
      for record in var.simple_records : 
      can(regex("^Z[A-Z0-9]{10,32}$", record.zone_id))
    ])
    error_message = "zone_id must be a valid Route53 hosted zone ID."
  }
}

variable "alias_records" {
  description = "Alias Route 53 records (e.g., A/AAAA pointing to ALB/CloudFront)"
  type = list(object({
    name                   = string
    type                   = string
    zone_id                = string
    alias_name             = string
    alias_zone_id          = string
    evaluate_target_health = bool
  }))
  default = []

  validation {
    condition = alltrue([
      for record in var.alias_records : 
      contains(["A", "AAAA"], record.type)
    ])
    error_message = "Alias records can only be of type A or AAAA."
  }

  validation {
    condition = alltrue([
      for record in var.alias_records : 
      can(regex("^Z[A-Z0-9]{10,32}$", record.zone_id))
    ])
    error_message = "zone_id must be a valid Route53 hosted zone ID (starts with Z followed by alphanumeric characters)."
  }

  validation {
    condition = alltrue([
      for record in var.alias_records : 
      can(regex("^Z[A-Z0-9]{10,32}$", record.alias_zone_id))
    ])
    error_message = "alias_zone_id must be a valid Route53 hosted zone ID."
  }

  validation {
    condition = alltrue([
      for record in var.alias_records : 
      length(record.alias_name) > 0
    ])
    error_message = "alias_name cannot be empty."
  }
}