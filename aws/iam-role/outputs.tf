output policy_id {
  description = "The policy's ID"
  value       = aws_iam_policy.this.id
}

output policy_arn {
  description = "The policy's ARN"
  value       = aws_iam_policy.this.arn
}

output policy_name {
  description = "The policy's name"
  value       = aws_iam_policy.this.name
}

output role_arn {
  description = "The IAM role ARN"
  value       = aws_iam_role.this.arn
}

output role_unique_id {
  description = "The IAM role unique ID"
  value       = aws_iam_role.this.unique_id
}