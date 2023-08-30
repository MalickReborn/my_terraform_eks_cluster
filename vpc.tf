resource "aws_default_vpc" "vpc_central" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "vpc_central"
  }
}