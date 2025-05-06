variable "service_name" {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable "description" {
  description = "Descriptor for resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "instance_type" {
  description = "The instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "The number of desired instances"
  type        = number
  default     = 1
}

variable "root_volume_size" {
  description = "Root volume size"
  type        = number
  default     = 8
}

variable "key_pair" {
  description = "Name of the key pair to use for SSH or RDP"
  type        = string
}

variable "backup_enabled" {
  description = "AWS Backup enabled or disabled"
  type        = bool
  default     = false
}

# AMI search
variable "operating_system" {
  description = "The operating system to use (windows, amazon-linux, ubuntu, etc.)"
  type        = string
  default     = "amazon-linux"
}

variable "ami_os_map_regex" {
  description = "Map of regex to search amis"
  type        = map(string)
  default = {
    amazon-linux = "amzn2-ami-hvm-*-x86_64-gp2",
    ubuntu       = "ubuntu/images/hvm-ssd/ubuntu-*-20.04-amd64-server-*",
    windows      = "Windows_Server-2019-English-Full-Base-*"
    kali         = "value",
    rhel         = "value",
    suse         = "value"
  }
}

variable "ami_is_map_owners" {
  description = "Map of ami owners to filter only official amis"
  type        = map(list)
  default = {
    amazon-linux = ["137112412989"],
    ubuntu       = ["099720109477"],
    windows      = ["801119661308"],
    kali         = ["000000000000"],
    rhel         = ["000000000000"],
    suse         = ["000000000000"]
  }
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}