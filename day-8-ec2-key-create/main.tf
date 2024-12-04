resource "aws_key_pair" "name" {
    key_name = "public"
    public_key = file("~/.ssh/id_ed25519.pub")
  
}

resource "aws_instance" "name" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    depends_on = [ aws_key_pair.name ]
  
}