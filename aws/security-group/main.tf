locals {
  security_group_name        = "${var.service_name}-${var.description}-sg"
  security_group_description = "${var.service_name} ${var.description} security group"
}

resource "aws_security_group" "this" {
  name        = local.security_group_name
  description = local.security_group_description
  vpc_id      = var.vpc_id

  tags = merge(
    {
      Name        = local.security_group_name
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags
  )
}