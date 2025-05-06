output "name" {
  description = "Name of the security group"
  value       = aws_security_group.this.name
}

output "id" {
  description = "Security group id"
  value       = aws_security_group.this.id
}

output "arn" {
  description = "Security group arn"
  value       = aws_security_group.this.arn
}