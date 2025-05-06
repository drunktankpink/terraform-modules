output "name" {
  description = "The DNS record name"
  value       = aws_route53_record.this.name
}

output "fqdn" {
  description = "The DNS record FQDN"
  value       = aws_route53_record.this.fqdn
}