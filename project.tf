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

  environment = "xyx"

  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]

  vpc_cidr = "170.40.0.0/16"

  public_subnets_cidr = ["170.40.0.0/20", "170.40.16.0/20", "170.40.32.0/20"]

  private_subnets_cidr = ["170.40.48.0/20", "170.40.64.0/20", "170.40.80.0/20"]
}

# module "xyx-asg" {
#   source = "./modules/autoscaling-group"

#   asg_name = "xyx-asg-test"

#   # lc_name = "xyx-lc-test"
# }

