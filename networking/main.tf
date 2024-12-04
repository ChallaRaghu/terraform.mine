resource "aws_key_pair" "key" {
    key_name = "key"
    public_key = file("~/.ssh/id_ed25519.pub")
  
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"


  
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true
  
}

resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.myvpc.id
  
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.myvpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ig.id
    }
  
}

resource "aws_route_table_association" "rt-ass" {
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.rt.id
  
}

resource "aws_security_group" "sg" {

    name = "mysg"
    vpc_id = aws_vpc.myvpc.id

    ingress {

        description = "HTTP from VPC"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  ingress {

    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  
}

resource "aws_instance" "ec2" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.sg.id]
    subnet_id = aws_subnet.subnet1.id
  
}
