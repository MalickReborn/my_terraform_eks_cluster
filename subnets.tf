resource "aws_default_subnet" "public1" {
  vpc_id = aws_default_vpc.vpc_central.id
  availability_zone = "us-east-1a"
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "Default subnet for us-west-2a"
  }
}

resource "aws_default_subnet" "public2" {
  vpc_id = aws_default_vpc.vpc_central.id   
  availability_zone = "us-east-1b"
  cidr_block = "192.168.64.0/24"

  tags = {
    Name = "Default subnet for us-eat-1a"
  }
}

resource "aws_default_subnet" "public1" {
  vpc_id = aws_default_vpc.vpc_central.id
  availability_zone = "us-east-1a"
  cidr_block = "192.168.128.0/24"

  tags = {
    Name = "Default subnet for us-west-1a"
  }
}

resource "aws_default_subnet" "public2" {
  vpc_id = aws_default_vpc.vpc_central.id
  availability_zone = "us-east-1b"
  cidr_block = "192.168.192.0/24"

  tags = {
    Name = "Default subnet for us-west-1b"
  }
}
