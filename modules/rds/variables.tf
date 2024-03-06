# from vpc module
variable "private_db_subnet_1a_id" {}
variable "private_db_subnet_1b_id" {}

# from security group module
variable "db_sg_id" {}

# custom
variable "db_engine" {}
variable "db_engine_version" {}
variable "db_identifier" {}
variable "db_username" {}
variable "db_password" {}
variable "db_instance_class" {}
variable "db_allocated_storage" {}
variable "db_multi_az" {}




