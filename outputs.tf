# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "public_dns_name" {
  description = "Public DNS names of the load balancer for this project"
  value       = module.elb_http.elb_dns_name
}

output "vpc_id" {
  description = "ID of project VPC"
  value = module.vpc.vpc_id
}

output "lb_url" {
  description = "URL of load balancer"
  value = "https://${module.elb_http.elb_dns_name}/"
}

output "web_server_output" {
  description = "Number of webservers provisioned"
  value = length(module.ec2_instances.instance_ids)
}

#query outputs terraform output
#query single output: terraform output lb_url
#grep command to see the values of sensitive outputs in your state file: grep --after-context=10 outputs terraform.tfstate
#generate machine readable output (used for automations): terraform output -json

output "database_password" {
  description = "Database admin password"
  value = aws_db_instance.database.password
  sensitive = true
}

output "database_username" {
  description = "Database admin username"
  value = aws_db_instance.database.username
  sensitive = true
}