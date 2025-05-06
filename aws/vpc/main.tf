################################################################################
# Data
################################################################################
data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}


################################################################################
# Locals
################################################################################
locals {
  availability_zones = data.aws_availability_zones.available.names
  subnet_count       = length(local.availability_zones)

  # e.g., "eu-west-1" -> "euw1"
  location_abr = join("", [
    split("-", data.aws_region.current.name)[0],               # "eu"
    substr(split("-", data.aws_region.current.name)[1], 0, 1), # "w"
    split("-", data.aws_region.current.name)[2]                # "1"
  ])

  # e.g., "eu-west-1a" -> "euw1a"
  subnet_abr = [
    for az in local.availability_zones : join("", [
      split("-", az)[0],
      substr(split("-", az)[1], 0, 1),
      split("-", az)[2]
    ])
  ]

  resource_prefix_region = "${var.vpc_name}-${local.location_abr}"
}

################################################################################
# VPC
################################################################################
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(
    {
      Name        = "${local.resource_prefix_region}-vpc"
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags,
    var.vpc_tags
  )
}

################################################################################
# Security Groups
################################################################################
resource "aws_security_group" "default" {
  count = var.create_default_security_group ? 1 : 0

  vpc_id      = aws_vpc.this.id
  name        = "${local.resource_prefix_region}-default-sg"
  description = "Default security group for VPC"

  tags = merge(
    {
      Name        = "${local.resource_prefix_region}-default-sg"
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags,
    var.default_security_group_tags
  )
}

resource "aws_security_group_rule" "default_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  self              = true
  security_group_id = aws_security_group.default[0].id
}

resource "aws_security_group_rule" "default_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default[0].id
}

################################################################################
# Public Subnets
################################################################################
resource "aws_subnet" "public" {
  count = local.subnet_count

  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, var.subnet_netbits, count.index)
  availability_zone       = local.availability_zones[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    {
      Name       = "${var.vpc_name}-${local.subnet_abr[count.index]}-public-subnet"
      SubnetTier = "public"
    },
    var.additional_tags,
    var.public_subnet_tags
  )
}

################################################################################
# Private Subnets
################################################################################
resource "aws_subnet" "private" {
  count = local.subnet_count

  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, var.subnet_netbits, count.index + local.subnet_count)
  availability_zone = local.availability_zones[count.index]

  tags = merge(
    {
      Name       = "${var.vpc_name}-${local.subnet_abr[count.index]}-private-subnet"
      SubnetTier = "private"
    },
    var.additional_tags,
    var.private_subnet_tags
  )
}

################################################################################
# Internet gateway
################################################################################
resource "aws_internet_gateway" "this" {
  count  = var.create_internet_gateway ? 1 : 0
  vpc_id = aws_vpc.this.id

  tags = merge(
    {
      Name = "${local.resource_prefix_region}-igw"
    },
    var.additional_tags,
    var.internet_gateway_tags
  )
}

################################################################################
# NAT gateway
################################################################################

resource "aws_eip" "nat" {
  count = var.create_nat ? local.subnet_count : 0

  domain = "VPC"

  tags = merge(
    {
      Name        = "${local.resource_prefix_region}-[count.index]-eip"
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags,
    var.eip_tags
  )

  depends_on = [aws_internet_gateway.this]
}

resource "aws_nat_gateway" "this" {
  count = var.create_nat ? local.subnet_count : 0

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge(
    {
      Name        = "${var.vpc_name}-${local.subnet_abr[count.index]}-nat-gw"
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags,
    var.nat_gateway_tags
  )

  depends_on = [aws_internet_gateway.this]
}

################################################################################
# Route tables, routes & associations
################################################################################
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    { Name = "${local.resource_prefix_region}-public-rtb" },
    var.additional_tags,
    var.public_route_table_tags
  )
}

resource "aws_route" "internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id

  timeouts {
    create = "5m"
  }
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    { Name = "${local.resource_prefix_region}-private-rtb" },
    var.additional_tags,
    var.private_route_table_tags
  )
}

resource "aws_route" "nat" {
  count                  = var.create_nat ? 1 : 0
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this[0].id
}

resource "aws_route" "nat" {
  for_each = aws_nat_gateway.this

  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = each.value.id
}

resource "aws_route_table_association" "private" {
  for_each = aws_subnet.private

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}