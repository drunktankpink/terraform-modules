locals {
  bucket_name        = "${var.service_name}-${var.description}-bucket"
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.0.1"
  
  bucket      = local.bucket_name
  acl         = var.access_level
  versioning  = {
    enabled = var.versioning_enabled
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = local.bucket_name
  }
}