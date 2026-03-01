#!/usr/bin/env bash
# health-check.sh - Simple system health reporter

# Log फाईलची डिरेक्टरी अस्तित्वात असल्याची खात्री करा
LOG_DIR="$HOME/ops-practice"
LOGFILE="$LOG_DIR/health.log"
mkdir -p "$LOG_DIR"

DATE=$(date '+%F %T')

# CPU, Memory आणि Disk ची माहिती गोळा करा
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')

# Log फाईलमध्ये डेटा लिहा
echo "[$DATE] CPU: ${CPU}% | MEM_Free: ${MEM_FREE}MB | Disk_Free: ${DISK_FREE}" >> "$LOGFILE"

# Log Rotation (जर फाईल > 1MB असेल तर)
if [ -f "$LOGFILE" ]; then
    # Linux साठी सुसंगत stat कमांड
    SIZE=$(stat -c%s "$LOGFILE")
    
    if [ "$SIZE" -gt 1000000 ]; then
        mv "$LOGFILE" "$LOGFILE.$(date +%F-%H%M).bak"
        echo "[$DATE] Log rotated due to size." > "$LOGFILE"
    fi
fi
