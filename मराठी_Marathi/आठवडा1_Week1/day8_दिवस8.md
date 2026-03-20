# ✅ **DAY-08: Shell Scripting Basics — Health Check Automation**

> **Environment:** AWS EC2 Ubuntu
> **Focus:** Bash Scripting Fundamentals
> **Duration:** ~75 minutes
> **Role Context:** DevOps / Platform Operations Practice

---

## 🎯 Goal

खालील गोष्टींचा वापर करून एक सोपे पण Production-relevant **Bash Script** लिहिणे आणि त्याचा सराव करणे:

* Variables
* Command Substitution
* Conditions (`if`)
* File Checks
* Basic Log Rotation
* Execution Permissions

याचा उद्देश एका **Real-world System Health Reporter** चे सिम्युलेशन करणे हा होता, जो CPU, Memory आणि Disk Usage चे Logs तयार करतो.

---

## 📁 Step 1: Create Script File

मी माझ्या `bash-scripts` Directory मध्ये काम केले.

```bash
cd bash-scripts
touch health-check.sh
ls

```

फाईल यशस्वीरित्या तयार झाल्याची खात्री (Verify) केली.

---

## 📝 Step 2: Script Implementation

मी `Vim` Editor वापरून फाईल एडिट केली:

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

`#!/usr/bin/env bash`

हे सुनिश्चित करते की स्क्रिप्ट योग्य **Bash Interpreter** वापरून रन होईल.

---

### 2️⃣ Variables

`LOGFILE="$HOME/ops-practice/health.log"`

`DATE=$(date '+%F %T')`

* `$HOME` वापरल्यामुळे स्क्रिप्ट Portability जपते (वेगवेगळ्या युजर्ससाठी चालते).
* `$(date ...)` मध्ये **Command Substitution** चा वापर केला आहे.

---

### 3️⃣ CPU Usage

`top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}'`

* `b`: Batch Mode.
* `n1`: Single Iteration (एकदाच माहिती घेणे).
* `awk`: User + System CPU ची बेरीज करते.

---

### 4️⃣ Memory & Disk

`free -m` आणि `df -h /`

फक्त आवश्यक Fields काढण्यासाठी (Extract) `awk` चा वापर केला.

---

### 5️⃣ Log Rotation Condition

`if [ -f "$LOGFILE" ]; then`

फाईल अस्तित्वात आहे का ते तपासते.

`if [ "$SIZE" -gt 1000000 ];`

जर Log फाईल १ MB पेक्षा मोठी झाली, तर ती Timestamp देऊन **Rotate** (Move) केली जाते.

---

## 🔐 Step 3: Make Script Executable

सुरुवातीला Permissions देताना काही चुका झाल्या होत्या, त्या दुरुस्त केल्या:

```bash
chmod +x bash-scripts/health-check.sh

```

खालील कमांडने खात्री केली:

```bash
ls -la

```

**Executable Bit** यशस्वीरित्या लागू झाला.

---

## ▶ Step 4: Execute Script

स्क्रिप्ट रन केली:

```bash
./bash-scripts/health-check.sh

```

दोन्ही प्रकारे (Direct आणि `sh` वापरून) स्क्रिप्ट यशस्वीरित्या चालली.

---

## 📄 Step 5: Verify Log Output

Log फाईल तपासली:

```bash
tail -n 5 $HOME/ops-practice/health.log

```

Output मध्ये माहिती अशा प्रकारे दिसली:
`[2026-02-09 18:15:36] CPU: 3.4% MEM_free: 1542MB Disk_free: 18G`

यावरून खालील गोष्टी सिद्ध झाल्या:
✔ Script Execution यशस्वी झाले.
✔ Logs फाईलमध्ये जोडले (Append) गेले.
✔ Variables योग्यरित्या बदलले (Substitution).
✔ कोणतीही Syntax Error आली नाही.

---

## 🧪 Real Mistakes & Learning

Terminal History वरून असे लक्षात आले की:

* Path संदर्भात गोंधळ झाला होता.
* Permission Errors आल्या होत्या.
* `chmod` करण्यापूर्वीच फाईल रन करण्याचा प्रयत्न केला होता.

📌 **Production Lesson:**
नेहमी खात्री करा:

* Current Directory (`pwd`).
* फाईलचे अस्तित्व (`ls`).
* Execution Permissions (`ls -la`).
* Cron वापरताना नेहमी **Absolute Path** वापरावा.

---

## 📊 What This Simulates in Real DevOps

हे छोटे स्क्रिप्ट खालील गोष्टींचे प्रतिनिधित्व करते:

* Basic Monitoring Agent.
* Custom Health Checker.
* Log Rotation Logic.
* Cron-ready Automation Script.
* Incident Debugging Tool.

खऱ्या सिस्टिम्समध्ये अशाच प्रकारचे लॉजिक **Cron Jobs** किंवा **SRE Tooling** मध्ये वापरले जाते.

---

## 🧠 Key Concepts Learned

| Concept | Practical Application |
| --- | --- |
| Shebang | Interpreter Consistency |
| Variables | Dynamic Values |
| Command Substitution | Runtime Execution |
| Conditions | Decision Logic |
| File Checks | Safe Operations |
| Log Rotation | Disk Safety |
| chmod | Execution Control |

---

## 🚀 Why This Matters for DevOps Roles

इंटरव्ह्यूमध्ये हे तुम्हाला खालील प्रश्नांसाठी तयार करते:

* एखादे साधे Monitoring Script तुम्ही कसे लिहाल?
* Log Rotation कसे हाताळाल?
* Permission Issues कसे डिबग कराल?
* `sh script.sh` आणि `./script.sh` मधील फरक काय?
* Hardcoded Paths ऐवजी `$HOME` का वापरावे?

हे **DevOps, Platform Ops आणि SRE** भूमिकांसाठी पाया (Foundation) आहे.

---

## 🏁 Checkpoint

✔ Script तयार केले.
✔ Executable बनवले.
✔ यशस्वीरित्या रन केले.
✔ Log File अपडेट झाली.
✔ Log Rotation लॉजिक लागू झाले.
✔ GitHub वर Commit केले.

---

## 🧾 Git Commit Message

```bash
git commit -m "Day-08: Shell Scripting Basics — Health Check Automation"

```

## 🔗 Links

🎥 **YouTube:** @ThinkerTechSutraMarathi

💻 **GitHub Repo:** ThinkerOnlineHub/linux-basics

📰 **Blog:** [ThinkerTechSutraMarathi](https://thinkertechsutramarathi.wordpress.com/)

---
