locals {
  resource_name = "${var.environment}-${var.service_name}"
}

resource "aws_db_instance" "this" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  instance_class       = var.instance_class
  db_name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.parameter_group_name
  multi_az             = var.multi_az
  publicly_accessible  = var.publicly_accessible
  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = var.vpc_security_group_ids

  # Backup settings
  backup_retention_period = var.backup_retention
  backup_window           = var.backup_window

  # Enable encryption if specified
  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.kms_key_id

  # Performance Insights
  performance_insights_enabled = var.performance_insights_enabled
  performance_insights_kms_key_id = var.performance_insights_kms_key_id

  tags = merge({
    Name = "${local.resource_name}-rds"
  }, var.tags)
}

resource "aws_db_subnet_group" "this" {
  name       = "${local.resource_name}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge({
    Name = "${local.resource_name}-db-subnet-group"
  }, var.tags)
}
