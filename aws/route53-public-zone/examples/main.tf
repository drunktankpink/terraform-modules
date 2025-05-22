module "public_hosted_zone" {
  source     = "./modules/route53-zone"
  zone_name  = "example.com"
  subdomains = ["dev", "staging", "test"]
  tags = {
    Environment = "dev"
    Project     = "Core Platform"
    Owner       = "Network Team"
  }
}