resource "aws_internet_gateway" "my_igw" {
    vpc_id  = "${aws_vpc.my_training_VPC.id}"
    tags = {
      Name = "${var.mytags.igw_tag_name}-${terraform.workspace}"
    }
  
}