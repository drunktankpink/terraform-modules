
variable service_name {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable environment {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
  default     = ""
}

variable domain_name {
  description = "The primary domain name for the certificate"
  type        = string
  default     = ""
}

variable san_names {
  description = "A list of subject alternative names (SANs)"
  type        = list(string)
  default     = []
}

variable validation_method {
  description = "The validation method (DNS or EMAIL)"
  type        = string
  default     = "DNS"
}

variable route53_zone_id {
  description = "The Route53 Zone ID for DNS validation"
  type        = string
  default     = ""
}

variable certificate_authority_arn {
  description = "ARN of the certificate authority for private certificates"
  type        = string
  default     = ""
}

variable tags {
  description = "Additional tags to apply to the certificate"
  type        = map(string)
  default     = {}
}
