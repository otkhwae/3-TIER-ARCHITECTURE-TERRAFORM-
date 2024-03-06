#=========================== create vpc ==========================
module "vpc" {
  # module source
  source = "../modules/vpc"

  # from vpc variables 
  project_name                 =  var.project_name
  vpc_cidr_block               =  var.vpc_cidr_block
  public_subnet_1a_cidr        =  var.public_subnet_1a_cidr   
  public_subnet_1b_cidr        =  var.public_subnet_1b_cidr
  private_app_subnet_1a_cidr   =  var.private_app_subnet_1a_cidr
  private_app_subnet_1b_cidr   =  var.private_app_subnet_1b_cidr
  private_db_subnet_1a_cidr    =  var.private_db_subnet_1a_cidr
  private_db_subnet_1b_cidr    =  var.private_db_subnet_1b_cidr
}


#========================= create nat gw ==========================
module "nat_gateway" {
  # module source
  source = "../modules/nat_gw"

  # from vpc module
  vpc_id                     =  module.vpc.vpc_id
  internet_gateway           =  module.vpc.internet_gateway
  public_subnet_1a_id        =  module.vpc.public_subnet_1a_id
  public_subnet_1b_id        =  module.vpc.public_subnet_1b_id
  private_app_subnet_1a_id   =  module.vpc.private_app_subnet_1a_id  
  private_app_subnet_1b_id   =  module.vpc.private_app_subnet_1b_id
  private_db_subnet_1a_id    =  module.vpc.private_db_subnet_1a_id
  private_db_subnet_1b_id    =  module.vpc.private_db_subnet_1b_id 
}

#=================== create security group =======================

module "security_grp" {
  # module source
  source = "../modules/security-group"

  # from vpc module
  vpc_id = module.vpc.vpc_id
}

#============================= create alb =========================

module "alb" {
  # module source
  source = "../modules/alb"

  # from vpc module
  project_name           =  module.vpc.project_name
  public_subnet_1a_id    =  module.vpc.public_subnet_1a_id
  public_subnet_1b_id    =  module.vpc.public_subnet_1b_id
  vpc_id                 =  module.vpc.vpc_id

  # from security grp module
  alb_sg_id         =  module.security_grp.alb_sg_id 

}


#============================= create asg =========================

module "asg" {
  # module source
  source = "../modules/asg"

  # from vpc module
  vpc_id                        =   module.vpc.vpc_id
  project_name                  =   module.vpc.project_name
  public_subnet_1a_id           =  module.vpc.public_subnet_1a_id
  public_subnet_1b_id           =  module.vpc.public_subnet_1b_id

  # from alb module
  alb_target_grp_arn            =   module.alb.alb_target_grp_arn
  
  # from security grp module
  asg_sg_id                     =   module.security_grp.asg_sg_id
  
  asg_max_size                  =   var.asg_max_size
  asg_min_size                  =   var.asg_min_size
  asg_desired_size              =   var.asg_desired_size
  asg_instance_type             =   var.asg_instance_type
  launch_template_ami           =   var.launch_template_ami
}

module "rds" {
  # module source
  source = "../modules/rds"

  # from vpc module
  private_db_subnet_1a_id    =  module.vpc.private_db_subnet_1a_id
  private_db_subnet_1b_id    =  module.vpc.private_db_subnet_1b_id 

  db_sg_id = module.security_grp.db_sg_id

  db_engine = var.db_engine
  db_engine_version = var.db_engine_version
  db_identifier = var.db_identifier
  db_username = var.db_username
  db_password = var.db_password
  db_instance_class = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_multi_az = var.db_multi_az
}