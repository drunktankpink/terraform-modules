output "private_ip" {
  description = "Private IP of instances"
  value       = join("", aws_instance.this.*.private_ip)
}

output "private_dns" {
  description = "Private DNS of instances"
  value       = join("", aws_instance.this.*.private_dns)
}

output "id" {
  description = "Disambiguated ID of the instances"
  value       = join("", aws_instance.this.*.id)
}

output "arn" {
  description = "ARN of the instances"
  value       = join("", aws_instance.this.*.arn)
}

output "root_block_device_id" {
  description = "Root device ID of the instances"
  value       = join("", aws_instance.this.*.root_block_device.0.volume_id)
}

output "root_block_device_name" {
  description = "Root device name of the instances"
  value       = join("", aws_instance.this.*.root_block_device.0.device_name)
}
