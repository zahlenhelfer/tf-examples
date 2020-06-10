provider "aws" {
  region     = "eu-central-1"
}

resource "aws_instance" "web" { 
  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform Server 1",
    Kst = "666"
  }
}