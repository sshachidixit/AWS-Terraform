provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "ec2" {
    ami = "ami-02bb7d8191b50f4bb"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.SG.name]
  
  }

resource "aws_security_group" "SG" {
    name = "Allow HTTPs"
  
  ingress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}