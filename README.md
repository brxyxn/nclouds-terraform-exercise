# nClouds | AWS + Terraform

This information is part of the **DevOps Bootcamp** taught by nClouds Academy.

## Description

The requested resources for this activity:

-   VPC
-   Internet Gateway
-   3 Public Subnets
-   3 Private Subnets
-   2 RouteTables (1 Public, 1 Private)
-   NAT Gateway

**This repository is the proof of delivered.**

## How to run

Run the following commands in your terminal:

```sh
terraform init
#terraform plan
terraform apply
#terraform destroy
```

## Variables

Remember to add the following format to a file in order to deploy changes to AWS. _Remember to change the placeholder values_

_`values.tfvars`_

```tf
//AWS
environment = "<<your envirenment prefix>>"
region      = "<<REGION>>"
availability_zones = [
  "<<REGION-AZ>>",
  "<<REGION-AZ>>",
  "<<REGION-AZ>>",
]

/* module networking */
vpc_cidr             = "<<CIDR>>"
public_subnets_cidr  = ["<<SUBNET>>", ...]
private_subnets_cidr = ["<<SUBNET>>", ...]
```

And then run in your terminal

```sh
terraform apply -var-file=values.tfvars
```
