terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "time_static" "example" {}

data "aws_availability_zones" "all" {}

/* There's a bug related with the provided and timestamp is */
locals {
  timestamp_formatted = formatdate("YYYY-MM-DD  hh:mm", time_static.example.month)
}

output "timestamp_formatted" {
  value = local.timestamp_formatted
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = "${var.environment}"
      Owner       = "Brayan Lopez"
      Project     = "nClouds Bootcamp"
    }
  }
}

module "xyx-vpc" {
  source = "./modules/vpc"

  region = var.region

  availability_zones = data.aws_availability_zones.all.names

  environment = var.environment

  vpc_cidr = var.vpc_cidr
}

module "xyx-sg" {
  source = "./modules/security-group"
  vpc_id = module.xyx-vpc.vpc_id
  depends_on = [
    module.xyx-vpc
  ]
}

// launch configuration from modules/launch-configuration
module "xyx-lc" {
  source = "./modules/launch-configuration"

  name_prefix = var.environment

  instance_type = var.lc_instance_type

  security_group = module.xyx-sg.sg_group_id

  depends_on = [
    module.xyx-sg
  ]
}

module "xyx-asg" {
  source = "./modules/autoscaling-group"

  asg_name = var.asg_name

  min_size = var.asg_min_size

  max_size = var.asg_max_size

  lc_name = module.xyx-lc.name

  subnet_ids = module.xyx-vpc.vpc_private_subnets
}
