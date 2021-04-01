resource "aws_subnet" "my_private_subnets" {
    count = "${length(slice(local.azs_names, 0, 2))}"
    vpc_id  = "${aws_vpc.my_training_VPC.id}"
    cidr_block = "${cidrsubnet(var.vpc_cidr["${terraform.workspace}-IP-Range"], 8, count.index + length(local.azs_names))}"
    availability_zone = "${local.azs_names[count.index]}"
    tags = {
      Name = "${var.mytags.prt_subnet_tag_name}-${terraform.workspace}-${local.azs_names[count.index]}"
      Environment = "${terraform.workspace}"
      chargeCode = "${var.mytags["${terraform.workspace}-ChargeCode"]}"
    }
}