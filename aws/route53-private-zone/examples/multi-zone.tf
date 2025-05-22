module "private_zone_multi" {
    source         = "../"
    
    zone_names    = ["dev.internal.company.com", "test.internal.company.com"]
    vpc_ids       = ["vpc-12345678", "vpc-87654321"]
    environment   = "dev"
    project_name  = "Core Platform"
    owner         = "Network Team"
}