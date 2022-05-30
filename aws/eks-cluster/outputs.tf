output vpc_id {
  value = data.aws_vpc.vpc.id
}

output subnet_ids {
  value = data.aws_subnet.private.*.cidr_block
}