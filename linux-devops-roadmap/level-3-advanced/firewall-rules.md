#!/bin/bash
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw logging on
echo "Enabling UFW firewall..."
sudo ufw --force enable

echo "✔ Firewall configured for ports 80 & 443"
echo "Firewall configured: SSH, HTTP, HTTPS allowed"
sudo ufw status verbose
