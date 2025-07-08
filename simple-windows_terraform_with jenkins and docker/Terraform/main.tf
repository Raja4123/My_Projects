provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0f918f7e67a3323f0" # Amazon Linux 2
  instance_type = "t2.micro"
  key_name = var.key_name
  

  provisioner "remote-exec" {
      "sudo apt update -y",
      "sudo apt install -y ca-certificates curl gnupg lsb-release",
      "sudo mkdir -p /etc/apt/keyrings",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg",
      "echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" |  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
      "sudo apt update -y",
      "sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin",
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "sudo usermod -aG docker ubuntu",
      "sudo docker run -d -p 80:3000 raja4123/simple-app"

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
