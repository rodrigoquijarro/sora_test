#terraform {
#  required_version = "0.12.20"
#}

provider "aws" {
    region=var.region
    profile=var.profile
}

resource "aws_instance" "site" {
    ami = "ami-0194c3e07668a7e36"
    instance_type="t2.micro"
    key_name="apptest"
    vpc_security_group_ids = ["sg-f72319ab","sg-0586fa0aa906bfb79"]
        tags = {
            Name = var.name
            group = var.group
        }
}