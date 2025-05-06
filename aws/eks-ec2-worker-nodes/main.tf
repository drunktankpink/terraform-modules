locals {
  resource_name = "${var.cluster_name}-worker-node"
}

resource "aws_autoscaling_group" "this" {
  launch_configuration = aws_launch_configuration.this.id
  vpc_zone_identifier  = var.subnets

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity

  tag {
    key                 = "Name"
    value               = local.resource_name
    propagate_at_launch = true
  }

  tags = merge({
    ClusterName = var.cluster_name
  }, var.tags)
}

resource "aws_launch_configuration" "this" {
  image_id             = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_groups      = var.security_groups
  iam_instance_profile = var.iam_instance_profile
  user_data            = var.user_data
}