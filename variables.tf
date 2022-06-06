# VPC Variables
variable "environment" {
  description = "The Deployment environment prefix"
}

variable "region" { // default string
  description = "The region to launch the bastion host"
}

variable "availability_zones" {
  type        = list(any)
  description = "The az that the resources will be launched"
}

variable "vpc_cidr" { // default string
  description = "The CIDR block of the vpc"
}

# Launch Configuration Variables
variable "lc_name" {
  description = "The name of the launch configuration"
}

variable "lc_instance_type" {
  description = "The instance type of the launch configuration"
}

# Auto Scaling Group Variables
variable "asg_min_size" {
  type        = number
  description = "The minimum size of the autoscaling group"
}

variable "asg_max_size" {
  type        = number
  description = "The maximum size of the autoscaling group"
}

variable "asg_desired_capacity" {
  type        = number
  description = "The desired capacity of the autoscaling group"
}

variable "asg_name" {
  description = "The name of the autoscaling group"
}
