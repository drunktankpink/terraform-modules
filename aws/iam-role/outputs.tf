output role_arn {
  description = "The IAM role ARN"
  value       = aws_iam_role.this.arn
}

output role_unique_id {
  description = "The IAM role unique ID"
  value       = aws_iam_role.this.unique_id
}