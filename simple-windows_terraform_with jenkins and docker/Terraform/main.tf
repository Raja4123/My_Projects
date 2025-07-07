provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = "t2.micro"
  key_name      = var.key_name

  provisioner "remote-exec" {
    inline = [
      "sudo yum install docker -y",
      "sudo service docker start",
      "sudo usermod -aG docker ec2-user",
      "docker run -d -p 80:3000 your-dockerhub-username/simple-app"
    ]
  }

  tags = {
    Name = "SimpleDockerApp"
  }
}

output "instance_ip" {
  value = aws_instance.web.public_ip
}
