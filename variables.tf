# Variable für die Image-ID
variable "ami_id" {
  type    = string
  default = "ami-0a02ee601d742e89f"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "server_count" {
  type = number
}

variable "security_group_name" {
  type    = string
  default = "SG Webserver Port 80"
}

variable "server_port" {
  type = number
}
