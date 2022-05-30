data "aws_vpc" "vpc" {
  id = var.vpc_id

  filter {
    name = "tag:Environment"
    values = var.environment
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.vpc.id

  filter {
    name = "tag:SubnetTier"
    values = "private"
  }
}

data "aws_subnet" "private" {
  count = length(data.aws_subnet_ids.private.ids)
  id = data.aws_subnet_ids.private.ids[count.index]
}

data "template_file" "auth_config_map" {
  template = file("${path.module}/eks-cluster-files/aws-auth.yaml")

  vars {
    RoleArn = aws_iam_role.eks-worker.arn
  }
}

data "aws_eks_cluster_auth" "eks" {
  name = aws_eks_cluster.this.name
}