variable cluster_name {
  description = "The name of the EKS cluster"
  type        = string
}

variable fargate_profile_name {
  description = "The name of the Fargate profile"
  type        = string
}

variable pod_execution_role_arn {
  description = "The ARN of the pod execution IAM role"
  type        = string
}

variable subnet_ids {
  description = "List of subnet IDs for Fargate pods"
  type        = list(string)
}

variable namespace {
  description = "The namespace for which the Fargate profile is applied"
  type        = string
}

variable labels {
  description = "The labels for pod selector in the namespace"
  type        = map(string)
  default     = {}
}

variable tags {
  description = "Additional tags to apply to the Fargate profile"
  type        = map(string)
  default     = {}
}