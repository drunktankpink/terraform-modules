variable "trusted_account_id" {
  description = "The AWS account ID of the GitHub OIDC role"
  type        = string
}

variable "oidc_role_name" {
  description = "Name of the GitHub OIDC role in the trusted account"
  type        = string
  default     = ""
}

variable "role_name" {
  description = "Name of the cross-account IAM role to create"
  type        = string
  default     = ""
}