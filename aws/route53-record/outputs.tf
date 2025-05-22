output "simple_record_fqdns" {
  description = "FQDNs of simple (non-alias) Route 53 records"
  value = {
    for k, v in aws_route53_record.simple : k => v.fqdn
  }
}

output "alias_record_fqdns" {
  description = "FQDNs of alias Route 53 records"
  value = {
    for k, v in aws_route53_record.alias : k => v.fqdn
  }
}