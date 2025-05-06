
variable "service_name" {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "hash_key" {
  description = "The hash (partition) key for the DynamoDB table"
  type        = string
}

variable "hash_key_type" {
  description = "The type of the hash key (S for string, N for number, B for binary)"
  type        = string
  default     = "S"
}

variable "range_key" {
  description = "The range (sort) key for the DynamoDB table"
  type        = string
  default     = ""
}

variable "range_key_type" {
  description = "The type of the range key (S for string, N for number, B for binary)"
  type        = string
  default     = "S"
}

variable "billing_mode" {
  description = "The billing mode for DynamoDB (PROVISIONED or PAY_PER_REQUEST)"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "read_capacity" {
  description = "Read capacity for provisioned mode"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "Write capacity for provisioned mode"
  type        = number
  default     = 5
}

variable "global_secondary_indexes" {
  description = "Map of global secondary indexes"
  type = list(object({
    name               = string
    hash_key           = string
    range_key          = string
    read_capacity      = number
    write_capacity     = number
    projection_type    = string
    non_key_attributes = list(string)
  }))
  default = []
}

variable "local_secondary_indexes" {
  description = "Map of local secondary indexes"
  type = list(object({
    name               = string
    range_key          = string
    projection_type    = string
    non_key_attributes = list(string)
  }))
  default = []
}

variable "stream_enabled" {
  description = "Enable DynamoDB streams"
  type        = bool
  default     = false
}

variable "stream_view_type" {
  description = "The view type for DynamoDB streams"
  type        = string
  default     = "NEW_AND_OLD_IMAGES"
}

variable "ttl_enabled" {
  description = "Enable TTL (time to live) on the table"
  type        = bool
  default     = false
}

variable "ttl_attribute_name" {
  description = "The attribute name used for TTL"
  type        = string
  default     = ""
}

variable "sse_enabled" {
  description = "Enable server-side encryption"
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "The KMS key ARN to use for encryption"
  type        = string
  default     = ""
}

variable "pitr_enabled" {
  description = "Enable point-in-time recovery"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}
