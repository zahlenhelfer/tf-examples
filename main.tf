resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  count                  = var.server_count
  vpc_security_group_ids = [aws_security_group.sgwebserver.id]
  user_data              = <<-EOF
                    #!/bin/bash
                    yum install httpd -y
                    /sbin/chkconfig --levels 235 httpd on
                    service httpd start
                    instanceId=$(curl http://169.254.169.254/latest/meta-data/instance-id)
                    region=$(curl http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')
                    echo "<h1>$instanceId from $region</h1>" > /var/www/html/index.html
                  EOF

  tags = {
    Name = "Terraform Server ${count.index + 1}"
    Kst  = "666"
  }

#  depends_on = [aws_security_group.sgwebserver]

}

resource "aws_security_group" "sgwebserver" {

  name = var.security_group_name

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}