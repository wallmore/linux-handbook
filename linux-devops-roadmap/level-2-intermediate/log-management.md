#!/bin/bash
A=/var/log/archive; mkdir -p $A
for f in /var/log/*.log; do [ -f $f ] && mv $f $A/$(basename $f)_$(date +%F); done
gzip -f $A/*.log 2>/dev/null
find $A -mtime +7 -delete

echo "logs stored in /var/logs" 
echo "files older than 7 days deleted"
