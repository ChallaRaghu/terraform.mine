module "name" {
  source = "github.com/CloudTechDevOps/terraform-10-30am/day-2-basic-ec2"
  ami = "ami-0614680123427b75e"
  instance_type = "t2.micro"
  key_name = "mykey"
}