variable service_name {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable description {
  description = "Descriptor for resources"
  type        = string
}

variable iam_policy {
  description = "IAM Policy"
  type = string
}

variable policy_path {
  description = "Path for policy. Defaults to /"
  type = string
  default = "/"
}

variable aws_service {
  description = "AWS service name"
  type = string
}
