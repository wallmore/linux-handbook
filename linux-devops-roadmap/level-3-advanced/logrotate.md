#!/bin/bash
cat <<EOF | sudo tee /etc/logrotate.d/myapp
/var/log/myapp.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
}
EOF
echo "Logrotate config added"
