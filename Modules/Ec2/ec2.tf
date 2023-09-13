#Varibale declaration

variable "ec2name" {
    type = string
  
}


resource "aws_instance" "ec2" {
    ami = "ami-02bb7d8191b50f4bb"
    instance_type = "t2.micro"
    tags = {
      Name =var.ec2name
    }
}

output "ec2id" {
  value = aws_instance.ec2.id
}