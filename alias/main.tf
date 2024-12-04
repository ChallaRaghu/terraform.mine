provider "aws" {
  
}

provider "aws" {
    region = "us-east-1"
    alias = "america"
  
}
resource "aws_instance" "ec2-1" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "mykey"
  
}

resource "aws_s3_bucket" "s3" {
    bucket = "thisismeforyouuu"
    provider = aws.america

  

}