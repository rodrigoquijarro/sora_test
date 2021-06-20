variable "profile" {
    description = "The profile used to auth to AWS"
}

variable "region" {
    description= "The region our instance will be in (exmpl: eu-west-2)"
    default = "eu-west-2"
}

variable "name" {
    description= "The name of the instance we are creating"
}

variable "group" {
    description= "the name of the group we will be using for Ansible purposes"
}

variable "count" {
    default = 1
}

variable "amis" {
    description = "Base AMI instance"
    default = {
        eu-west-2 = "ami-0194c3e07668a7e36"
    }
}

