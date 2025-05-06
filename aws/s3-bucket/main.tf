locals {
  bucket_name = "${var.project_name}-${var.environment}-${var.description}-bucket"
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.0.1"

  bucket = local.bucket_name
  acl    = var.access_level
  versioning = {
    enabled = var.versioning_enabled
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = var.encryption_algorithm
      }
    }
  }

  tags = merge(
    {
      Name        = local.bucket_name
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags
  )
}