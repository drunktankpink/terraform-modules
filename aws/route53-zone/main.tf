
resource "aws_route53_zone" "this" {
  name = var.zone_name

  vpc {
    vpc_id = var.vpc_id
  }

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
