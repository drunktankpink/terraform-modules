output aws_region {
  description = "The AWS region where the VPC is created"
  value       = data.aws_region.current.name
}

output vpc_id {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output vpc_cidr {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.this.cidr_block
}

output public_subnet_ids {
  description = "List of IDs for the public subnets"
  value       = aws_subnet.public[*].id
}

output public_subnet_cidrs {
  description = "Map of public subnet IDs to their CIDR blocks"
  value = {
    for subnet in aws_subnet.public :
    subnet.id => subnet.cidr_block
  }
}

output private_subnet_ids {
  description = "List of IDs for the private subnets"
  value       = aws_subnet.private[*].id
}

output private_subnet_cidrs {
  description = "Map of private subnet IDs to their CIDR blocks"
  value = {
    for subnet in aws_subnet.private :
    subnet.id => subnet.cidr_block
  }
}

output default_security_group_id {
  description = "The ID of the default security group"
  value       = aws_security_group.default[0].id
}

output nat_gateway_id {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.this[0].id
}

output nat_gateway_public_ip {
  description = "The public IP address of the NAT Gateway"
  value       = aws_nat_gateway.this[0].public_ip
}