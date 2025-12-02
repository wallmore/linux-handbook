#!/bin/bash
# ---------- 1. Custom systemd service ----------
echo "➤ Creating systemd service for MyApp..."

APP_SERVICE="/etc/systemd/system/myapp.service"

cat <<EOF > $APP_SERVICE
[Unit]
Description=My Application Service
After=network.target

[Service]
ExecStart=/usr/local/bin/myapp.sh
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable myapp.service

echo "✔ systemd service created:"
systemctl status myapp.service | head
echo

