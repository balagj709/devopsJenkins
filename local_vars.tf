locals {
  azs_names = "${data.aws_availability_zones.current_azs.names}"
  public_subnet_ids = aws_subnet.my_public_subnets.*.id
  private_subnet_ids = aws_subnet.my_private_subnets.*.id
}