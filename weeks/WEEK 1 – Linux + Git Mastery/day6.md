
# Day-6: Linux Text Tools & System Logs

## 📌 Goal
Understand and practice essential Linux text tools — `tail`, `less`, `head`, `grep`, `awk`, `sed` — and learn how to inspect real system logs under `/var/log` like a DevOps / Platform Operations engineer.

---

## 🧩 1. Why Logs Matter in Linux

In real-world DevOps and Platform Operations work, **logs are the first place you look when something breaks**.

Whether it’s:
- an application crash
- a failed service
- an SSH login issue
- high CPU or memory usage
- or unexpected system behavior

👉 **Logs always tell the story.**

Linux provides powerful text-processing tools that allow engineers to:
- read very large log files safely
- filter errors instantly
- extract only the required fields
- debug live systems without downtime

This is exactly how on-call engineers work on production systems.

---

## 🔍 2. Viewing Recent Logs with `tail`

### Command Used
```bash
sudo tail -n 50 /var/log/syslog
````

### Explanation

* Displays the **last 50 lines** of the system log
* Quickly shows recent errors, warnings, and service events

### Why This Matters

When incidents occur, recent logs are usually the most relevant.
This command is commonly used during **incident triage**.

---

## 📖 3. Reading Large Logs Safely with `less`

### Command Used

```bash
less /var/log/syslog
```

### Explanation

* Opens logs in a **scrollable, memory-efficient viewer**
* Preferred over `cat` for large files

### Useful Keys

* `/error` → search for keyword
* `n` → next match
* `q` → quit

### Why This Matters

Production logs can be **hundreds of MBs or more**.
`less` prevents system overload while debugging.

---

## 🔄 4. Monitoring Logs in Real Time with `tail -f`

### Command Used

```bash
tail -f /var/log/syslog
```

### Explanation

* Streams log entries **live**
* Shows events as they happen

### Why This Matters

Critical for:

* service restarts
* SSH login tracking
* cron job monitoring
* live troubleshooting during outages

---

## 🔎 5. Searching Errors Using `grep`

### Command Used

```bash
grep -i error /var/log/syslog
```

### Explanation

* Filters only lines containing the word `error`
* `-i` makes the search case-insensitive

### Why This Matters

Instead of reading thousands of lines, you instantly focus on **failure signals**.

---

## 🧠 6. Extracting Process Data with `awk`

### Command Used

```bash
ps aux | awk '{print $1,$2,$11}' | head
```

### Explanation

Extracts:

* User
* Process ID (PID)
* Command name

### Why This Matters

Helps identify:

* resource-hungry processes
* suspicious services
* who owns which process

This is foundational for **performance debugging and security audits**.

---

## 🚀 Why This Matters for DevOps / SRE

In real production environments:

* Logs are often the **only source of truth**
* SSH + log inspection = **first response**
* Dashboards don’t show everything

These tools are used daily for:

* Incident response
* Root cause analysis (RCA)
* Service failure investigation
* Performance troubleshooting
* Security monitoring

If you can’t read logs confidently, you can’t operate production systems safely.

---

## 📊 Quick Summary

| Tool       | Purpose                   |
| ---------- | ------------------------- |
| `tail`     | View recent log entries   |
| `less`     | Safely read large files   |
| `grep`     | Search errors or keywords |
| `awk`      | Extract structured fields |
| `ps aux`   | Inspect running processes |
| `/var/log` | Core system log directory |

---

## 🖼️ Screenshots

📸 Terminal screenshots attached showing real execution on an AWS EC2 Ubuntu instance.

---

## 📝 Commit Message

```
Day-6: Practiced Linux text tools and system log analysis using tail, less, grep, awk on EC2
```

---

## ✅ End of Day-6

### You now understand:

* How to inspect Linux system logs safely
* How to monitor logs in real time
* How to filter errors instantly
* How DevOps engineers debug production systems
* Why text tools are foundational for SRE and Platform Ops roles

```

---

