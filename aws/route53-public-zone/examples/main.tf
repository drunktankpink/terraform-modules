module "public_hosted_zone" {
    source     = "../"

    zone_name     = "example.com"
    subdomains    = ["dev", "staging", "test"]
    environment   = "dev"
    project_name  = "Core Platform"
    owner         = "Network Team"
}