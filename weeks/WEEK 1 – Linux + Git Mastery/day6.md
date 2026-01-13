# ✅ DAY-06: Linux Text Tools & Logs (AWS Ubuntu)

> **Goal:**
> Learn how to read, monitor, filter, and analyze Linux logs using real production-style commands.
>
> Log analysis is a **core daily responsibility** of Platform Operations, DevOps, and SRE engineers.

---

## 🧩 1. Why Logs Matter in Linux

Logs are the **first place** engineers look when something breaks.

They help answer:

- Why did a service fail?
- What error occurred?
- When did the issue start?
- Which process caused it?

In AWS EC2 Ubuntu, system logs are primarily stored under: 
/var/log/

---

## 🔍 2. Viewing Recent Logs with `tail`

### Command used:

```bash
sudo tail -n 50 /var/log/syslog

```

Explanation:
```bash
tail → shows the last lines of a file

n 50 → display last 50 entries

syslog → main system activity log
```

📌 This is commonly used during incident investigation.

📖 3. Reading Logs Safely with less

Command used:

```bash
less /var/log/syslog
```
​
Explanation:

Allows scrolling through large log files

Does not load entire file into memory

Useful for deep log inspection

Helpful keys:

↑ ↓ → scroll

/error → search keyword

q → quit

🔁 4. Live Log Monitoring with tail -f

Command used:

```bash
tail -f /var/log/syslog
```
​
Explanation:

f → follow the log in real time

Shows new log entries as they happen

📌 Used when:

Restarting services

Debugging live issues

Watching application behavior

🚨 5. Filtering Errors Using grep

Command used:

```bash
grep -i error /var/log/syslog
```
​
Explanation:

grep → search text

i → case-insensitive

error → keyword

✔ Quickly isolates failure messages

✔ Reduces noise in large logs

🧠 6. Combining Logs with Process Analysis

To understand which process generated logs, I checked running processes:

Command used:

```bash
ps aux | awk '{print $1,$2,$11}' | head
ps aux | awk '{print $1,$2,$11}' | tail
```
​
Explanation:

Displays USER, PID, COMMAND

Helps correlate logs with active processes

Useful during high CPU / memory incidents

🧾 7. Checking Command History (Audit & Debugging)

Command used:
```bash
history | tail -20
```
​
Explanation:

Shows last executed commands

Helps track changes made on the system

Useful for auditing and rollback analysis

🧪 8. FULL TERMINAL SESSION (Real AWS Practice)

```bash
sudo tail -n 50 /var/log/syslog

less /var/log/syslog

tail -f /var/log/syslog

grep -i error /var/log/syslog

ps aux | awk '{print $1,$2,$11}' | head

ps aux | awk '{print $1,$2,$11}' | tail

history | tail -20

```
​
🎯 9. Why This Matters for DevOps / Platform Ops / SRE

✔ Production issues are solved using logs

✔ Most outages start with tail, grep, less

✔ Logs + processes = root cause analysis

✔ Essential for on-call rotations

🧠 Quick Summary
Command
Purpose
tail
View recent logs
less
Read large log files
tail -f
Live log monitoring
grep
Filter errors
ps + awk
Process correlation
history
Command audit


📌 Screenshot – Commands Output

screenshots/Day-06_AWS_Ubuntu_Text_Tools_Logs.png

​
💬 Commit Message

Add day-06.md — Linux Text Tools & Logs (AWS Ubuntu)

​
✅ End of Day-06

You now understand:

✔ How to read Linux logs

✔ How to monitor live system activity

✔ How to filter errors efficiently

✔ How to correlate logs with processes

✔ Real AWS Ubuntu troubleshooting basics
