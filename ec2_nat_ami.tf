resource "aws_instance" "my_nat" {
  ami           = "${var.nat_amis[var.region]}"
  instance_type = "${var.nat_amis.instance_type}"
  subnet_id = "${local.public_subnet_ids[0]}"
  source_dest_check = false
  vpc_security_group_ids = [ "${aws_security_group.my_security_group_NAT.id}" ]
  tags = {
    Name = "${var.mytags.ec2_tag_name}-NAT-${terraform.workspace}-${var.region}"
    Environment = "${terraform.workspace}"
  }
}