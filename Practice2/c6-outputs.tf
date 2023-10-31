# since we are using count meta argument

#Using latest generalized splat operator

output "splat_instnace_publicdns" {
    description = "Getting public dns for all the ec2 which will be created from count"
    value = aws_instance.myec2[*].public_dns
  
}