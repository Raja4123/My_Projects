provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0f918f7e67a3323f0" # Amazon Linux 2
  instance_type = "t2.micro"
  key_name = var.key_name
  

  provisioner "remote-exec" {
      script = "install_docker.bat"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("Keys/Raja-keypair.pem")
    host        = self.public_ip
    timeout = "10m"
  }
}

  tags = {
    Name = "SimpleDockerApp"
  }
}

output "instance_ip" {
  value = aws_instance.web.public_ip
}
