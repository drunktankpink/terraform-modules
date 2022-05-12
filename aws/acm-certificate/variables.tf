variable "domain_name" {
  description = "Domain name used for the certificate"
  default = ""
}

variable "private_zone" {
  description = "boolean to determine zone is public(false) or private(true)"
  default = false
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment used for the certificate"
}
