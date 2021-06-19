
# 1. Configure the AWS Provider
provider "aws" {
    region = var.region
    #shared_credentials_file = "/var/lib/jenkins/.aws/credentials"
    profile = var.profile
}

# 2. Creating VPC
resource "aws_vpc" "inside-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "enviroment"
    }
}

# 3. Creating internet gateway
resource "aws_internet_gateway" "gw" {
    vpc_id     = aws_vpc.inside-vpc.id
    tags = {
        Name = "subnet1"
  }
}

# 4. Create route table
resource "aws_route_table" "env-route-table" {
    vpc_id = aws_vpc.inside-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.gw.id
  }
    tags = {
        Name = "enviroment"
  }
}

# 5. Create a subnet
resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.inside-vpc.id
    cidr_block =  "10.0.1.0/24" 
    availability_zone = "eu-west-2a"

    tags = {
        Name = "enviroment-subnet"
  } 
}

# 6. Associate subnet with route table

 resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.env-route-table.id
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