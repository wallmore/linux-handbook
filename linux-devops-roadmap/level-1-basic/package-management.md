#!/bin/bash
sudo yum update -y
sudo yum install -y git nginx java-17-amazon-corretto
sudo systemctl enable nginx
sudo systemctl start nginx
echo "Git, Nginx & Java installed successfully on Amazon Linux"
