# nClouds | AWS + Terraform

This information is part of the **DevOps Bootcamp** taught by nClouds Academy.

## Description

### Homework 1

The requested resources for this activity:

- VPC
- Internet Gateway
- 3 Public Subnets
- 3 Private Subnets
- 2 RouteTables (1 Public, 1 Private)
- NAT Gateway

### Homework 2

Modify your Homework 1 and create the following modules:

- VPC Module
- Launch configuration Module
- Autoscaling group Module

You must follow the standards that we covered during the classes.

Push everything to your Github Repo and send me the link.

### Homework 3

Let's improve what we have:
- Generate dynamic CIDR for the subnets using Terraform functions
- Iterate to create a number of public and private subnets equal to the number of availability zones the Region has
- Use a `data` to get the AMI for the AutoScaling Group
- Tag all the resources with the DateTime when they got created (Use Terraform locals)

## How to run

Run the following commands in your terminal:

```sh
terraform init
#terraform plan
terraform apply
#terraform destroy
```

## Variables

Remember to add the following format to a file in order to deploy changes to AWS.

_For your convenience you can copy the following values and run apply the changes_

_`values.auto.tfvars`_

```tf
# VPC Values
environment = "xyx"
region      = "us-west-2"

availability_zones = [
  "us-west-2a",
  "us-west-2b",
  "us-west-2c",
  "us-west-2d",
]

# VPC - Networking Values
vpc_cidr = "170.50.0.0/16"

# Launch Configuration Values
lc_name          = "xyx-lc"
lc_instance_type = "t2.micro"

# Auto Scaling Group Values
asg_min_size         = 1
asg_max_size         = 3
asg_desired_capacity = 2
asg_name             = "xyx-asg"

```

And then run in your terminal

```sh
terraform apply -var-file=values.tfvars
```


# Bug

When trying to add the value from `formatdate("DD MM YYYY hh:mm", timestamp())` the following error is displayed.

```
Error: Provider produced inconsistent final plan

When expanding the plan for module.xyx-vpc.aws_route_table.public to include new values
learned so far during apply, provider "registry.terraform.io/hashicorp/aws" produced an
invalid new value for .tags_all: new element "CreatedAt" has appeared.

This is a bug in the provider, which should be reported in the provider's own issue
tracker.
```
