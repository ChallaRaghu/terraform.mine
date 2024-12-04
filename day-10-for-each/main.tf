provider "aws" {
  
}

resource "aws_instance" "ec2" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "mykey"
    for_each = toset(var.foru)
    tags = {
      Name = each.value
    }
  
}