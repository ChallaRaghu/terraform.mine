resource "aws_instance" "c1" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "mykey"
    count = length(var.counter)
    tags = {
      #Name = "web${count.index}"
      Name = var.counter[count.index]
    }
  
}