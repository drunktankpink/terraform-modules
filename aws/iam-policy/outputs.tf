output "policy_id" {
  description = "The policy's ID"
  value       = aws_iam_policy.this.id
}

output "policy_arn" {
  description = "The policy's ARN"
  value       = aws_iam_policy.this.arn
}

output "policy_name" {
  description = "The policy's name"
  value       = aws_iam_policy.this.name
}