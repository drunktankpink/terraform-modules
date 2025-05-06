
variable "zone_id" {
  description = "The ID of the Route 53 hosted zone"
  type        = string
}

variable "records" {
  description = "A map of DNS records to create, each containing name, type, ttl, and values"
  type = map(object({
    name                   = string
    type                   = string
    ttl                    = number
    records                = list(string)
    alias_name             = string
    alias_zone_id          = string
    evaluate_target_health = bool
  }))
  default = {}
}