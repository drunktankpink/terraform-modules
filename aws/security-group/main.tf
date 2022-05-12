locals {
  security_group_name        = "${var.service_name}-${var.description}-sg"
}

resource "aws_security_group" "this" {
  name        = local.security_group_name
  description = "${var.service_name} ${var.description} security group"
  vpc_id      = var.vpc

  tags = {
    Name = local.security_group_name
  }
}

resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  self              = local.cidr_blocks != true ? true : null
  cidr_blocks       = local.cidr_blocks == true ? var.cidr_blocks : null
  security_group_id = aws_security_group.this.id
}