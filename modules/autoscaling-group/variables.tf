variable "asg_name" {
  default     = "xyx-asg"
  description = "Value of the auto scaling group name"
}

variable "lc_name" {
  default     = "xyx-lc"
  description = "Value of the launch configuration name"
}

variable "min_size" {
  default     = 1
  description = "Value of the minimum size"
}

variable "max_size" {
  default     = 2
  description = "Value of the maximum size"
}

variable "subnet_ids" {
  type        = list(any)
  description = ""
}
