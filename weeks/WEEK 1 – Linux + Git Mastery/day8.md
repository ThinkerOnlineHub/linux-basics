# ✅ DAY-08: Shell Scripting Basics — Health Check Automation

> **Environment:** AWS EC2 Ubuntu
> 
> 
> **Focus:** Bash scripting fundamentals
> 
> **Duration:** ~75 minutes
> 
> **Role Context:** DevOps / Platform Operations Practice
> 

---

## 🎯 Goal

Write a simple but production-relevant **bash script** using:

- Variables
- Command substitution
- Conditions (`if`)
- File checks
- Basic log rotation
- Execution permissions

The objective was to simulate a **real-world system health reporter** that logs CPU, memory, and disk usage.

---

## 📁 Step 1: Create Script File

I worked inside my `bash-scripts` directory.

```bash
cd bash-scripts
touch health-check.sh
ls
```

Verified file creation successfully.

---

## 📝 Step 2: Script Implementation

I edited the file:

```bash
vim health-check.sh
```

### 📜 Script Content Used

```bash
#!/usr/bin/env bash
# health-check.sh — simple system health reporter

LOGFILE="$HOME/ops-practice/health.log"
DATE=$(date '+%F %T')

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')

echo "[$DATE] CPU: ${CPU}%  MEM_free: ${MEM_FREE}MB  Disk_free: ${DISK_FREE}" >> "$LOGFILE"

# rotate log if > 1MB
if [ -f "$LOGFILE" ]; then
  SIZE=$(stat -c%s "$LOGFILE" 2>/dev/null || stat -f%z "$LOGFILE")
  if [ "$SIZE" -gt 1000000 ]; then
    mv "$LOGFILE" "$LOGFILE.$(date +%F-%H%M)"
  fi
fi
```

---

## 🧠 Script Logic Breakdown

### 1️⃣ Shebang

```bash
#!/usr/bin/env bash
```

Ensures the script runs using the correct Bash interpreter.

---

### 2️⃣ Variables

```bash
LOGFILE="$HOME/ops-practice/health.log"
DATE=$(date '+%F %T')
```

- `$HOME` ensures portability
- `$(date ...)` uses command substitution

---

### 3️⃣ CPU Usage

```bash
top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}'
```

- `b` batch mode
- `n1` single iteration
- `awk` calculates user + system CPU

---

### 4️⃣ Memory & Disk

```bash
free -m
df -h /
```

Used `awk` to extract required fields only.

---

### 5️⃣ Log Rotation Condition

```bash
if [ -f "$LOGFILE" ]; then
```

Checks file existence.

```bash
if [ "$SIZE" -gt 1000000 ];
```

If log exceeds 1MB → rotate with timestamp.

---

## 🔐 Step 3: Make Script Executable

From screenshots, I initially made some permission mistakes:

```bash
chmod -x health-check.sh
chmod +x bash-scripts/health-check.sh
```

After correcting path and permissions:

```bash
chmod +x bash-scripts/health-check.sh
```

Verified using:

```bash
ls -la
```

Executable bit successfully applied.

---

## ▶ Step 4: Execute Script

```bash
./bash-scripts/health-check.sh
```

Also tested using:

```bash
sh health-check.sh
```

Both executions succeeded.

---

## 📄 Step 5: Verify Log Output

```bash
tail -n 5 $HOME/ops-practice/health.log
```

Output confirmed entries like:

```
[2026-02-09 18:15:36] CPU: 3.4% MEM_free: 1542MB Disk_free: 18G
```

This validated:

✔ Script execution

✔ Log append

✔ Correct variable substitution

✔ No syntax errors

---

## 🧪 Real Mistakes & Learning (From Terminal History)

From history:

```bash
history | tail -n 15
```

I encountered:

- Path confusion (`/home/ubuntu/bin/`)
- Permission errors
- Trying to execute before chmod
- Running from wrong directory

📌 **Production Lesson:**

Always confirm:

- Current directory (`pwd`)
- File existence (`ls`)
- Execution permission (`ls -la`)
- Correct absolute path when using cron

---

## 🧩 GitHub Action

Committed file:

```bash
git add bash-scripts/health-check.sh
git commit -m "Add health-check script v1"
```

---

## 📊 What This Simulates in Real DevOps

This small script represents:

- Basic monitoring agent
- Custom health checker
- Log rotation logic
- Cron-ready automation script
- Incident debugging tool

Many production systems use similar logic inside:

- Cron jobs
- Monitoring wrappers
- Custom SRE tooling

---

## 🧠 Key Concepts Learned

| Concept | Practical Application |
| --- | --- |
| Shebang | Interpreter consistency |
| Variables | Dynamic values |
| Command substitution | Runtime execution |
| Conditions | Decision logic |
| File checks | Safe operations |
| Log rotation | Disk safety |
| chmod | Execution control |

---

## 🚀 Why This Matters for DevOps Roles

In interviews, this prepares you for questions like:

- How do you write a simple monitoring script?
- How do you handle log rotation?
- How do you debug permission issues?
- Difference between `sh script.sh` and `./script.sh`?
- Why use `$HOME` instead of hardcoded paths?

This is foundational for:

- DevOps Engineer
- Platform Ops Engineer
- Site Reliability Engineer (SRE)

---

## 🏁 Checkpoint

✔ Script created

✔ Made executable

✔ Executed successfully

✔ Log file updated

✔ Log rotation logic implemented

✔ Committed to GitHub

---

## 🧾 Git Commit Message

```bash
git commit -m "Day-08: Shell Scripting Basics — Health Check Automation"
```

---

## 🔗 Links

🎥 **YouTube:** @ThinkerTechSutraMarathi

💻 **GitHub Repo:** ThinkerOnlineHub/linux-basics

📰 **Blog:** [ThinkerTechSutraMarathi](https://thinkertechsutramarathi.wordpress.com/)
