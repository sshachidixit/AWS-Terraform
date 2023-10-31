/*
resource "aws_instance" "myec2" {
    ami = "ami-0dbc3d7bc646e8516"
    instance_type = "t2.micro"
    user_data = file("${path.module}/app1.install.sh")
  
}
*/