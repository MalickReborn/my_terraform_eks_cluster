# we set an elastic ips available for our nat gateways
resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "eip_nat1"
  }
}

resource "aws_eip" "nat2" {
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "eip_nat2"
  }
}