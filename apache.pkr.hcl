# sources.pkr.hcl - comes from the plugin, here EBS: block storage
source "amazon-ebs" "ubuntu" {
    ami_name = "apache-on-ubuntu"
    instance_type = var.instance_type
    region = var.region
    source_ami = data.amazon-ami.ubuntu.id
    ssh_username = "ubuntu" # harcoded
    vpc_filter {
        filters = {
            "tag:Project" : var.vpc_name
        }
    }
    subnet_filter {
        filters = {
            "tag:Name" : var.subnet_name
        }
    }
}

build {
    name = "ebs-builder"
    sources = [
        "source.amazon-ebs.ubuntu"
    ]
    # what is going to fill your code
    provisioner "ansible" {
        #playbook argument
        playbook_file = "./ansible/playbook.yml"
    }

}