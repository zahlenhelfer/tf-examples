provider "aws" {
  region     = "eu-central-1"
}

# Mein erster Webserver mit Terraform
resource "aws_instance" "web" { 
  ami           = "ami-0a02ee601d742e89f"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform Server 1",
    Kst = "666"
  }
}