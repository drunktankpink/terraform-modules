output "parent_zone_arn" {
  description = "The ARN of the parent hosted zone"
  value       = aws_route53_zone.parent.arn
}

output "parent_zone_id" {
  description = "The ID of the parent hosted zone"
  value       = aws_route53_zone.parent.zone_id
}

output "parent_zone_name" {
  description = "The name of the parent hosted zone"
  value       = aws_route53_zone.parent.name
}

output "name_servers" {
  description = "A list of name servers for the parent zone"
  value       = aws_route53_zone.parent.name_servers
}

output "primary_name_server" {
  description = "Primary name server for the parent zone"
  value       = aws_route53_zone.parent.primary_name_server
}

output "subdomain_zone_ids" {
  description = "A map of subdomain to their respective hosted zone IDs"
  value = {
    for key, zone in aws_route53_zone.subdomains : key => zone.zone_id
  }
}

output "subdomain_zone_names" {
  description = "A map of subdomain to their full zone names"
  value = {
    for key, zone in aws_route53_zone.subdomains : key => zone.name
  }
}

output "subdomain_name_servers" {
  description = "A map of subdomain to their nameserver records"
  value = {
    for key, zone in aws_route53_zone.subdomains : key => zone.name_servers
  }
}

output "delegation_records" {
  description = "A map of subdomain to the Route53 NS record resource created in the parent zone"
  value = {
    for key, record in aws_route53_record.ns_records : key => {
      fqdn     = record.fqdn
      ttl      = record.ttl
      records  = record.records
    }
  }
}