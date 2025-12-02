#!/bin/bash
# ---------- 2. Manage Directory Permissions ----------
echo "➤ Setting up /project directory with devteam permissions..."

mkdir -p /project
chown :devteam /project
chmod 2775 /project  # group inheritance

echo "✔ Directory permissions applied:"
ls -ld /project
echo

