#!/bin/bash
# ---------- 4. Performance Monitoring ----------
echo "➤ Running services:"
systemctl list-units --type=service --state=running | head
echo

