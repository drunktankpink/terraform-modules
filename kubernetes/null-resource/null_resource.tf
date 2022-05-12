locals {
  asg_name = module.eks.node_groups["default"]["resources"][0]["autoscaling_groups"][0]["name"]
}

resource "null_resource" "add_custom_tags_to_asg" {
  triggers = {
    node_group = local.asg_name
  }
  provisioner "local-exec" {
    command = <<EOF
aws autoscaling create-or-update-tags \
  --tags ResourceId=${local.asg_name},ResourceType=auto-scaling-group,Key=CUSTOM_TAG_NAME,Value=CUSTOM_TAG_VALUE,PropagateAtLaunch=true
EOF
  }
}