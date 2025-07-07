provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0d03cb826412c6b0f" # Amazon Linux 2
  instance_type = "t2.micro"
  

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
