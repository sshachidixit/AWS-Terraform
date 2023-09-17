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

output "sg_name" {
    value = aws_security_group.SG.name
  
}