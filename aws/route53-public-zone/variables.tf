variable "zone_name" {
  description = "The primary domain name (e.g., example.com)"
  type        = string
}

variable "subdomains" {
  description = "List of subdomains to create and delegate"
  type        = list(string)
  default     = []
}

variable "environment" {
  description = "Environment (e.g. dev, test, prod)"
  type        = string
}

variable "project_name" {
  description = "The project this hosted zone is associated with"
  type        = string
}

variable "owner" {
  description = "Owner of the hosted zone"
  type        = string
}

variable "additional_tags" {
  description = "Additional tags to apply to the hosted zone"
  type        = map(string)
  default     = {}
}