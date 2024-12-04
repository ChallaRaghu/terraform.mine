provider "aws" {
  
}

resource "aws_instance" "ec2" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "mykey"

    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("~/.ssh/id_ed25519")
      host = self.public_ip

    }

    # local provisioners

    provisioner "remote-exec" {
        inline = [
            "touch file200",
            "echo hello from aws >> file200",
        ]
      
    }
  
}


