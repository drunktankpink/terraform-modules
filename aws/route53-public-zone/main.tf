resource "aws_route53_zone" "parent" {
  name = var.zone_name

  tags = merge(
    {
      Name        = var.zone_name
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags
  )
}

# Subdomain Hosted Zones
resource "aws_route53_zone" "subdomains" {
  for_each = toset(var.subdomains)

  name = "${each.key}.${var.zone_name}"
    tags = merge(
    {
      Name        = "${each.key}.${var.zone_name}"
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags
  )
}

# NS Delegation Records in Parent Zone
resource "aws_route53_record" "ns_records" {
  for_each = aws_route53_zone.subdomains

  zone_id = aws_route53_zone.parent.zone_id
  name    = each.value.name
  type    = "NS"
  ttl     = 30
  records = each.value.name_servers
}