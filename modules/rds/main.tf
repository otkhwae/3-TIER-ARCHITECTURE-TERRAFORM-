resource "aws_db_subnet_group" "db_subnet_group" {
  name = "db-subnet-group"
  subnet_ids = [var.private_db_subnet_1a_id,var.private_db_subnet_1b_id]

  tags = {
    Name = "My DB Subnet Group"
  }
}

resource "aws_db_instance" "rds_instance" {
  engine = var.db_engine
  engine_version =  var.db_engine_version
  multi_az = var.db_multi_az
  identifier = var.db_identifier
  username =  var.db_username
  password =  var.db_password
  instance_class =  var.db_instance_class
  allocated_storage =  var.db_allocated_storage
  db_subnet_group_name =  aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids =  [var.db_sg_id]
  #availability_zone =  
  skip_final_snapshot = true 
}