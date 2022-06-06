data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_launch_configuration" "xyx-lc" {
  name_prefix     = var.name_prefix
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  security_groups = [var.security_group]

  lifecycle {
    create_before_destroy = true
  }
}
