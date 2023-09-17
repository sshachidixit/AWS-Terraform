resource "aws_instance" "ec2" {
    ami = "ami-02bb7d8191b50f4bb"
    instance_type = "t2.micro"
    tags = {
      name = "DB server"
    }
  
  }

  output "Ec2_private_ip_db" {
    value = aws_instance.ec2.private_ip
    
  }
