variable "aws_region" {
    description = "Add aws region"
    type = string
    default = "us-east-1"
  
}

/*variable "instance_type" {
    description = "ADD instance type"
    type = string
    default = "t2.micro"
  
}*/

#Aws Ec2 instance key pair
variable "instance_keypair" {
    description = "ADD ec2 key pair that needs to be associated with Ec2"
    type = string
    default = "terraform-key"
  
}

# AWS ec2 instance type in list varible
/*variable "instance_type_list" {
    description = "Adding aws ec2 instance in list format"
    type = list(string)
    default = [ "t2.micro", "t3.micro" ]
  
}
*/

# AWS ec2 instance map type
variable "instance_type_map" {
    description = "Adding ec2 instance in map format"
    type = map(string)
    default = {
      "dev" = "t2.micro"
      "qa"  = "t2.micro"
      "prod" = "t2.micro"
    }
  
}
