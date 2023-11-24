provider "aws" {
region = "ap-south-1"
access_key = "AKIAZZYUDJN2FNCTJVCT"
secret_key = "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"
}

resource "aws_instance" "one" {
  ami             = "ami-0d92749d46e71c34c"
  instance_type   = "t2.micro"
  key_name        = "suneel_AWS_Key"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "ap-south-1a"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my website created by terraform infrastructurte by suneel test server-1" > /var/www/html/index.html
EOF
  tags = {
    Name = "server-1"
  }
}

resource "aws_instance" "two" {
  ami             = "ami-0d92749d46e71c34c"
  instance_type   = "t2.micro"
  key_name        = "suneel_AWS_Key"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "ap-south-1b"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my website created by terraform infrastructurte by suneel test server-2" > /var/www/html/index.html
EOF
  tags = {
    Name = "server-2"
  }
}

