locals {
  gateway_endpoints   = data.aws_vpc_endpoint_service.gateway_endpoint_service
  interface_endpoints = data.aws_vpc_endpoint_service.interface_endpoint_service
}