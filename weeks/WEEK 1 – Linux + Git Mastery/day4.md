# ✅ **DAY-04: Linux Processes & Services (AWS Ubuntu)**

> **Goal:** Learn how to monitor, manage, and control Linux processes and system services using  
> `ps`, `top`, `htop`, `kill / pkill`, and `systemctl`.

This is a **core skill** for **DevOps, SRE, and Platform Engineers**, because:

✔ Applications run as processes  
✔ Failures must be diagnosed live  
✔ Services must be restarted safely in production  

---

## 🧩 **1. What is a Process in Linux?**

A **process** is a running instance of a program.

Examples:
- SSH service → multiple processes
- Web server → parent + worker processes
- CI/CD agent → background process

Each process has:
- **PID** → Process ID
- **USER** → Owner
- **CPU / Memory usage**
- **State** (Running, Sleeping, Stopped)

---

## 🔍 **2. Viewing Running Processes with `ps`**

### Command used:

```bash
ps aux
````

### Explanation:

| Option | Meaning                      |
| ------ | ---------------------------- |
| `a`    | Show processes for all users |
| `u`    | User-oriented output         |
| `x`    | Include background processes |

---

### Filter a specific process (SSH):

```bash
ps aux | grep ssh
```

### Real AWS Ubuntu Output (Observed):

```
root     689  0.0  1.1  sshd: ubuntu [priv]
ubuntu  1006 0.0  0.7  sshd: ubuntu@pts/0
root    1156 0.0  0.8  sshd: /usr/sbin/sshd -D
```

📌 This confirms:

* SSH daemon is running
* Active SSH user session exists

---

## 📊 **3. Real-time Process Monitoring with `top`**

### Command:

```bash
top
```

* Shows **live CPU, memory, and process usage**
* Updates every few seconds

👉 Press **`q`** to quit

📌 Widely used during **production incidents**

---

## 🚀 **4. Enhanced Monitoring with `htop` (Optional)**

```bash
htop
```


✔ Colorful UI

✔ Scrollable list

✔ Kill processes using keyboard

📌 Install if missing:

```bash
sudo apt install htop
```

---

## 🧪 **5. Creating a Background Process**

### Start a temporary process:

```bash
sleep 600 &
```

Explanation:

* `sleep 600` → process runs for 600 seconds
* `&` → runs in background

---

### Verify the running process:

```bash
ps aux | grep sleep
```

Example Output:

```
ubuntu  1234  0.0  0.0  sleep 600
```

---

## ❌ **6. Killing a Process Safely**

### Kill by process name:

```bash
pkill -f sleep
```

* `-f` → match full command
* Stops all matching sleep processes

---

### Cross-check process is terminated:

```bash
ps aux | grep sleep
```

✔ No output → process successfully killed

📌 **Critical DevOps skill:** stopping stuck or rogue processes.

---

## ⚙️ **7. Understanding Linux Services (systemd)**

Modern Linux uses **systemd** to manage services.

A **service**:

* Starts at boot
* Runs continuously
* Manages system functionality (SSH, Docker, Jenkins, etc.)

---

## 🔐 **8. Managing SSH Service with `systemctl`**

### Check SSH service status (Ubuntu):

```bash
systemctl status ssh
```

📌 **Important Note:**

* Ubuntu service name → `ssh`
* RedHat/CentOS service name → `sshd`

---

### Restart SSH service (Ubuntu):

```bash
sudo systemctl restart ssh
```

✔ Used after config changes
✔ Safe restart without reboot

---

### (Reference Only) RedHat / CentOS:

```bash
sudo systemctl restart sshd
```

---

## 🧪 **9. FULL TERMINAL SESSION (Real AWS Practice)**

```
ps aux
ps aux | grep ssh
top
htop
sleep 600 &
ps aux | grep sleep
pkill -f sleep
ps aux | grep sleep
systemctl status ssh
sudo systemctl restart ssh
```

---

## 🎯 **10. Why This Matters for DevOps / SRE**

✔ Debug high CPU or memory usage
✔ Identify hung or zombie processes
✔ Restart failed services safely
✔ Maintain uptime in production

🚨 **Most outages are fixed using these commands**

---

## 🧠 **Quick Summary**

| Command                 | Purpose                         |
| ----------------------- | ------------------------------- |
| `ps aux`                | List all running processes      |
| `grep`                  | Filter specific processes       |
| `top`                   | Live process monitoring         |
| `htop`                  | Advanced interactive monitoring |
| `sleep &`               | Create background process       |
| `pkill -f`              | Kill process by name            |
| `systemctl status ssh`  | Check SSH service status        |
| `systemctl restart ssh` | Restart SSH service             |

---

## 📌 Screenshot – Commands Output

```
screenshots/Day-04_AWS_Ubuntu_Processes_Services.png
```

![Day-04\_AWS\_Ubuntu\_Processes\_Services](https://github.com/ThinkerOnlineHub/linux-basics/blob/main/screenshots/Day-04_AWS_Ubuntu_Processes_Services.png)

---

## 💬 Commit Message

```
Add day-04.md — Linux Processes & Services (AWS Ubuntu)
```

---

## 🔗 Links

🎥 **YouTube:** @ThinkerTechSutraMarathi
💻 **GitHub Repo:** ThinkerOnlineHub/linux-basics
📰 **Blog:** [thinkertechsutramarathi](https://thinkertechsutramarathi.wordpress.com/)

---

# ✅ **End of Day-04**

You now understand:
✔ Linux processes
✔ Background execution
✔ Process termination
✔ Service management using systemd

🚀 Ready for **real-world DevOps troubleshooting**

---
