resource "aws_default_vpc" "vpc_central" {

  tags = {
    Name = "vpc_central"
  }
}