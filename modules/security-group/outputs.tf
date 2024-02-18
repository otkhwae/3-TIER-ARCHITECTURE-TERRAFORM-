output "alb_sg_id" {
  value = aws_security_group.alb_web_security_grp.id
}

output "asg_sg_id" {
  value = aws_security_group.asg_security_grp.id
}

output "ec2_sg_id" {
  value = aws_security_group.ec2_security_grp.id
}