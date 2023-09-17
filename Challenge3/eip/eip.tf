  variable "instance_id" {
    type = string
    
  }
  resource "aws_eip" "elasticeip" {
    instance = var.instance_id
    
  }

  output "eip_public_ip" {
    value = aws_eip.elasticeip.public_ip
  }
