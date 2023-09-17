provider "aws" {
    region = "ap-south-1"
}

module "Db" {
    source = "./Db"
    
  
}

output "Db_ec2_output" {
  value = module.Db.Ec2_private_ip_db
}

module "web" {
    source = "./web"
    
  
}

output "main_eip_public_ip" {
  value = module.web.web_eip_public_ip
  
}