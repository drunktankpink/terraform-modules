output "id" {
  description = "Disambiguated ID of the instance"
  value       = aws_db_instance.this.id
}

output "arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.this.arn
}

output "address" {
  description = "The hostname of the RDS instance"
  value       = aws_db_instance.this.address
}
output "availability_zone" {
  description = "The availability zone of the instance"
  value       = aws_db_instance.this.availability_zone
}

output "db_name" {
  description = "The database name"
  value       = aws_db_instance.this.db_name
}

output "endpoint" {
  description = "The connection endpoint in address:port format"
  value       = aws_db_instance.this.endpoint
}

output "engine" {
  description = "The database engine"
  value       = aws_db_instance.this.engine
}

output "port" {
  description = "The database port"
  value       = aws_db_instance.this.port
}

output "username" {
  description = "The master username for the database"
  value       = aws_db_instance.this.username
}

output "subnet_group_arn" {
  description = "The ARN for the DB subnet group"
  value       = aws_db_subnet_group.this.arn
}

output "vpc_id" {
  description = "The VPC ID for the DB subnet group"
  value       = aws_db_subnet_group.this.vpc_id
}

output "subnet_ids" {
  description = "The subnet IDs for the DB subnet group"
  value       = aws_db_subnet_group.this.subnet_ids
}