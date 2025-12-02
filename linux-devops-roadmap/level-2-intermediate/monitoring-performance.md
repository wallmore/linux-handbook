#!/bin/bash

echo "=== SYSTEM PERFORMANCE ==="
echo "CPU:"; top -bn1 | grep "Cpu(s)"
echo "MEM:"; free -h
echo "DISK:"; df -h --total | grep total
echo "LOAD:"; uptime | awk -F'load average:' '{print $2}'

echo -e "\n=== SERVICE TROUBLESHOOTING ==="
echo "FAILED SERVICES:"; systemctl --failed

echo -e "\nRUNNING SERVICES (top 10):"
systemctl list-units --type=service --state=running | head -10

echo -e "\nRestarting failed services..."
for s in $(systemctl --failed --no-legend | awk '{print $1}'); do
    systemctl restart $s
done

echo -e "\nENABLED BUT NOT RUNNING:"
for s in $(systemctl list-unit-files --type=service --state=enabled | awk '{print $1}'); do
    systemctl is-active $s >/dev/null 2>&1 || echo "$s"
done

