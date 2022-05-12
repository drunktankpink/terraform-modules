variable length {
  description = "The length of the string desired"
  type        = number
  default     = 12
}

variable upper {
  description = "Include uppercase alphabet characters in random string"
  type        = bool
  default     = true
}

variable min_upper {
  description = "Minimum number of uppercase alphabet characters in random string"
  type        = number
  default     = 0
}

variable lower {
  description = "Include lowercase alphabet characters in random string"
  type        = bool
  default     = true
}

variable min_lower {
  description = "Minimum number of lowercase alphabet characters in random string"
  type        = number
  default     = 0
}

variable number {
  description = "Include numeric characters in random string"
  type        = bool
  default     = true
}

variable min_numeric {
  description = "Minimum number of numeric characters in random string"
  type        = number
  default     = 0
}

variable special {
  description = "Include special characters in random string"
  type        = bool
  default     = true
}

variable min_special {
  description = "Minimum number of special characters in random string"
  type        = number
  default     = 0
}

variable override_special {
  description = "Supply your own list of special characters to use for string generation. This overrides the default character list in the special argument"
  default     = null
}