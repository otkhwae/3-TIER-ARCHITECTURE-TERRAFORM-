#================= vpc ====================

output "project_name" {
  value = var.project_name
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

#================= subnets id ====================

output "public_subnet_1a_id" {
  value = aws_subnet.public_subnet_1a.id
}

output "public_subnet_1b_id" {
  value = aws_subnet.public_subnet_1b.id
}

output "private_app_subnet_1a_id" {
  value = aws_subnet.private_app_subnet_1a.id
}

output "private_app_subnet_1b_id" {
  value = aws_subnet.private_app_subnet_1b.id
}

output "private_db_subnet_1a_id" {
  value = aws_subnet.private_db_subnet_1a.id
}

output "private_db_subnet_1b_id" {
  value = aws_subnet.private_db_subnet_1b.id
}

#========================= igw =====================
output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway
}


