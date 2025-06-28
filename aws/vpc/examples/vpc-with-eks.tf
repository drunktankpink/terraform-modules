module "vpc" {
  source = "git::https://github.com/drunktankpink/terraform-modules.git//aws/vpc?ref=main"
  
  vpc_name              = "eks-vpc"
  vpc_cidr_block        = "10.0.0.0/16"
  public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs  = ["10.0.10.0/24", "10.0.20.0/24"]
  
  # Enable EKS integration
  enable_eks_tags    = true
  eks_cluster_names  = ["my-prod-cluster", "my-dev-cluster"]
  eks_ownership      = "shared"  # or "owned"
  
  additional_tags = {
    Purpose = "EKS clusters"
  }
}