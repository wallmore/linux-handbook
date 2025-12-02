#!/bin/bash
# ---- Backup config ----
BACKUP_DIR="/backup/devteam"
mkdir -p $BACKUP_DIR

# ---- Create backup script ----
cat << 'EOF' > /usr/local/bin/dev_backup.sh
#!/bin/bash
BDIR="/backup/devteam"
DATE=$(date +%F)
USERS=$(getent group devteam | awk -F: '{print $4}' | tr ',' ' ')
for u in $USERS; do
  [ -d /home/$u ] && tar -czf $BDIR/${u}_$DATE.tar.gz /home/$u
done
find $BDIR -type f -mtime +7 -delete
EOF
chmod +x /usr/local/bin/dev_backup.sh

# ---- Cron job (daily @ 2 AM) ----
echo "0 2 * * * root /usr/local/bin/dev_backup.sh" > /etc/cron.d/dev_backup

echo "✔ Setup complete ( backup + cron )"
