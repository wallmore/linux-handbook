#!/bin/bash
# ---------- 1. Backup Automation via Cron ----------
echo "➤ Creating daily backup script..."

BACKUP_SCRIPT="/usr/local/bin/backup.sh"

cat <<EOF > $BACKUP_SCRIPT
#!/bin/bash
tar -czvf /backup/project_\$(date +%F).tar.gz /project
EOF

chmod +x $BACKUP_SCRIPT

(crontab -l 2>/dev/null; echo "0 2 * * * $BACKUP_SCRIPT") | crontab -

echo "✔ Backup cron job added:"
crontab -l
echo
