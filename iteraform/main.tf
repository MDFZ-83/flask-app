
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_instance" "mfz-instance" {
  ami = "ami-03025bb25a1de0fc2"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.devops-mfz-sc.name]

}

resource "aws_security_group" "devops-mfz-sc" {
  name = "mfz-sc"
  description = "Allow SSH and HTTP"
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
