output "gateway_vpc_endpoints" {
  description = "List of Gateway VPC endpoints deployed in the VPC"
  value = module.vpc_endpoints.gatewat_vpc_endpoints
}

output "interface_vpc_endpoints" {
  description = "List of Interface VPC endpoints deployed in the VPC"
  value = module.vpc_endpoints.interface_vpc_endpoints
}