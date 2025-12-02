#!/bin/bash
# ---------- 4. System Information ----------
echo "➤ System Information Summary:"
echo "CPU Info:"
lscpu | head -5

echo -e "\nMemory Info:"
free -h

echo -e "\nDisk Info:"
df -h /
echo
