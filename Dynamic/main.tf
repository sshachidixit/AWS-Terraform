#Usually company uses more than 1 port , so its good to use dynamic blocks

provider "aws" {
    region = "ap-south-1"
  
}
#Declare the varible for dynamic block
variable "ingressrules" {
    type = list(number)
    default = [ 22,443,80 ]
  
}

variable "egressrule" {
    type = list(number)
    default = [ 22,443,8080,80,25 ]
  
}


resource "aws_instance" "ec2" {
    ami = "ami-02bb7d8191b50f4bb"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.SG.name]
  
  }

resource "aws_security_group" "SG" {
    name = "Allow HTTPs"
  
  dynamic ingress {
    iterator = port
    for_each = var.ingressrules
    content {
    from_port = port.value
    to_port = port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
      
    }

  }

 dynamic egress {
    iterator = port
    for_each = var.egressrule
    content {
    from_port = port.value
    to_port = port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
      
    }

  }
}