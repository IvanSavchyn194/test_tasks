provider "aws" {
  region                  = "eu-central-1"
}
resource "aws_instance" "Apache_server" {
  ami                    = "ami-0a49b025fffbbdac6"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_server_http_https_ssh.id]
  key_name   = "ivan-key"
  user_data              = file("server_setup.sh")
  tags                   = {
    Name = "Apache2_server"
  }
}
resource "aws_key_pair" "deployer" {
  key_name   = "ivan-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_security_group" "web_server_http_https_ssh" {
  name = "Web_security_group"

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.Apache_server.public_ip
}