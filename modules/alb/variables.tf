# from vpc module output
variable "project_name" {}
variable "public_subnet_1a_id" {}
variable "public_subnet_1b_id" {}
variable "vpc_id" {}

# from acm module output
#variable "certificate_arn" {}

# from security grp module output
variable "alb_sg_id" {}

# custom