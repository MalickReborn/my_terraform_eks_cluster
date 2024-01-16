# 
resource "aws_nat_gateway" "nat1" {
  allocation_id                  = aws_eip.nat1.id
  subnet_id                      = aws_subnet.public1.id
}

resource "aws_nat_gateway" "example" {
  allocation_id                  = aws_eip.nat2.id
  subnet_id                      = aws_subnet.public2.id
}

