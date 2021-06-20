
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
    ipv6_cidr_block  = "::/0"
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
#    azn = var.azn
        tags = {
            Name = "enviroment-subnet"
  } 
}

# 6. Associate subnet with route table

 resource "aws_route_table_association" "association" {
    subnet_id      = aws_subnet.subnet-1.id
    route_table_id = aws_route_table.env-route-table.id
}

# 7. Create a Security group
resource "aws_security_group" "allow_web" {
    name        = "allow_web_traffic"
    description = "Allow web inbound traffic"
    vpc_id      = aws_vpc.inside-vpc.id

  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
#   ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  ingress {
    description      = "Shell from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
#   ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
#   ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
        tags = {
            Name = "allow_tls"
  }
}

# 8. Create network interface

resource "aws_network_interface" "web-server-nic" {
    subnet_id       = aws_subnet.subnet-1.id
    private_ips     = ["10.0.1.50"] 
    security_groups = [aws_security_group.allow_web.id]
        tags = {
            Name = "enviroment_nic_in_interface"
  }
}

# 9. Create elastic IP

resource "aws_eip" "one" {
    count = length(aws_instance.site) 
    vpc                       = true
    network_interface         = aws_network_interface.web-server-nic.id
    associate_with_private_ip = "10.0.1.50"
    depends_on = [aws_internet_gateway.gw]
        tags = {
            Name = "Enviroment_Elastic_IP"
        }
}

resource "aws_instance" "site" {
    ami = "ami-0194c3e07668a7e36"
    instance_type = "t2.micro"
    key_name = "apptest"
    vpc_security_group_ids = ["sg-0066adba3fba96c74"]
        tags = {
            Name = var.name
            group = var.group
  }
}