#!/bin/bash
set -e

echo "Updating system..."
sudo apt update -y

echo "Installing required packages..."
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "Setting up Docker GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Adding Docker repo..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Installing Docker..."
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Adding user to Docker group..."
sudo usermod -aG docker ubuntu

echo "Running Docker container..."
sudo docker run -d -p 80:3000 raja4123/simple-app
