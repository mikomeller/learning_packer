variable "instance_type" {
    type = string
    description = "source ec2 instance type"
    default = "t3.small"
}

variable "region" {
    description = "region where to launch source ec2 instance"
}

variable "ami_owner"{
    description = "owner source of AMI"
}

variable "source_ami_name" {
    description = "ami_name"
}

variable "vpc_name" {
    description = "name of the vpc"
}

variable "subnet_name" {
    description = "subnet name"
}