variable bucket_name {
  description = "The name of the S3 bucket"
  type        = string
}

variable bucket_arn {
  description = "The ARN of the S3 bucket"
  type        = string
}

variable actions {
  description = "List of allowed actions for the policy"
  type        = list(string)
  default     = ["s3:GetObject", "s3:PutObject"]
}

variable principals {
  description = "List of AWS principals (users/roles) that are allowed to perform actions"
  type        = list(string)
}