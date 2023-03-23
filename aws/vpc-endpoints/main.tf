data "aws_vpc_endpoint_service" "gateway_endpoint_service" {
    for_each = var.gateway_vpc_endoints

    service         = var.gateway_vpc_endoints[each.key].name
    service_type    = "Gateway"
}

data "aws_vpc_endpoint_service" "interface_endpoint_service" {
    for_each = var.interface_vpc_endpoints

    service         = var.interface_vpc_endpoints[each.key].name
    service_type    = "Interface"
}

resource "aws_vpc_endpoint" "gateway" {
    for_each = data.aws_vpc_endpoint_service.gateway_endpoint_service

    service_name        = data.aws_vpc_endpoint_service.gateway_endpoiint_service
    policy              = var.gateway_vpc_endpoints[each.key].policy
    vpc_endpoint_type   = data.aws_vpc_endpoint_service.gateway_endpoint_service[each.key].service_type
    vpc_id              = var.vpc_id

    tags = module.gateway_endpoint_tag_label[each.key].tags
}

resource "aws_vpc_endpoint" "interface" {
    for_each = data.aws_vpc_endpoint_service.interface_endpoint_service

    service_name = data.aws_vpc_endpoint_service.interface_endpoint_service[each.key].service_name
    policy = var.interface_vpc_endpoints[each.key].policy
    security_group_ids = var.interface_vpc_endpoints[each.key].security_group_ids
    subnet_ids = var.interface_vpc_endpoints[each.key].subnet_ids
    vpc_endpoint_type = data.aws_vpc_endpoint_service.interface_endpoint_service[each.key].service_type
    vpc_id = var.vpc_id
    private_dns_enabled = var.interface_vpc_endpoints[each.key].private_dns_enabled

    tags = module.interface_endpoint_tag_label[each.key].tags
}
