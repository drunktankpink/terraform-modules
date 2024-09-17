resource "aws_acm_certificate" "this" {
  domain_name               = var.domain_name
  subject_alternative_names = var.san_names
  validation_method         = var.validation_method
  certificate_authority_arn = var.certificate_authority_arn

  tags = merge({
    Name = local.resource_name
  }, var.tags)

  lifecycle {
    create_before_destroy = true
  }
}

# DNS validation for Route53
resource "aws_route53_record" "validation" {
  count = var.validation_method == "DNS" && var.route53_zone_id != "" ? length(aws_acm_certificate.this.domain_validation_options) : 0

  zone_id = var.route53_zone_id
  name    = element(aws_acm_certificate.this.domain_validation_options[*].resource_record_name, count.index)
  type    = element(aws_acm_certificate.this.domain_validation_options[*].resource_record_type, count.index)
  records = [element(aws_acm_certificate.this.domain_validation_options[*].resource_record_value, count.index)]
  ttl     = 60
}