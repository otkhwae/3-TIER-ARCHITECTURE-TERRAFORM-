#================ create vpc =======================
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

#=========== create igw & attach to vpc ================
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

#==================== create public route table ===============
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  route {
        ipv6_cidr_block = "::/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

  tags = {
    Name = "public-route-table"
  }
}

#=================== create public subnet 1a =============
resource "aws_subnet" "public_subnet_1a" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_1a_cidr
  availability_zone =  data.aws_availability_zones.azs.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1a"
  }
}

#=================== create public subnet-1b ===============
resource "aws_subnet" "public_subnet_1b" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_1b_cidr
  availability_zone =  data.aws_availability_zones.azs.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1b"
  }
}

#=================== create private app subnet 1a =============
resource "aws_subnet" "private_app_subnet_1a" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_app_subnet_1a_cidr
  availability_zone =  data.aws_availability_zones.azs.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-app-subnet-1a"
  }
}

#=================== create private app subnet-1b ===============
resource "aws_subnet" "private_app_subnet_1b" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_app_subnet_1b_cidr
  availability_zone =  data.aws_availability_zones.azs.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-app-subnet-1b"
  }
}

#=================== create private db subnet 1a =============
resource "aws_subnet" "private_db_subnet_1a" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_db_subnet_1a_cidr
  availability_zone =  data.aws_availability_zones.azs.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-db-subnet-1a"
  }
}

#=================== create private db subnet-1b ===============
resource "aws_subnet" "private_db_subnet_1b" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_db_subnet_1b_cidr
  availability_zone =  data.aws_availability_zones.azs.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-db-subnet-1b"
  }
}

#================ ass. public subnet 1a to public route table ===========
resource "aws_route_table_association" "pub_1a_pub_rt_ass" {
  subnet_id = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_route_table.id
}

#================ ass. public subnet 1b to public route table ===========
resource "aws_route_table_association" "pub_1b_pub_rt_ass" {
  subnet_id = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_route_table.id
}



