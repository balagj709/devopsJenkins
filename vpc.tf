resource "aws_vpc" "my_training_VPC" {
  cidr_block = "${var.vpc_cidr["${terraform.workspace}-IP-Range"]}"
  instance_tenancy = "${var.vpc_cidr.My_vpc_tenancy}"
  tags = {
    Name = "${var.mytags.vpc_tag_name}-${terraform.workspace}"
    Environment = "${terraform.workspace}"
    chargeCode = "${var.mytags["${terraform.workspace}-ChargeCode"]}"
  }
}