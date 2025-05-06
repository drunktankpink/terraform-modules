
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "subnets" {
  description = "List of subnets for the worker nodes"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for the worker nodes"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "security_groups" {
  description = "List of security groups for the worker nodes"
  type        = list(string)
}

variable "iam_instance_profile" {
  description = "IAM instance profile for worker nodes"
  type        = string
}

variable "user_data" {
  description = "User data for worker node configuration"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to worker nodes"
  type        = map(string)
  default     = {}
}
