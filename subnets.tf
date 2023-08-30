resource "aws_default_subnet" "public1" {
  vpc_id = aws_default_vpc.vpc_central.id
  availability_zone = "us-east-1a"
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name                        = "public-us-east-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_default_subnet" "public2" {
  vpc_id = aws_default_vpc.vpc_central.id   
  availability_zone = "us-east-1b"
  cidr_block = "192.168.64.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name                        = "public-us-east-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_default_subnet" "public1" {
  vpc_id = aws_default_vpc.vpc_central.id
  availability_zone = "us-east-1a"
  cidr_block = "192.168.128.0/24"

  tags = {
    Name                        = "private-us-east-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_default_subnet" "public2" {
  vpc_id = aws_default_vpc.vpc_central.id
  availability_zone = "us-east-1b"
  cidr_block = "192.168.192.0/24"

  tags = {
    Name                        = "private-us-east-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}
