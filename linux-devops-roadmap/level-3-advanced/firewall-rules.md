#!/bin/bash
# ---------- 4. Firewall rules ----------
echo "➤ Applying firewall rules for HTTP/HTTPS..."

if command -v firewall-cmd >/dev/null 2>&1; then
    firewall-cmd --add-service=http --permanent
    firewall-cmd --add-service=https --permanent
    firewall-cmd --reload
else
    ufw allow 80
    ufw allow 443
    ufw reload
fi

echo "✔ Firewall configured for ports 80 & 443"
echo
