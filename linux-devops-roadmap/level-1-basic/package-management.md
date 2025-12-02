#!/bin/bash
# ---------- 3. Install Packages ----------
echo "➤ Installing git, nginx, Java..."

if command -v apt >/dev/null 2>&1; then
    apt update -y
    apt install -y git nginx default-jdk
else
    yum install -y git nginx java-11-openjdk
fi

echo "✔ Installed Versions:"
git --version
nginx -v
java -version
echo
