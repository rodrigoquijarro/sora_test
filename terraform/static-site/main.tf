
# 1. Configuring AWS Provider
provider "aws" {
    region = var.region
    profile = var.profile
}

data "aws_availability_zones" "all" {}

# 2. Creating EC2 instance

resource "aws_instance" "web" {
    ami = "${lookup(var.amis,var.region)}"
    count = "${var.ec2_count}"
    key_name = "apptest"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    source_dest_check = false
    instance_type = "t2.micro"
        tags = {
            Name = "${format("web-%03d", count.index + 1)}"
            group = var.group
  }
}
# 3. Creating Security Group for EC2
resource "aws_security_group" "instance" {
  name = "terraform-instance"
  ingress {
    description = "HTTPS from VPC"  
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP from VPC" 
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Shell from VPC"  
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }  
}
## Creating Launch Configuration
resource "aws_launch_configuration" "timeisweb" {
  image_id               = "${lookup(var.amis,var.region)}"
  instance_type          = "t2.micro"
  security_groups        = ["${aws_security_group.instance.id}"]
  key_name               = "${var.key_name}"
  lifecycle {
    create_before_destroy = true
  }
}
## Creating AutoScaling Group
resource "aws_autoscaling_group" "timeisweb" {
  launch_configuration = "${aws_launch_configuration.timeisweb.id}"
  availability_zones = ["${data.aws_availability_zones.all.names[0]}"]
  min_size = 2
  max_size = 4
  load_balancers = ["${aws_elb.timeisweb.name}"]
  health_check_grace_period = 600
  health_check_type = "ELB"
  tag {
    key = "Name"
    value = "app-timeisweb"
    propagate_at_launch = true
  }
}
## Security Group for ELB
resource "aws_security_group" "elb" {
  name = "terraform-timeisweb-elb"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
### Creating ELB
resource "aws_elb" "timeisweb" {
  name = "app-timeisweb"
  security_groups = ["${aws_security_group.elb.id}"]
  availability_zones = ["${data.aws_availability_zones.all.names[0]}"]
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:443/"
  }
  listener {
    lb_port = 443
    lb_protocol = "http"
    instance_port = "443"
    instance_protocol = "https"
  }
}