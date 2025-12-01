#!/usr/bin/env bash
#
# system_info.sh
# Quick system info summary.

set -euo pipefail

echo "==== Hostname ===="
hostname

echo
echo "==== OS ===="
lsb_release -a 2>/dev/null || cat /etc/os-release

echo
echo "==== Uptime ===="
uptime

echo
echo "==== CPU ===="
lscpu | grep -E 'Model name|CPU\(s\)|Thread|Core|Socket|MHz'

echo
echo "==== Memory ===="
free -h

echo
.
echo "==== Disk Usage ===="
df -hT

echo
echo "==== Top Processes (by memory) ===="
ps aux --sort=-%mem | head -n 15

