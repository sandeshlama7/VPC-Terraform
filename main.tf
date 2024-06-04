## VPC
resource "aws_vpc" "vpc-sandesh" {
  cidr_block = var.vpc_cidr
  tags = {
    Name  = "vpc-terraform-sandesh"
    owner = var.owner_tag
  }
}

# SUBNETS
resource "aws_subnet" "subnets" {
  for_each = var.subnets-conf

  vpc_id            = aws_vpc.vpc-sandesh.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name  = each.key
    owner = var.owner_tag
  }
}

## INTERNET GATEWAY
resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.vpc-sandesh.id
    tags = {
      Name = "IGW-Terra-Sandesh"
      owner = var.owner_tag
    }
}

#PUBLIC Route Table
resource "aws_route_table" "public-route-table" {
    vpc_id = aws_vpc.vpc-sandesh.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id
    }
    tags = {
      Name = "Public-Subnet-RT"
    }
    }

##PRIVATE ROUTE TABLE
resource "aws_route_table" "private-route-table" {
    vpc_id = aws_vpc.vpc-sandesh.id
    tags = {
      Name = "Private-Subnet-RT"
    }
}

##ROUTE TABLE ASSOCIATION TO SUBNETS
resource "aws_route_table_association" "public_subnet_association1" {
#   subnet_id = var.public_subnet_1a_id
    subnet_id = aws_subnet.subnets["public-subnet-1a"].id
  route_table_id = aws_route_table.public-route-table.id
}
resource "aws_route_table_association" "public_subnet_association2" {
#   subnet_id = var.public_subnet_1b_id
subnet_id = aws_subnet.subnets["public-subnet-1b"].id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private_subnet_association1" {
#   subnet_id = var.private_subnet_1a_id
subnet_id = aws_subnet.subnets["private-subnet-1a"].id
  route_table_id = aws_route_table.private-route-table.id
}
resource "aws_route_table_association" "private_subnet_association2" {
#   subnet_id = var.private_subnet_1b_id
subnet_id = aws_subnet.subnets["private-subnet-1b"].id
  route_table_id = aws_route_table.private-route-table.id
}
