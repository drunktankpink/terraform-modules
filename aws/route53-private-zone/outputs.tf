output "zone_ids" {
  description = "Map of zone name → Route 53 hosted zone ID"
  value = {
    for zone, res in aws_route53_zone.this : zone => res.zone_id
  }
}

output "zone_names" {
  description = "Map of zone name → FQDN"
  value = {
    for zone, res in aws_route53_zone.this : zone => res.name
  }
}

output "zone_name_servers" {
  description = "Map of zone name → list of name servers (optional metadata)"
  value = {
    for zone, res in aws_route53_zone.this : zone => res.name_servers
  }
}