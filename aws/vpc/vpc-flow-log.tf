resource "aws_flow_log" "this" {
  count = var.create_vpc_flow_logs ? 1 : 0

  vpc_id = aws_vpc.this.id
  
  log_destination_type = var.flow_logs_destination_type
  log_destination      = var.flow_logs_destination_type == "s3" ? module.vpc_flow_logs_s3_bucket[0].s3_bucket_arn : aws_cloudwatch_log_group.flow_logs[0].arn
  traffic_type         = var.flow_logs_traffic_type

  tags = merge(
    {
      Name        = "${local.resource_prefix_region}-vpc-flow-log"
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags,
    var.vpc_flow_logs_tags
  )
}

module "vpc_flow_logs_s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  count = var.create_vpc_flow_logs && var.flow_logs_destination_type == "s3" ? 1 : 0

  bucket                   = "${local.resource_prefix_region}-vpc-flow-log-bucket"
  acl                      = "private"
  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = aws_kms_key.objects.arn
        sse_algorithm     = "AES256"
      }
    }
  }

  tags = merge(
    {
      Name        = "${local.resource_prefix_region}-vpc-flow-log-bucket"
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags
  )
}

resource "aws_cloudwatch_log_group" "flow_logs" {
  count = var.create_vpc_flow_logs && var.flow_logs_destination_type == "cloud-watch-logs" ? 1 : 0

  name              = "${local.resource_prefix_region}-vpc-flow-log"
  retention_in_days = var.cloudwatch_log_retention_in_days
}