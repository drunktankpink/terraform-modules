module "private_zone_multi" {
  source     = "./modules/route53-private-zone"
  zone_names = ["dev.internal.company.com", "test.internal.company.com"]
  vpc_ids    = ["vpc-12345678", "vpc-87654321"]
  tags = {
    Environment = "dev"
    Project     = "Core Platform"
    Owner       = "Network Team"
  }
}