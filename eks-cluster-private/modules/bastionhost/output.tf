output "bastion_host_id" {
  description = "The ID of the Bastion Host"
  value       = aws_instance.bastion_host.id
}

output "bastion_host_ip" {
  description = "The public IP of the Bastion Host"
  value       = aws_instance.bastion_host.public_ip
}

output "bastion_security_group_id" {
  description = "The ID of the Bastion Host Security Group"
  value       = aws_security_group.bastion_sg.id
}