variable "name_prefix" {
  default     = "xyx-lc"
  description = "Value of the launch configuration name prefix"
}

variable "image_id" {
  default     = "ami-0f9e9d9c7d6c8f9e3"
  description = "Value of the image id"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Value of the instance type"
}

variable "security_group" {
  description = "Value of the security group"
}