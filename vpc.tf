resource "aws_vpc" "mainvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-network"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "PublicSubnet"
  }
}

