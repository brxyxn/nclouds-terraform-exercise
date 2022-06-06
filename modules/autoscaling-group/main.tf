resource "aws_autoscaling_group" "xyx-asg" {
  name                 = var.asg_name
  launch_configuration = var.lc_name

  min_size = var.min_size
  max_size = var.max_size

  vpc_zone_identifier = var.subnet_ids

  lifecycle {
    create_before_destroy = true
  }
}
