data "aws_subnet" "this" {
  filter {
    name = "tag:SubnetTier"
    values = var.pubpriv
  }
}