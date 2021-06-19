
#1 Configure the AWS Provider
provider "aws" {
    region = var.region
    #shared_credentials_file = "/var/lib/jenkins/.aws/credentials"
    profile = var.profile
}

#2 Creating VPC
resource "aws_vpc" "inside-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "enviroment"
    }
}

#3 Creating internet gateway
resource "aws_internet_gateway" "gw" {
    vpc_id     = aws_vpc.inside-vpc.id
    tags = {
        Name = "subnet1"
  }
}

resource "aws_instance" "site" {
    ami = "ami-0194c3e07668a7e36"
    instance_type="t2.micro"
    key_name="apptest"
    vpc_security_group_ids = ["sg-0066adba3fba96c74"]
        tags = {
            Name = var.name
            group = var.group
        }
}