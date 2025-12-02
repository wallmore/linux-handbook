#!/bin/bash
# ---------- 3. Log Management ----------
echo "➤ Top 10 largest log files in /var/log:"
du -sh /var/log/* | sort -hr | head
echo
