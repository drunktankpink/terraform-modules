locals {
  resource_name = "${var.environment}-${var.service_name}-dynamodb"
}

resource "aws_dynamodb_table" "this" {
  name           = local.resource_name
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  range_key      = var.range_key
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  dynamic "attribute" {
    for_each = var.range_key != "" ? [var.range_key] : []
    content {
      name = attribute.value
      type = var.range_key_type
    }
  }

  # Global Secondary Indexes
  dynamic "global_secondary_index" {
    for_each = var.global_secondary_indexes
    content {
      name               = global_secondary_index.value.name
      hash_key           = global_secondary_index.value.hash_key
      range_key          = global_secondary_index.value.range_key
      read_capacity      = global_secondary_index.value.read_capacity
      write_capacity     = global_secondary_index.value.write_capacity
      projection_type    = global_secondary_index.value.projection_type

      dynamic "non_key_attributes" {
        for_each = global_secondary_index.value.non_key_attributes
        content {
          non_key_attributes = non_key_attributes.value
        }
      }
    }
  }

  # Local Secondary Indexes
  dynamic "local_secondary_index" {
    for_each = var.local_secondary_indexes
    content {
      name            = local_secondary_index.value.name
      range_key       = local_secondary_index.value.range_key
      projection_type = local_secondary_index.value.projection_type

      dynamic "non_key_attributes" {
        for_each = local_secondary_index.value.non_key_attributes
        content {
          non_key_attributes = non_key_attributes.value
        }
      }
    }
  }

  # Optional features
  stream_enabled      = var.stream_enabled
  stream_view_type    = var.stream_view_type
  ttl {
    enabled = var.ttl_enabled
    attribute_name = var.ttl_attribute_name
  }

  # Enable encryption and point-in-time recovery
  server_side_encryption {
    enabled     = var.sse_enabled
    kms_key_arn = var.kms_key_arn
  }

  point_in_time_recovery {
    enabled = var.pitr_enabled
  }

  tags = merge({
    Name = local.resource_name
  }, var.tags)
}
