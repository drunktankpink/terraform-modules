
variable "service_name" {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable "environment" {
  description = "Environment the resource belongs to (e.g., dev, test, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be one of: dev, test, prod"
  }
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "owner" {
  description = "Owner of the resource"
  type        = string
}

variable "additional_tags" {
  description = "A map of common tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "allocated_storage" {
  description = "The amount of allocated storage in gigabytes"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "The type of storage (gp2, io1, standard)"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "The database engine to use (e.g., mysql, postgres)"
  type        = string
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "The username for the database"
  type        = string
}

variable "db_password" {
  description = "The password for the database"
  type        = string
}

variable "parameter_group_name" {
  description = "The parameter group to associate with the RDS instance"
  type        = string
  default     = "default"
}

variable "multi_az" {
  description = "Enable multi-AZ deployment"
  type        = bool
  default     = false
}

variable "publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
  default     = false
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "backup_retention" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "Preferred backup window"
  type        = string
  default     = "07:00-09:00"
}

variable "storage_encrypted" {
  description = "Enable storage encryption"
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "The KMS key ID to use for encryption"
  type        = string
}

variable "performance_insights_enabled" {
  description = "Enable performance insights"
  type        = bool
  default     = false
}

variable "performance_insights_kms_key_id" {
  description = "The KMS key ID for performance insights"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}
