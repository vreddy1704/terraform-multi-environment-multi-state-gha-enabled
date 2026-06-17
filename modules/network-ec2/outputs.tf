output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID."
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "Public subnet ID."
}

output "security_group_id" {
  value       = aws_security_group.ec2.id
  description = "EC2 security group ID."
}

output "instance_id" {
  value       = aws_instance.server.id
  description = "EC2 instance ID."
}

output "instance_public_ip" {
  value       = aws_instance.server.public_ip
  description = "Public IP of the EC2 instance."
}

output "ami_id" {
  value       = data.aws_ami.amazon_linux.id
  description = "Resolved AMI ID."
}
