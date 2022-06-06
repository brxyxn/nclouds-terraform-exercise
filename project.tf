terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "xyx-vpc" {
  source = "./modules/vpc"

  region = var.region

  availability_zones = var.availability_zones

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnets_cidr = var.public_subnets_cidr

  private_subnets_cidr = var.private_subnets_cidr
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
