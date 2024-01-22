provider "aws" {

        region = "us-east-1"
}


resource "aws_key_pair" "key" {

        key_name = "terra_key"
        public_key = file("/home/ubuntu/.ssh/terra_key.pub")
}

resource "aws_default_vpc" "default_vpc" {
}

resource "aws_security_group" "allow_ssh" {
        name = "allow_ssh"
        description = "allow ssh traffic"
        vpc_id = aws_default_vpc.default_vpc.id

        ingress {

        from_port = 22
        to_port = 22
        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]
        }

        tags = {
              Name = "ec2-allow-ssh"
}


}




resource "aws_instance" "ec2" {
        key_name = aws_key_pair.key.key_name
        ami = "ami-0c7217cdde317cfec"
        instance_type = "t2.micro"
        security_groups= [aws_security_group.allow_ssh.name]
}
