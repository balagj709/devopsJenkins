resource "aws_key_pair" "my_keyPair_web_Ec2" {
  key_name   = "my_keyPair_web_Ec2"
  public_key = "${file("scripts/ec2_web.pub")}"
}