output "id" {
  description = "Disambiguated ID of the instances"
  value       = aws_dynamodb_table.this.id
}

output "arn" {
  description = "ARN of the instances"
  value       = aws_dynamodb_table.this.arn
}