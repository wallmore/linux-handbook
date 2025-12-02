#!/bin/bash
# ---------- 2. Utility automation scripts ----------
echo "➤ Creating cleanup, restart, and health check scripts..."

# Log cleanup script
cat <<EOF > /usr/local/bin/clean_logs.sh
#!/bin/bash
find /var/log -type f -name "*.log" -mtime +7 -exec rm -f {} \;
echo "Old logs cleared"



# Service restart script
cat <<EOF > /usr/local/bin/restart_services.sh
#!/bin/bash
systemctl restart nginx
systemctl restart sshd
EOF

# Health check script
cat <<EOF > /usr/local/bin/health_check.sh
#!/bin/bash
echo "CPU Load:"
uptime
echo "Disk Usage:"
df -h /
echo "Memory Usage:"
free -h
EOF

chmod +x /usr/local/bin/*.sh
echo "✔ Scripts created at /usr/local/bin/"
ls -l /usr/local/bin/*.sh
echo
