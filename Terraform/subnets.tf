# We provision 2 subnets, one public and one private for each availibility zone.
# in our test we have 2 availibility zones
# We also set some configuration into the tags that make the subnet available the eks cluster
resource "aws_subnet" "public1" {
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

resource "aws_subnet" "public2" {
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

resource "aws_subnet" "public1" {
  vpc_id = aws_default_vpc.vpc_central.id
  availability_zone = "us-east-1a"
  cidr_block = "192.168.128.0/24"

  tags = {
    Name                        = "private-us-east-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public2" {
  vpc_id = aws_default_vpc.vpc_central.id
  availability_zone = "us-east-1b"
  cidr_block = "192.168.192.0/24"

  tags = {
    Name                        = "private-us-east-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}
