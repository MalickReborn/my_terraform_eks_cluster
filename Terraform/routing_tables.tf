resource "aws_route_table" "public" {
    vpc_id = aws_default_vpc.vpc_central.id
    
    route = {
        cidr_block = "0.0.0.0/0"

        gateway_id = aws_internet_gateway.igw.id
    }
  
}

resource "aws_route_table" "private1" {
    vpc_id = aws_default_vpc.vpc_central.id
    
    route = {
        cidr_block = "0.0.0.0/0"

        nat_gateway_id = aws_nat_gateway.nat1.id
    }
  
}

resource "aws_route_table" "private2" {
    vpc_id = aws_default_vpc.vpc_central.id
    
    route = {
        cidr_block = "0.0.0.0/0"

        nat_gateway_id = aws_nat_gateway.nat2.id
    }
  
}

