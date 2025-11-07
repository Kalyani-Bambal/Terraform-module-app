# key pair (login)

# resource "aws_key_pair" "my_infra_key" {
#   key_name   = "terra-key-1"
#   public_key = file("${path.module}/terra-key-1.pub")
# }


#vpc & Security Group

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-app-sg"
  description = "this will add a TF generated security group"
  vpc_id      = aws_default_vpc.default.id


  # inbound rules

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
  }


  # outbound rules

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open outbound"
  }

  tags = {
    Name = "${var.env}-infra-app-sg"
  }
}


# ec2 instance

resource "aws_instance" "my_instance" {
  count          = var.instance_count  
  depends_on     = [aws_security_group.my_security_group]
  key_name       = "terra-key"
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = var.instance_type
  ami             = var.ami_id


  root_block_device {
    volume_size = var.env == "prd" ? 20 : 10
    volume_type = "gp3"
  }
  tags = {
    Name      = "${var.env}-infra-app-instance"
    Environment = var.env
  }
}


