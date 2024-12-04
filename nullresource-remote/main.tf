provider "aws" {
  
}

resource "aws_instance" "ec2" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "mykey"
  
}

resource "null_resource" "remote" {
    depends_on = [ aws_instance.ec2 ]

    provisioner "remote-exec" {
        connection {
          type = "ssh"
          user = "ec2-user"
          private_key = file("~/.ssh/id_ed25519")
          host = aws_instance.ec2.public_ip
        }

        inline = [ 
            "sudo yum update -y",
            "sudo yum install -y httpd",
            "sudo systemctl start httpd",
            "sudo systemctl enable httpd"
        ]  
      
    }
  
}