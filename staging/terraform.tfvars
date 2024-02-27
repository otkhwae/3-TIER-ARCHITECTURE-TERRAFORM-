# vpc variables
region                             =    "us-east-1"
profile                            =    "otkhwae"
project_name                       =    "staging"
vpc_cidr_block                     =    "10.0.0.0/16"
public_subnet_1a_cidr              =    "10.0.0.0/24"
public_subnet_1b_cidr              =    "10.0.1.0/24"
private_app_subnet_1a_cidr         =    "10.0.2.0/24"
private_app_subnet_1b_cidr         =    "10.0.3.0/24"
private_db_subnet_1a_cidr          =    "10.0.4.0/24"
private_db_subnet_1b_cidr          =    "10.0.5.0/24"


# asg variables
launch_template_ami      =   "ami-0c7217cdde317cfec" 
asg_instance_type        =   "t2.micro"
asg_max_size             =   2
asg_min_size             =   0
asg_desired_size         =   2
