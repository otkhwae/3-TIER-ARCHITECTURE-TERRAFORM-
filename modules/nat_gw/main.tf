#========================= nat gw subnet 1a ============================

# elastic ip for nat gw public subnet 1a
resource "aws_eip" "nat_gw_eip_1a" {
  domain   = "vpc"

  tags = {
    Name = "nat-gw-eip-1a"
  }
}

# nat-gw az 1a
resource "aws_nat_gateway" "nat_gw_az_1a" {
  allocation_id = aws_eip.nat_gw_eip_1a.id
  subnet_id = var.public_subnet_1a_id

  tags = {
    Name = "nat-gw-az-1a"
  }
  depends_on = [ var.internet_gateway ]
}

# create private route table for az 1a
resource "aws_route_table" "private_rt_az_1a" {
  vpc_id = var.vpc_id

  route {
    cidr_block =  "0.0.0.0/0"
    nat_gateway_id =  aws_nat_gateway.nat_gw_az_1a.id
  }

  tags = {
    Name = "private-rt-az-1a"
  }
}

# ass. private app subnet 1a to private route table az 1a
resource "aws_route_table_association" "private_app_1a_private_rt_ass" {
  subnet_id = var.private_app_subnet_1a_id
  route_table_id =  aws_route_table.private_rt_az_1a.id
}

# ass. private db subnet 1a to private route table az 1a
resource "aws_route_table_association" "private_db_1a_private_rt_ass" {
  subnet_id = var.private_db_subnet_1a_id
  route_table_id =  aws_route_table.private_rt_az_1a.id
}

#========================= nat gw subnet 1b ============================

# elastic ip for nat gw public subnet 1b
resource "aws_eip" "nat_gw_eip_1b" {
  domain   = "vpc"

  tags = {
    Name = "nat-gw-eip-1b"
  }
}


# nat-gw public subnet 1b
resource "aws_nat_gateway" "nat_gw_az_1b" {
  allocation_id = aws_eip.nat_gw_eip_1b.id
  subnet_id = var.public_subnet_1b_id

  tags = {
    Name = "nat-gw-az-1b"
  }
  depends_on = [ var.internet_gateway ]
}


# create private route table for az 1b
resource "aws_route_table" "private_rt_az_1b" {
  vpc_id = var.vpc_id

  route {
    cidr_block =  "0.0.0.0/0"
    nat_gateway_id =  aws_nat_gateway.nat_gw_az_1b.id
  }

  tags = {
    Name = "private rt az 1b"
  }
}

# ass. private app subnet 1a to private route table az 1b
resource "aws_route_table_association" "private_app_1b_private_rt_ass" {
  subnet_id = var.private_app_subnet_1b_id
  route_table_id =  aws_route_table.private_rt_az_1b.id
}

# ass. private data subnet 1a to private route table az 1b
resource "aws_route_table_association" "private_db_1b_private_rt_ass" {
  subnet_id = var.private_db_subnet_1b_id
  route_table_id =  aws_route_table.private_rt_az_1b.id
}

