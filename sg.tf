resource "aws_security_group" "my_security_group_NAT" {
  name        = "${var.mytags.sg_tag_name}-NAT-${terraform.workspace}"
  description = "Allow traffic for Private Subnets"
  vpc_id      = "${aws_vpc.my_training_VPC.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "my_security_group_WEB" {
  name        = "${var.mytags.sg_tag_name}-WEB-${terraform.workspace}"
  description = "Allow traffic for WEB App"
  vpc_id      = "${aws_vpc.my_training_VPC.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}