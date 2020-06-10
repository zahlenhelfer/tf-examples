provider "aws" {
  region     = "eu-central-1"
}

resource "aws_instance" "web" { 
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Terraform Server 1",
    Kst = "666"
  }
}

resource "aws_instance" "web2" { 
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Terraform Server 2",
    Kst = "4711"
  }
}