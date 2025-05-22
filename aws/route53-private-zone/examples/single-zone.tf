module "private_zone_single" {
    source        = "../"

    zone_names    = ["dev.internal.company.com"]
    vpc_ids       = ["vpc-12345678"]
    environment   = "dev"
    project_name  = "Core Platform"
    owner         = "Network Team"
}