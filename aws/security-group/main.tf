locals {
  security_group_name        = "${var.service_name}-${var.description}-sg"
}

resource "aws_security_group" "this" {
  name        = local.security_group_name
  description = "${var.service_name} ${var.description} security group"
  vpc_id      = var.vpc_id

  tags = merge({
    Name = local.security_group_name
  }, var.tags)
}