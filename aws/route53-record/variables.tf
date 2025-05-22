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
}