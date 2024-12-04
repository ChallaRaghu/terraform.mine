module "testv" {
    source = "../Day-8"
    ami = "ami-0614680123427b75e"
    type = "t2.micro"
    key = "mykey"
  
}