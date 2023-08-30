resource "aws_default_vpc" "vpc_default" {

  tags = {
    Name = "vpc_default"
  }
}