#!/bin/bash
# ---------- 5. Logrotate configuration ----------
echo "➤ Creating logrotate config for /var/log/myapp.log..."

cat <<EOF > /etc/logrotate.d/myapp
/var/log/myapp.log {
    weekly
    rotate 4
    compress
    missingok
    notifempty
}
EOF

echo "✔ Logrotate config added"
logrotate -d /etc/logrotate.d/myapp
echo
