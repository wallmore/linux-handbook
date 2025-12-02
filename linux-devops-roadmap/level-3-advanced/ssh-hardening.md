#!/bin/bash
# ---------- 2. SSH Hardening ----------
echo "➤ Applying SSH security configurations..."

sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd

echo "✔ SSH hardened: password login disabled, root login disabled"
echo
