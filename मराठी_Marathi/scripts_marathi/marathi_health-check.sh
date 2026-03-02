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


###############################**Cron Job** सेट करणे####################################

**Cron Job** सेट करणे खूप सोपे आहे. यामुळे तुमचे `health-check.sh` स्क्रिप्ट मानवी हस्तक्षेपाशिवाय दर तासाला ऑटोमॅटिक रन होईल.

खालील स्टेप्स फॉलो करा:

### १. Cron Table उघडा

तुमच्या टर्मिनलमध्ये खालील कमांड टाईप करा:

```bash
crontab -e

```

(जर तुम्हाला विचारले गेले, तर `1` दाबून **nano editor** निवडा.)

### २. खालील ओळ (Line) सर्वात शेवटी जोडा

तुमच्या फाईलचा जो अचूक **Path** आहे, तो इथे वापरा:

```cron
0 * * * * /bin/bash /home/tumche-username/ops-practice/health-check.sh

```

> **टीप:** `/home/tumche-username/` च्या जागी तुमच्या सिस्टिमचा खरा मार्ग (Path) लिहा. तुम्ही `pwd` कमांड वापरून तुमचा Path शोधू शकता.

### ३. Cron Job चे स्पष्टीकरण (Format)

या कमांडचा अर्थ असा होतो:

* **0**: प्रत्येक तासाच्या सुरुवातीला (0 मिनिटाला).
* *****: प्रत्येक तासाला.
* *****: प्रत्येक दिवशी.
* *****: प्रत्येक महिन्याला.
* *****: आठवड्याच्या प्रत्येक दिवशी.

---

### ४. स्क्रिप्टला 'Executable' करण्याची खात्री करा

तुमचे स्क्रिप्ट रन होण्यासाठी त्याला परवानगी (Permission) असणे गरजेचे आहे:

```bash
chmod +x ~/ops-practice/health-check.sh

```

### ५. झालेली प्रगती कशी तपासायची?

तुमचा **Cron Job** नीट सेट झाला आहे का हे पाहण्यासाठी:

```bash
crontab -l

```

आणि दर तासाला तुमची `health.log` फाईल अपडेट होत आहे का ते तपासा.

---
