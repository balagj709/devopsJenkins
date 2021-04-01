resource "aws_subnet" "my_public_subnets" {
    count = "${length(local.azs_names)}"
    vpc_id  = "${aws_vpc.my_training_VPC.id}"
    cidr_block = "${cidrsubnet(var.vpc_cidr["${terraform.workspace}-IP-Range"], 8, count.index)}"
    availability_zone = "${local.azs_names[count.index]}"
    map_public_ip_on_launch = true
    tags = {
      Name = "${var.mytags.pub_subnet_tag_name}-${terraform.workspace}-${local.azs_names[count.index]}"
      Environment = "${terraform.workspace}"
      chargeCode = "${var.mytags["${terraform.workspace}-ChargeCode"]}"
    }
}