variable "profile" {
    description = "The profile used to auth to AWS"
}

# variable "region" {
#     description= "The region our instance will be in (exmpl: eu-west-2)"
# }

variable "name" {
    description= "The name of the instance we are creating"
}

variable "group" {
    description= "the name of the group we will be using for Ansible purposes"
}

variable "region" {
    type = string
    description = "AWS East Region"
}

variable "azs" {
    type = list
    description = "Availability Zones"
}

variable "subnet_cidr" {
    type = list
    description = "VPC Subnet CIDR Ranges"
}

variable "ami" {
    type = string
    description = "Ubuntu AMI ID in N. California Region"
}

variable "instance_type" {
    type = string
    description = "Instance type"
}

output "lb_dns" {
    value = aws_lb.alb.dns_name
}