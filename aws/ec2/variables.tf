variable service_name {
  description = "Name of the service the resource belongs to"
  type        = string
}

variable description {
  description = "Descriptor for resources"
  type        = string
}

variable instance_type {
  description = "The instance type"
  type = string
  default = "t2.micro"
}

variable instance_count {
  description = "The number of desired instances"
  type = number
  default = 1
}

variable root_volume_size {
  description = "Root volume size"
  type = number
  default = 8
}

variable backup_enabled {
  description = "AWS Backup enabled or disabled"
  type = bool
  default = false
}

# AMI search
variable operating_system {
  description = "The operating system to use"
  type = string
  default = "amazon"
}

variable ami_os_map_regex {
  description = "Map of regex to search amis"
  type = map(string)
  default = {
    amazon  = value
    kali    = value
    rhel    = value
    suse    = value
    windows = value
  }
}

variable ami_is_map_owners {
  description = "Map of ami owners to filter only official amis"
  type = map(list)
  default = {
    amazon  = value
    kali    = value
    rhel    = value
    suse    = value
    windows = value
  }
}