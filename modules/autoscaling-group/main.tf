resource "aws_autoscaling_group" "xyx-asg" {
  name = var.asg_name
  #   launch_configuration = aws_launch_configuration.as_conf.name
  #   launch_configuration = var.lc_name

  min_size = 1
  max_size = 2

  lifecycle {
    create_before_destroy = true
  }
}
