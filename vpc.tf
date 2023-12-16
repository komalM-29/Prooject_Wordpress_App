#vpc code

resource "aws_vpc" "skyage" {
  cidr_block = "172.16.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "skyage-vpc"
  }
} 
#Create a Public_Subnet 1
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.skyage.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet1"
  }
}
#Create a Public_Subnet 2
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.skyage.id
  cidr_block              = "172.16.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet2"
  }
}
#create a private-subnet1

resource "aws_subnet" "private_subnet1" {
  vpc_id                  = aws_vpc.skyage.id
  cidr_block              = "172.16.3.0/24"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "PrivateSubnet1"
  }
}
#create a private-subnet2
resource "aws_subnet" "private_subnet2" {
  vpc_id                  = aws_vpc.skyage.id
  cidr_block              = "172.16.4.0/24"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "PrivateSubnet2"
  }
}
# 2 database subnets
resource "aws_subnet" "skyage-database-subnet-1" {
  vpc_id            = aws_vpc.skyage.id
  cidr_block        = "172.16.5.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "database-subnet-1"
  }
}

resource "aws_subnet" "skyage-database-subnet-2" {
  vpc_id            = aws_vpc.skyage.id
  cidr_block        = "172.16.6.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "database-subnet-2"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "skyage_igw" {
  vpc_id = aws_vpc.skyage.id
  tags = {
    "Name" = "skyage-igw"
  }
}


