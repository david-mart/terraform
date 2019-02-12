variable "instance_type" { }
variable "subnet_id" { }
variable "name" { }
variable "vpc_id" { }
variable "user_data" { }
variable "pgpass_file" { }
variable "sa_json_file" { }
variable "private_key" { }
variable "ssh_key_name" { }
variable "allow_ips" { type = "list" }

output "public_ip" { value = "${aws_instance.default.public_ip}" }

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-cosmic-18.10-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "default" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"
  associate_public_ip_address = true
  subnet_id = "${var.subnet_id}"
  key_name = "${var.ssh_key_name}"

  vpc_security_group_ids = [ "${aws_security_group.default.id}" ]

  user_data = "${var.user_data}"

  provisioner "file" {
    source = "${var.pgpass_file}"
    destination = "/home/ubuntu/pgpass"

    connection {
      user = "ubuntu"
      private_key = "${var.private_key}"
    }
  }

  provisioner "file" {
    source = "${var.sa_json_file}"
    destination = "/home/ubuntu/sa.json"

    connection {
      user = "ubuntu"
      private_key = "${var.private_key}"
    }
  }

  tags {
    Name = "${var.name}"
  }
}

resource "aws_security_group" "default" {
  name        = "sada-sg"
  description = "Allow SADA employees"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.allow_ips}"
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
