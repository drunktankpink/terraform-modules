# Fetch latest Linux and Windows AMIs based on operating system
data "aws_ami" "latest" {
  most_recent = true
  owners      = var.ami_is_map_owners[var.operating_system]
  filter {
    name   = "name"
    values = [var.ami_os_map_regex[var.operating_system]]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

locals {
  resource_name = "${var.environment}-${var.service_name}-${var.operating_system}-ec2"
}

# Provision EC2 instances based on the selected OS
resource "aws_instance" "this" {
  ami           = data.aws_ami.latest.id
  instance_type = var.instance_type
  count         = var.instance_count
  subnet_id     = data.aws_subnet.this.id
  key_name      = var.key_pair

  # Handle security groups dynamically based on OS
  vpc_security_group_ids = var.operating_system == "windows" ? [aws_security_group.rdp.id] : [aws_security_group.ssh.id]

  # Dynamic user data script for bootstrapping instances
  user_data = var.operating_system == "windows" ? file("scripts/windows_bootstrap.ps1") : file("scripts/linux_bootstrap.sh")

  tags = merge({
    Name = local.resource_name
  }, var.tags)
}