# ✅ DAY-07: Linux Package Management & Backups (Production Basics)

> **Environment:** AWS EC2 Ubuntu (Noble)
> **Role Context:** Aspiring Platform Operations / DevOps Engineer
> **Duration:** ~60 minutes (Hands-on)

---

## 🎯 Goal

Understand and practice **Linux package management**, **backup creation**, and **basic cron automation**, which are **core responsibilities in real production environments**.

This day focused on:
- Updating system packages safely
- Installing monitoring tools
- Creating compressed backups using `tar`
- Scheduling recurring jobs using `cron`

---

## 🧩 1. Why Package Management & Backups Matter in Production

In real-world DevOps:

- **Unpatched systems** = security risk
- **No backups** = business outage
- **Manual operations** = human error

Every production system must:

✔ Stay updated

✔ Have predictable backups

✔ Run scheduled health checks

---

## 🔍 2. System Package Update (APT – Ubuntu)

Before installing anything, I updated the package index to fetch the latest metadata from Ubuntu repositories.

### 🔧 Command Executed

```bash
sudo apt update

```

### 🧠 What Happened

- Pulled metadata from:
    - Ubuntu main
    - Security updates
    - Backports
- Verified package dependency graph
- Identified **70 upgradable packages**

📌 **Production Insight:**

Always run `apt update` before installs or upgrades to avoid dependency mismatches.

📸 Screenshot:

![apt update](https://github.com/ThinkerOnlineHub/linux-basics/blob/2c29f3b6e8bacab40d8aa3c8a5048b026187939d/screenshots/Day-7_Package_management_%26_backups_sudo-apt-update.png)

---

## 🔍 3. Installing a Monitoring Tool (htop)

`htop` is commonly used by SREs to:

- Inspect CPU & memory usage
- Debug high load issues
- Kill runaway processes safely

### 🔧 Command Executed

```bash
sudo apt install -y htop

```

### 🧠 Output Observation

- Package already installed
- Version: `3.3.0-4build1`
- System confirmed healthy package state

📌 **Production Insight:**

Knowing **what is already installed** is as important as installing new tools.

📸 Screenshot:

![htop install](https://github.com/ThinkerOnlineHub/linux-basics/blob/2c29f3b6e8bacab40d8aa3c8a5048b026187939d/screenshots/Day-7_Package_management_%26_backups_sudo-apt-install-y-htop.png)

---

## 🧩 4. Creating a Backup Using tar (Real Practice)

I navigated into my **ops-practice directory** and created a compressed backup archive.

### 🔧 Command Executed

```bash
tar -czvf backup-$(date +%F).tar.gz /home/ubuntu/ops-practice/

```

### 🧠 Breakdown

- `c` → create archive
- `z` → gzip compression
- `v` → verbose output
- `f` → filename

📌 Output showed:

- Files archived correctly
- Warning about file change during read (expected in live systems)

📌 **Production Insight:**

Backups must be **atomic or scheduled during low activity** in production.

📸 Screenshot:

![tar backup](https://github.com/ThinkerOnlineHub/linux-basics/blob/2c29f3b6e8bacab40d8aa3c8a5048b026187939d/screenshots/Day-7_Package_management_%26_backups_tar_zip.png)

---

## 🔍 5. Verifying Backup Integrity

### 🔧 Commands Executed

```bash
ls
tar -tzf backup-2026-02-03.tar.gz

```

### 🧠 Observation

- Archive listed files correctly
- Verified backup without extraction

❌ Tried `cat backup.tar.gz` → binary output (expected mistake)

📌 **Lesson Learned:**

Compressed archives must be inspected using `tar`, not `cat`.

---

## 🧩 6. Automating Tasks with cron (Health Check)

I edited my user crontab to schedule a **daily system health check script**.

### 🔧 Command Executed

```bash
crontab -e

```

### 🕒 Cron Job Added

```
0 2 * * * /home/ubuntu/bin/health-check.sh

```

### 🧠 What This Does

- Runs **every day at 2 AM**
- Appends health status to `/home/ubuntu/health.log`
- Uses a custom shell script

📌 **Production Insight:**

Cron is still widely used for:

- Backups
- Log rotation
- Health monitoring

📸 Screenshot:

![cron edit](https://github.com/ThinkerOnlineHub/linux-basics/blob/2c29f3b6e8bacab40d8aa3c8a5048b026187939d/screenshots/Day-7_Package_management_%26_backups_edit_crontab.png)

![cron-tar-zip ](https://github.com/ThinkerOnlineHub/linux-basics/blob/2c29f3b6e8bacab40d8aa3c8a5048b026187939d/screenshots/Day-7_Package_management_%26_backups_cron_tar_zip.png)

---

## 🔍 7. Health Check Script Validation

### 🔧 Script Content

```bash
#!/bin/bash
echo "Health check running at $(date)" >> /home/ubuntu/health.log

```

### 🧠 Verified By

```bash
cat /home/ubuntu/bin/health-check.sh
cat /home/ubuntu/health.log

```

📌 **Production Insight:**

Always log cron outputs — silent failures are dangerous.

---

## 📊 Quick Summary Table

| Area | Tool / Command | Real-World Usage |
| --- | --- | --- |
| Package Update | `apt update` | Security & stability |
| Monitoring | `htop` | CPU/memory analysis |
| Backup | `tar -czvf` | Disaster recovery |
| Automation | `cron` | Scheduled operations |

---

## 🖼 Screenshot Placeholders

- apt update output
- htop install
- tar backup execution
- cron configuration
- command history

---
![History Package_management_&_backups](https://github.com/ThinkerOnlineHub/linux-basics/blob/2c29f3b6e8bacab40d8aa3c8a5048b026187939d/screenshots/Day-7_History_Package_management_%26_backups.png)

## 🧠 You Now Understand

✔ How Linux package managers work

✔ Why updates matter before installs

✔ How to create & verify backups

✔ How cron automates production tasks

✔ Common mistakes (binary file reads)

---

## 🧾 Git Commit Message

```bash
git commit -m "Day-07: Practiced package management, backups, and cron automation on Ubuntu"

```
## 🔗 Links

🎥 **YouTube:** @ThinkerTechSutraMarathi

💻 **GitHub Repo:** ThinkerOnlineHub/linux-basics

📰 **Blog:** [ThinkerTechSutraMarathi](https://thinkertechsutramarathi.wordpress.com/)
---
