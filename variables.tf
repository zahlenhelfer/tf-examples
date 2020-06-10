# Variable für die Image-ID
variable "ami_id" {
  type = string
  default = "ami-0a02ee601d742e89f"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}