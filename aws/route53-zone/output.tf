output arn {
  description = "The DNS record name"
  value       = aws_route53_zone.this.name
}

output zone_id {
  description = "The DNS record FQDN"
  value       = aws_route53_zone.this.zone_id
}

output name_servers {
  description = "The DNS record name"
  value       = aws_route53_zone.this.name_servers
}

output primary_name_server {
  description = "The DNS record FQDN"
  value       = aws_route53_zone.this.primary_name_server
}