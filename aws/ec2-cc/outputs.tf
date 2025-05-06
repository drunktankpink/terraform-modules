output "id" {
  description = ""
  value       = aws_instance.this.id
}

output "arn" {
  description = ""
  value       = aws_instance.this.arn
}

output "ip" {
  description = ""
  value       = aws_instance.this.private_ip
}