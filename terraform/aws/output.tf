#output "instance" {
#  value = "${module.ec2.aws_instance.launch_instance.instance_type}"
#}

output "public_ip" {
  value = "${module.ec2.aws_instance.aws_instance.public_ip}"
}
