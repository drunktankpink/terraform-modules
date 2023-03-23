module "gateway_tags" {
  source = "../aws-tagging-module/"

  for_each = data.aws_vpc_endpoint_service.gateway_endpoint_service

  resource_type = "vpce"
  additional_names = var.additional_names
}

module "interface_tags" {
  source = "../aws-tagging-module/"

  for_each = data.aws_vpc_endpoint_service.interface_endpoint_service

  resource_type = "vpce"
  additional_names = var.additional_names
}