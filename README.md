# NCLOUDS AWS + TERRAFORM

## How to run

Run the following commands in your terminal:

```sh
terraform init
#terraform plan
terraform apply
```

## Variables

Remember to add the following format to a file in order to deploy changes to AWS. *Remember to change the placeholder values*

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
