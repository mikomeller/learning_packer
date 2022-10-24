# which packer plugin to use
packer {
    required_plugins {
        amazon = {
            version = ">= 1.1.1"
            source = "github.com/hashicorp/amazon"
        }
    }
}

# Datasource for AMI
data "amazon-ami" "ubuntu" {
    filters = {
        # virtualization-type = "hvm"   # more filters are not needed
        # name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" 
        # OR: 
        name = var.source_ami_name
        # root-device-type =    # more filters are not needed
    }
    owners = [var.ami_owner]
    most_recent = true
    # region = "us-east-1"
}