provider "aws" {
  region = var.region
}

locals {
  interface_vpc_endpoints = {
    "voiceid" = {
        name = "voiceid"
        security_group_ids = [aws_security_group.endpoint.id]
        subnet_ids = data.aws_subnet_ids.this.ids
        policy = null
        private_dns_enabled = false
    }
  }
}

data "aws_vpc" "this" {
    tags = {
        "AWSResourceType" = "VPC"
    }
}

data "aws_subnet_ids" "this" {
  vpc_id = data.aws_vpc.this.id
  tags = {
    Name = "*-app_internal_subnets-eu-west-2*"
  }
}

module "vpc_endpoints" {
  source = "../../"

  identity = module.this.identity
  additional_names = var.additional_names

  vpc_id = data.aws_vpc.this.id
  interface_vpc_endpoints = local.interface_vpc_endpoints
}

resource "aws_security_group" "endpoint" {
  vpc_id = data.aws_vpc.this.id
  ingress {
    from_port = 443
    protocol = "TCP"
    to_port = 443
    cidr_blocks = [data.aws_vpc.this.cidr_block]
    description = "Security Group for EC2 Interface VPC Endpoint"
  }

  tags = module.sg_tag_label.tags
}