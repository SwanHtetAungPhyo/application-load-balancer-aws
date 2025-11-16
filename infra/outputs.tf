# outputs.tf
output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.main.dns_name
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "app_subnet_ids" {
  description = "The IDs of the application subnets"
  value       = [for subnet in aws_subnet.app : subnet.id]
}

output "db_subnet_ids" {
  description = "The IDs of the database subnets"
  value       = [for subnet in aws_subnet.db : subnet.id]
}

output "web_server_instance_ids" {
  description = "The instance IDs of the web servers"
  value       = aws_autoscaling_group.web.id
}

output "app_server_instance_ids" {
  description = "The instance IDs of the app servers"
  value       = aws_autoscaling_group.app.id
}

output "db_server_instance_ids" {
  description = "The instance IDs of the database servers"
  value       = [for instance in aws_instance.db : instance.id]
}
