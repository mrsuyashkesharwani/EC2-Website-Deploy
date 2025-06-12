resource "aws_instance" "test_server" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"
  user_data = <<EOF
#!/bin/bash
exec > /var/log/user-data.log 2>&1
set -x

yum update -y
yum install httpd wget unzip -y
systemctl start httpd
systemctl enable httpd

cd /tmp/
wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
unzip -o 2137_barista_cafe.zip
cp -r 2137_barista_cafe/* /var/www/html/
systemctl restart httpd
EOF

  tags = {
    Name = "Custom-Apaceh-Web-Server"
  }

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  associate_public_ip_address = true
}

resource "aws_security_group" "web_sg" {
  name        = "allow_http_ssh"
  description = "Allow HTTP and SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_vpc" "default" {
  default = true
}