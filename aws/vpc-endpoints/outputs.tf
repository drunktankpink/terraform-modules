output "gateway_vpc_endpoints" {
  description = "List of Gateway VPC endpoints deployed in the VPC"
  value = values(aws_vpc_endpoint.gateway)
}

output "interface_vpc_endpoints" {
  description = "List of Interface VPC endpoints deployed in the VPC"
  value = values(aws_vpc_endpoint.interface)
}