#!/usr/bin/env bash 
# health-check.sh - simple system health reporter

LOGFILE="$HOME/ops-practice/health.log"
DATE=$(date '+%F %T')

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')

echo "[$DATE] CPU: ${CPU}% MEM_free: ${MEM_FREE}MB Disk_free: ${DISK_FREE}" >> "$LOGFILE"

# rotate log if > 1MB
if [ -f "$LOGFILE" ]; then
	SIZE=$(stat -c%s "$LOGFILE" 2>/dev/null || stat -f%z "$LOGFILE")
	if [ "$SIZE" -gt 1000000 ]; then
	mv "$LOGFILE" "$LOGFILE.$(date +%F-%H%M)"
	fi
fi