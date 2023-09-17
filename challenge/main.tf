provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "ec2" {
    ami = "ami-02bb7d8191b50f4bb"
    instance_type = "t2.micro"
    tags = {
      name = "DB server"
    }
  
  }

  output "Ec2_private_ip" {
    value = aws_instance.ec2.private_ip
    
  }

 resource "aws_instance" "ec2_1" {
    ami = "ami-02bb7d8191b50f4bb"
    instance_type = "t2.micro"
    tags = {
      name = "web server"
    }
    security_groups = [aws_security_group.SG.name]
    user_data = file("bootstrap.sh")
  } 

  resource "aws_eip" "elasticeip" {
    instance = aws_instance.ec2_1.id
    
  }

  output "eip_public_ip" {
    value = aws_eip.elasticeip.public_ip
  }

variable "ingressrules" {
    type = list(number)
    default = [ 80,443 ]
  
}

variable "egressrule" {
    type = list(number)
    default = [ 80,443 ]
  
}
resource "aws_security_group" "SG" {
    name = "webserver firewall"


    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "Http/Https"
        cidr_blocks = ["0.0.0.0/0"]

        }
      
    }
    dynamic "egress" {
        iterator = port
        for_each = var.egressrule
        content {
        from_port = port.value
        to_port = port.value
        protocol = "Http/Https"
        cidr_blocks = ["0.0.0.0/0"]

        }
      
    }
  
}