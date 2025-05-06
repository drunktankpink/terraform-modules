
variable "security_group_id" {
  description = "The ID of the security group to apply the rule to"
  type        = string
}

variable "type" {
  description = "The type of rule (ingress or egress)"
  type        = string
}

variable "from_port" {
  description = "The starting port for the security group rule"
  type        = number
}

variable "to_port" {
  description = "The ending port for the security group rule"
  type        = number
}

variable "protocol" {
  description = "The protocol for the security group rule (e.g., tcp, udp, icmp)"
  type        = string
}

variable "cidr_blocks" {
  description = "The IPv4 CIDR blocks for the security group rule"
  type        = list(string)
  default     = []
}

variable "ipv6_cidr_blocks" {
  description = "The IPv6 CIDR blocks for the security group rule"
  type        = list(string)
  default     = []
}

variable "description" {
  description = "Description of the security group rule"
  type        = string
  default     = ""
}
