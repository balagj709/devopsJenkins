resource "aws_instance" "my_ec2-WEB" {
  count = "${var.web_ec2_count}"
  ami           = "${var.web_amis[var.region]}"
  instance_type = "${var.web_amis.instance_type}"
  subnet_id = "${local.public_subnet_ids[count.index]}"
  user_data = "${file("scripts/apache.sh")}"
  iam_instance_profile = "${aws_iam_instance_profile.my_IAM_instance_profile.name}"
  vpc_security_group_ids = [ "${aws_security_group.my_security_group_WEB.id}" ]
  key_name = "${aws_key_pair.my_keyPair_web_Ec2.key_name}"
  tags = {
    Name = "${var.mytags.ec2_tag_name}-WEB-${terraform.workspace}-${var.region}"
    Environment = "${terraform.workspace}"
  }
}