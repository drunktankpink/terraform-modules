locals {
  resource_name = "${var.cluster_name}-fargate-profile"
}

resource "aws_eks_fargate_profile" "this" {
  cluster_name = var.cluster_name
  fargate_profile_name = var.fargate_profile_name

  pod_execution_role_arn = var.pod_execution_role_arn
  subnet_ids             = var.subnet_ids

  selector {
    namespace = var.namespace
    labels    = var.labels
  }

  tags = merge({
    Name = local.resource_name
  }, var.tags)
}