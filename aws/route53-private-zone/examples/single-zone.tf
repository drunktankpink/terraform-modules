module "private_zone_single" {
  source     = "./modules/route53-private-zone"
  zone_names = ["dev.internal.company.com"]
  vpc_ids    = ["vpc-12345678"]
  tags = {
    Environment = "dev"
    Project     = "Core Platform"
    Owner       = "Network Team"
  }
}