resource "aws_default_vpc" "my_vpc" {

  tags = {
    Name = "my_vpc"
  }
}