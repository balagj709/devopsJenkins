output "myEc2AMI_publicIPs" {
    value = "${data.aws_instance.my_ec2-WEB.*.public_ip}"
}

output "myEc2AMI_pvtIps" {
    value = "${data.aws_instance.my_ec2-WEB.*.private_ip}"
}