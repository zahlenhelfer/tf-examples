resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  count                  = var.server_count
  vpc_security_group_ids = [module.web_server_sg.this_security_group_id]
  user_data              = file("user_data.sh")

  tags = {
    Name = "Terraform Server ${count.index + 1}"
    Kst  = "777"
  }
}
module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = var.security_group_name
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}