resource "aws_route_table" "my_routeTable_public" {
  vpc_id  = "${aws_vpc.my_training_VPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.my_igw.id}"
  }
  tags = {
    Name = "${var.mytags.rt_public_tag_name}-${terraform.workspace}"
  }
}

resource "aws_route_table" "my_routeTable_private" {
  vpc_id  = "${aws_vpc.my_training_VPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.my_nat.id}"
  }
  tags = {
    Name = "${var.mytags.rt_private_tag_name}-${terraform.workspace}"
  }
}

resource "aws_route_table_association" "my_rt_association_public" {
  count = "${length(local.azs_names)}"
  subnet_id      = local.public_subnet_ids[count.index]
  route_table_id = aws_route_table.my_routeTable_public.id
}

resource "aws_route_table_association" "my_rt_association_private" {
  count = "${length(slice(local.azs_names, 0, 2))}"
  subnet_id      = local.private_subnet_ids[count.index]
  route_table_id = aws_route_table.my_routeTable_private.id
}