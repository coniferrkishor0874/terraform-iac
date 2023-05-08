data "aws_ami" "amz-linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.0.20230503.0-kernel-6.1-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.amz-linux.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet1.id

  tags = {
    Name = "Web-instance"
  }
}

variable "instance_type" {
  default = "t2.micro"
}
