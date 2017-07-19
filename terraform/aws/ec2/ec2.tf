variable "ami" {
    description = "The AMI ID"
    default = "ami-21766642"
}

variable "public_ip" {
    description = "Public IP"
    default = "52.62.107.101"
}

resource "aws_security_group" "aws1" {
    name = "Default Security Group"
    description = "Allows all traffic"    
    
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "launch_instance" {
        ami = "${var.ami}"
        instance_type = "t2.micro"
        key_name = "project123"
#        security_groups= ["aws1"]
	public_ip = "${var.public_ip}"
        tags {
         Name = "instance1"
        }
}

