output "vpc_id" {
  value = aws_vpc.xyx-vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.xyx-vpc.cidr_block
}

output "vpc_public_subnets" {
  # Result is a map of subnet id to cidr block, e.g.
  # { "subnet_1234" => "10.0.1.0/4", ...}
  value = {
    for subnet in aws_subnet.public_subnet :
    subnet.id => subnet.cidr_block
  }
}

output "vpc_private_subnets" {
  # Result is a map of subnet id to cidr block, e.g.
  # { "subnet_1234" => "10.0.1.0/4", ...}
  value = [
    for subnet in aws_subnet.private_subnet : subnet.id
  ]
}
