#========= aws provider ==========
variable "region" {}
variable "profile" {}

#============ vpc ==============
variable "project_name" {}
variable "vpc_cidr_block" {}

# public subnet cidr
variable "public_subnet_1a_cidr" {}
variable "public_subnet_1b_cidr" {}

# private app subnet cidr 
variable "private_app_subnet_1a_cidr" {}
variable "private_app_subnet_1b_cidr" {}

# private db subnet cidr 
variable "private_db_subnet_1a_cidr" {}
variable "private_db_subnet_1b_cidr" {}

#============== asg ==================
variable "launch_template_ami" {}
variable "asg_instance_type" {}
variable "asg_max_size" {}
variable "asg_min_size" {}
variable "asg_desired_size" {}

#================= db ====================
variable "db_engine" {}
variable "db_engine_version" {}
variable "db_identifier" {}
variable "db_username" {}
variable "db_password" {}
variable "db_instance_class" {}
variable "db_allocated_storage" {}
variable "db_multi_az" {}






