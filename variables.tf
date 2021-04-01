variable "mytags" {
  type = "map" 
  default = {
    vpc_tag_name = "My_VPC"
    ec2_tag_name = "My_EC2"
    pub_subnet_tag_name = "My_public_subnet"
    prt_subnet_tag_name = "My_Private_subnet"
    igw_tag_name = "My_IGW"
    igw_nat_tag_name = "My_NAT_IGW"
    rt_public_tag_name = "My_Public_RouteTable"
    rt_private_tag_name = "My_Private_RouteTable"
    sg_tag_name = "My_SecurityGroup"
    "DEV-ChargeCode" = "000111222333"
    "QA-ChargeCode" = "111222333444"
    "UAT-ChargeCode" = "222333444555"
    "PROD-ChargeCode" = "010121232343"
  }
}

variable "vpc_cidr" {
  description = "Choose cidr for vpc"
  type        = "map"
  default     = {
    "DEV-VPC_CIDR" = "10.20.0.0/16"
    "QA-VPC_CIDR" = "10.30.0.0/16"
    "UAT-VPC_CIDR" = "10.35.0.0/16"
    "PROD-VPC_CIDR" = "10.1.0.0/16"
    My_vpc_tenancy = "default"
  }
}

variable "region" {
  description = "Choose region for your stack"
  type        = "string"
  default     = "us-east-1"
}

variable "web_ec2_count" {
  description = "Choose number ec2 instances for web"
  type        = "string"
  default     = "2"
}

variable "nat_amis" {
  type = "map"
  default = {
    us-east-1 = "ami-00a9d4a05375b2763"
    us-east-2 = "ami-00d1f8201864cc10c"
    instance_type = "t2.micro"
  }
}
variable "web_amis" {
  type = "map"
  default = {
    us-east-1 = "ami-0b898040803850657"
    us-east-2 = "ami-0d8f6eb4f641ef691"
    instance_type = "t2.micro"
  }
}

variable "web_instance_type" {
  description = "Choose instance type for your web"
  type        = "string"
  default     = "t2.micro"
}

variable "my_app_s3_bucket" {
  default = "javahome-app-dev"
}

variable "web_tags" {
  type = "map"
  default = {
    Name = "Webserver"
  }
}

/* variable "provider?" {
  description = "Which Provider You want"
} */