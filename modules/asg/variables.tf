# from vpc output
variable "vpc_id" {}
variable "project_name" {}

variable "public_subnet_1a_id" {}
variable "public_subnet_1b_id" {}

#from alb output
variable "alb_target_grp_arn" {}


#from security group output
variable "asg_sg_id" {}

#custom
variable "launch_template_ami" {}
variable "asg_instance_type" {}
variable "asg_max_size" {}
variable "asg_min_size" {}
variable "asg_desired_size" {}
#variable "install_script" {}

