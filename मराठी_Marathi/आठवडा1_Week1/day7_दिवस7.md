# ✅ **DAY-07: Linux Package Management & Backups (Production Basics)**

> **Environment:** AWS EC2 Ubuntu (Noble)
> **Role Context:** Aspiring Platform Operations / DevOps Engineer
> **Duration:** ~60 minutes (Hands-on)

---

## 🎯 Goal

**Linux Package Management**, **Backup Creation**, आणि **Basic Cron Automation** समजून घेणे आणि त्याचा सराव करणे. खऱ्या **Production Environments** मध्ये या अत्यंत महत्त्वाच्या जबाबदाऱ्या आहेत.

आजच्या सत्रात खालील गोष्टींवर लक्ष केंद्रित केले आहे:

* System Packages सुरक्षितपणे Update करणे.
* Monitoring Tools Install करणे.
* `tar` वापरून Compressed Backups तयार करणे.
* `cron` वापरून Recurring Jobs शेड्युल करणे.

---

## 🧩 1. Why Package Management & Backups Matter in Production

खऱ्या जगातील DevOps मध्ये:

* **Unpatched Systems** = Security Risk (सुरक्षेचा धोका)
* **No Backups** = Business Outage (व्यवसाय ठप्प होणे)
* **Manual Operations** = Human Error (मानवी चूक)

प्रत्येक Production System मध्ये खालील गोष्टी असणे अनिवार्य आहे:
✔ सिस्टिम नेहमी Updated असणे.
✔ Predictable Backups (नियमित बॅकअप) असणे.
✔ Scheduled Health Checks रन होणे.

---

## 🔍 2. System Package Update (APT – Ubuntu)

काहीही Install करण्यापूर्वी, मी Ubuntu Repositories मधून लेटेस्ट Metadata मिळवण्यासाठी Package Index अपडेट केला.

### 🔧 Command Executed

```bash
sudo apt update

```

### 🧠 What Happened

* खालील ठिकाणांहून Metadata मिळवला:
* Ubuntu main
* Security updates
* Backports


* Package Dependency Graph तपासला.
* **70 Upgradable Packages** ओळखले.

📌 **Production Insight:**
Dependency Mismatches टाळण्यासाठी नेहमी Install किंवा Upgrade करण्यापूर्वी `apt update` रन करा.

📸 Screenshot:

![apt update](https://github.com/ThinkerOnlineHub/linux-basics/blob/2c29f3b6e8bacab40d8aa3c8a5048b026187939d/screenshots/Day-7_Package_management_%26_backups_sudo-apt-update.png)

---

## 🔍 3. Installing a Monitoring Tool (htop)

SREs द्वारे `htop` चा वापर प्रामुख्याने खालील गोष्टींसाठी केला जातो:

* CPU आणि Memory Usage तपासणे.
* High Load Issues डिबग करणे.
* Runaway Processes सुरक्षितपणे Kill करणे.

### 🔧 Command Executed

```bash
sudo apt install -y htop

```

### 🧠 Output Observation

* पॅकेज आधीच Install होते.
* Version: `3.3.0-4build1`
* सिस्टिमने निरोगी (Healthy) पॅकेज स्थितीची खात्री केली.

📌 **Production Insight:**
नवीन टूल्स Install करण्याइतकेच **काय आधीच Install आहे** हे जाणून घेणे महत्त्वाचे आहे.

📸 Screenshot:

![htop install](https://github.com/ThinkerOnlineHub/linux-basics/blob/2c29f3b6e8bacab40d8aa3c8a5048b026187939d/screenshots/Day-7_Package_management_%26_backups_sudo-apt-install-y-htop.png)

---

## 🧩 4. Creating a Backup Using tar (Real Practice)

मी माझ्या **ops-practice directory** मध्ये गेलो आणि एक Compressed Backup Archive तयार केला.

### 🔧 Command Executed

```bash
tar -czvf backup-$(date +%F).tar.gz /home/ubuntu/ops-practice/

```

### 🧠 Breakdown

* `c` → Create Archive
* `z` → Gzip Compression
* `v` → Verbose Output (प्रक्रिया स्क्रीनवर दाखवणे)
* `f` → Filename

📌 **Production Insight:**
Production मध्ये Backups नेहमी **Atomic** असावेत किंवा **Low Activity** (कमी कामाच्या) वेळेत शेड्युल केलेले असावेत.

📸 Screenshot:

![tar backup](https://github.com/ThinkerOnlineHub/linux-basics/blob/2c29f3b6e8bacab40d8aa3c8a5048b026187939d/screenshots/Day-7_Package_management_%26_backups_tar_zip.png)

---

## 🔍 5. Verifying Backup Integrity (बॅकअपची खात्री करणे)

### 🔧 Commands Executed

```bash
ls
tar -tzf backup-2026-02-03.tar.gz

```

### 🧠 Observation

* Archive मधील फाईल्सची यादी व्यवस्थित दिसली.
* Extract न करता बॅकअपची खात्री (Verify) केली.

❌ `cat backup.tar.gz` चा प्रयत्न केला → Binary Output मिळाले (अपेक्षित चूक).

📌 **Lesson Learned:**
Compressed Archives नेहमी `tar` वापरून तपासावेत, `cat` वापरून नाही.

---

## 🧩 6. Automating Tasks with cron (Health Check)

मी **Daily System Health Check Script** शेड्युल करण्यासाठी User Crontab एडिट केले.

### 🔧 Command Executed

```bash
crontab -e

```

### 🕒 Cron Job Added

```cron
0 2 * * * /home/ubuntu/bin/health-check.sh

```

### 🧠 What This Does

* **दररोज पहाटे २ वाजता** रन होईल.
* Health Status माहिती `/home/ubuntu/health.log` मध्ये जोडेल (Append).
* एका Custom Shell Script चा वापर करते.

📌 **Production Insight:**
Cron चा वापर आजही खालील गोष्टींसाठी मोठ्या प्रमाणावर होतो:

* Backups
* Log Rotation
* Health Monitoring

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

📌 **Production Insight:**
नेहमी Cron Outputs चे Logs ठेवा — Silent Failures (नकळत होणारे बिघाड) धोकादायक असतात.

---

## 📊 Quick Summary Table

| Area | Tool / Command | Real-World Usage |
| --- | --- | --- |
| Package Update | `apt update` | Security & Stability |
| Monitoring | `htop` | CPU/Memory Analysis |
| Backup | `tar -czvf` | Disaster Recovery |
| Automation | `cron` | Scheduled Operations |

---

## 🖼 Screenshots

📸 **Terminal Screenshots:** यामध्ये AWS EC2 Ubuntu instance वरील प्रत्यक्ष कामाचे पुरावे (apt update, htop install, tar backup, cron config) जोडले आहेत.


![History Package_management_&_backups](https://github.com/ThinkerOnlineHub/linux-basics/blob/2c29f3b6e8bacab40d8aa3c8a5048b026187939d/screenshots/Day-7_History_Package_management_%26_backups.png)
---

## 🧠 You Now Understand

✔ Linux Package Managers कसे काम करतात.
✔ Install करण्यापूर्वी Updates का महत्त्वाचे आहेत.
✔ Backups कसे तयार करायचे आणि तपासायचे.
✔ Cron द्वारे Production Tasks कसे Automate करायचे.
✔ सामान्य चुका (उदा. Binary file वाचण्याचा प्रयत्न).

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
