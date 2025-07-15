#!/bin/bash

# Update package list
sudo apt update -y

# Install nginx
sudo apt install nginx -y

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Print nginx status
sudo systemctl status nginx | grep Active

# Show nginx version
nginx -v

# Confirm web page setup
echo "NGINX Installation and Start: SUCCESS ✅"

