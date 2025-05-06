resource "aws_instance" "this" {
  ami               = var.ami
  availability_zone = var.availability_zone
  instance_type     = var.instance_type

  user_data = var.user_data

  iam_instance_profile = var.iam_instance_profile
  ebs_optimized        = var.ebs_optimized

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    iops                  = 3000
    volume_size           = var.root_volume_size
    volume_type           = "gp3"

    tags = {
      Name = "${var.name}-root"
    }
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs
    content {
      delete_on_termination = false
      device_name           = ebs_block_device.value.device_name
      encrypted             = true
      iops                  = ebs_block_device.value.iops
      volume_size           = ebs_block_device.value.volume_size
      volume_type           = ebs_block_device.value.volume_type
      kms_key_id            = var.kms_key_id
      tags = {
        Name        = ebs_block_device.value.name
        DriveName   = ebs_block_device.value.drive_name
        DriveLetter = ebs_block_device.value.drive_letter
      }
    }
  }

  network_interface {
    device_index          = 0
    network_interface_id  = var.network_interface
    delete_on_termination = false
  }

  tags = {
    Name     = var.name
    Platform = var.platform
  }
}