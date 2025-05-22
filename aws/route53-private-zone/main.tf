resource "aws_route53_zone" "this" {
  for_each  = toset(var.zone_names)
  name      = each.key
  comment   = "Private hosted zone managed by Terraform"

  dynamic "vpc" {
    for_each = toset(var.vpc_ids)
    content {
      vpc_id = vpc.value
    }
  }

  tags = merge(
    {
      Name        = each.key
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags
  )
}