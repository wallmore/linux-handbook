#!/bin/bash
# ---------- 1. Create Users & Groups ----------
echo "➤ Creating dev group and users..."

groupadd devteam 2>/dev/null

for user in dev1 dev2 dev3; do
    useradd -m -G devteam $user 2>/dev/null
done

echo "✔ Users created. Current dev users:"
grep "dev" /etc/passwd
echo
