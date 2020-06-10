resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.server_count

  tags = {
    Name = "Terraform Server ${count.index + 1}"
    Kst  = "666"
  }
}
