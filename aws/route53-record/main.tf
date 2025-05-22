resource "aws_route53_record" "simple" {
  for_each = {
    for record in var.simple_records : "${record.name}-${record.type}" => record
  }

  name    = each.value.name
  type    = each.value.type
  ttl     = each.value.ttl
  zone_id = each.value.zone_id
  records = each.value.records
}

resource "aws_route53_record" "alias" {
  for_each = {
    for record in var.alias_records : "${record.name}-${record.type}" => record
  }

  name    = each.value.name
  type    = each.value.type
  zone_id = each.value.zone_id

  alias {
    name                   = each.value.alias_name
    zone_id                = each.value.alias_zone_id
    evaluate_target_health = each.value.evaluate_target_health
  }
}