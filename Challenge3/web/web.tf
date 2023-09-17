 resource "aws_instance" "ec2_1" {
    ami = "ami-02bb7d8191b50f4bb"
    instance_type = "t2.micro"
    tags = {
      name = "web server"
    }
    security_groups = [module.sg.sg_name]
    # Using file function - it will read the file and pass it to use_rdata
    user_data = file("./web/bootstrap.sh")
  } 


module "eip" {
  source = "../eip"
  instance_id = aws_instance.ec2_1.id
}

module "sg" {
  source = "../sg"
  
}

output "web_eip_public_ip" {
  value = module.eip.eip_public_ip
  
}

