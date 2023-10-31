variable "aws_region" {
    description = "Add aws region"
    type = string
    default = "us-east-1"
  
}

variable "instance_type" {
    description = "ADD instance type"
    type = string
    default = "t2.micro"
  
}

#Aws Ec2 instance key pair
variable "instance_keypair" {
    description = "ADD ec2 key pair that needs to be associated with Ec2"
    type = string
    default = "terraform-key"
  
}

