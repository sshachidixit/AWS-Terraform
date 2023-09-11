provider "aws" {
    region = "ap-south-1"
}

module "ec2module" {
    source = "./Ec2"
    ec2name = "ec2modulename"
  
}