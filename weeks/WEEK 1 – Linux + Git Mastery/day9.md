# ✅ DAY-09: Script Enhancements — CPU Threshold Detection & Alert Logic

> **Environment:** AWS EC2 Ubuntu
> 
> 
> **Focus:** Bash Script Enhancement + Alerting
> 
> **Duration:** ~60 minutes
> 
> **Role Context:** DevOps / Platform Operations Practice
> 

---

## 🎯 Goal

Enhance the existing `health-check.sh` script to:

- Detect high CPU usage
- Compare against a defined threshold
- Log structured alert entries
- Handle float-to-integer conversion safely
- Prepare optional email alert mechanism

The objective was to simulate a **production-grade safeguard mechanism** for EC2 workloads.

---

## 📁 Step 1: Navigate to Script Directory

```bash
cd ~/bash-scripts
ls
```

Verified `health-check.sh` exists before editing.

---

## 📝 Step 2: Enhance Script with Threshold Logic

Opened script:

```bash
vim health-check.sh
```

### 📜 Enhancement Added (CPU Threshold Section)

```bash
# threshold example
CPU_LIMIT=80
CPU_INT=${CPU%.*}

if [ "$CPU_INT" -gt "$CPU_LIMIT" ]; then
  echo "[$DATE] ALERT: CPU ${CPU}% > ${CPU_LIMIT}%" >> "$LOGFILE"

  # If mailx configured:
  # echo "High CPU ${CPU}%" | mail -s "CPU Alert" you@example.com
fi
```

---

## 🧠 Enhancement Logic Breakdown

### 1️⃣ Define CPU Limit

```bash
CPU_LIMIT=80
```

Defines upper operational boundary (80%).

This value can be tuned based on:

- Instance size
- Workload type
- Traffic patterns

---

### 2️⃣ Convert Float to Integer

```bash
CPU_INT=${CPU%.*}
```

`top` returns float values (e.g., 3.4).

Bash integer comparison requires numeric values without decimals.

This removes everything after `.` safely.

---

### 3️⃣ Integer Comparison

```bash
if [ "$CPU_INT" -gt "$CPU_LIMIT" ];
```

- `gt` → numeric greater-than comparison
- Quotes prevent parsing errors

---

### 4️⃣ Structured Alert Logging

```bash
echo "[$DATE] ALERT: CPU ${CPU}% > ${CPU_LIMIT}%" >> "$LOGFILE"
```

Instead of printing to terminal, alerts are:

- Appended to log
- Timestamped
- Traceable during incident review

---

## 🧪 Step 3: Execution & Real Error Encountered

Initial execution:

```bash
bash health-check.sh
```

Encountered error:

```
integer expression expected
```

### 🔍 Root Cause

Float comparison attempted before integer extraction was handled correctly.

### ✅ Fix Applied

Used:

```bash
CPU_INT=${CPU%.*}
```

After fix:

```bash
bash health-check.sh
```

Execution completed successfully without errors.

---

## 📄 Step 4: Validate Log Output

```bash
cat ~/ops-practice/health.log
```

Verified entries such as:

```
[2026-02-18 18:48:32] CPU: 0% MEM_FREE= 319MB Disk_free: 4.1G
```

If threshold exceeded, expected format:

```
[2026-02-18 18:50:02] ALERT: CPU 87% > 80%
```

✔ Script executed

✔ Integer comparison successful

✔ Alert logic functioning

✔ Log file updated correctly

---

## 🧩 Optional Alert Extension Prepared

Included (commented):

```bash
# echo "High CPU ${CPU}%" | mail -s "CPU Alert" you@example.com
```

This prepares script for:

- Mailx configuration
- Cron-based monitoring
- Integration with alert systems
- Cloud migration to SNS / Slack / PagerDuty

---

## 🧠 Real Production Lessons Learned

From this enhancement:

- Float values break numeric comparisons
- Always normalize metric output before evaluation
- Defensive scripting prevents runtime failures
- Alerts must be logged, not just printed
- Threshold tuning is workload-dependent

---

## ⚙️ What This Simulates in Real DevOps

This enhancement represents:

- Lightweight monitoring agent
- Incident pre-detection logic
- Custom SRE safety mechanism
- On-call troubleshooting automation
- CPU spike detection on EC2 instances

In real production environments, this logic would integrate with:

- CloudWatch
- Prometheus exporters
- Centralized logging pipelines

---

## 🧠 Key Concepts Learned

| Concept | Practical Application |
| --- | --- |
| Integer comparison | Reliable metric validation |
| Float normalization | Prevent Bash errors |
| Threshold logic | Incident prevention |
| Structured logging | Audit trail & debugging |
| Alert preparation | Automation readiness |

---

## 🚀 Why This Matters for DevOps Roles

This exercise prepares for interview questions like:

- How would you detect CPU spikes using Bash?
- Why does Bash fail on float comparisons?
- How would you implement lightweight monitoring on AWS EC2?
- How do you prevent alert fatigue?
- How would you integrate this with centralized monitoring?

This is directly relevant for:

- DevOps Engineer
- Platform Operations Engineer
- Site Reliability Engineer (SRE)

Hiring managers value engineers who:

- Understand Linux internals
- Handle edge cases properly
- Write defensive automation
- Think in terms of reliability

---

## 🏁 Checkpoint

✔ CPU threshold defined

✔ Float-to-integer conversion implemented

✔ Alert logic added

✔ Error debugged & resolved

✔ Log verification successful

✔ Script ready for cron integration

✔ Git-ready enhancement

---
🖥️ Screenshots:

![Day-9—Script_enhancements_+_alerts_cat_scripts.1.jpeg](https://github.com/ThinkerOnlineHub/linux-basics/blob/89eab219c9a7227924db83d2d18ab56307aa2831/screenshots/Day-9%E2%80%94Script_enhancements_%2B_alerts_cat_scripts.1.jpeg)

![Day-9—Script_enhancements_+_alerts_cat_scripts_checking.png](https://github.com/ThinkerOnlineHub/linux-basics/blob/89eab219c9a7227924db83d2d18ab56307aa2831/screenshots/Day-9%E2%80%94Script_enhancements_%2B_alerts_cat_scripts_checking.png)

![Day-9—Script_enhancements_+_alerts_cat_scripts_log_check.png](https://github.com/ThinkerOnlineHub/linux-basics/blob/89eab219c9a7227924db83d2d18ab56307aa2831/screenshots/Day-9%E2%80%94Script_enhancements_%2B_alerts_cat_scripts_log_check.png)

![Day-9—Script_enhancements_+_alerts_ls.png](https://github.com/ThinkerOnlineHub/linux-basics/blob/89eab219c9a7227924db83d2d18ab56307aa2831/screenshots/Day-9%E2%80%94Script_enhancements_%2B_alerts_ls.png)

![Day-9—Script_seen_part1.png](https://github.com/ThinkerOnlineHub/linux-basics/blob/89eab219c9a7227924db83d2d18ab56307aa2831/screenshots/Day-9%E2%80%94Script_seen_part1.png)

![Day-9—Script_seen_part2.png](https://github.com/ThinkerOnlineHub/linux-basics/blob/89eab219c9a7227924db83d2d18ab56307aa2831/screenshots/Day-9%E2%80%94Script_seen_part2.png)

---

## 🔗 Links

🎥 **YouTube:** @ThinkerTechSutraMarathi

💻 **GitHub Repo:** ThinkerOnlineHub/linux-basics

📰 **Blog:** https://thinkertechsutramarathi.wordpress.com/
