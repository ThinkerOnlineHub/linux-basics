# ✅ **DAY-04: Linux Processes & Services (AWS Ubuntu)**

> **Goal:** `ps`, `top`, `htop`, `kill / pkill`, आणि `systemctl` वापरून Linux Processes आणि System Services मॉनिटर, मॅनेज आणि कंट्रोल करायला शिकणे.

हे **DevOps, SRE, आणि Platform Engineers** साठी एक **Core Skill** आहे, कारण:

✔ सर्व Applications हे Processes म्हणून रन होतात.

✔ त्रुटींचे (Failures) निदान Live करावे लागते.

✔ Production मध्ये Services सुरक्षितपणे Restart कराव्या लागतात.

---

## 🧩 **1. What is a Process in Linux?**

**Process** म्हणजे एखाद्या प्रोग्रामचे चालू असलेले अस्तित्व (Running instance).

उदाहरण:

* SSH service → एकापेक्षा जास्त Processes
* Web server → Parent + Worker processes
* CI/CD agent → Background process

प्रत्येक Process कडे खालील गोष्टी असतात:

* **PID** → Process ID (युनिक ओळख)
* **USER** → मालक (Owner)
* **CPU / Memory usage** → संसाधनांचा वापर
* **State** (Running, Sleeping, Stopped)

---

## 🔍 **2. Viewing Running Processes with `ps**`

### वापरलेली Command:

```bash
ps aux

```

### स्पष्टीकरण (Explanation):

| Option | Meaning |
| --- | --- |
| `a` | सर्व युजर्सच्या Processes दाखवा |
| `u` | User-oriented माहिती (Memory/CPU सह) |
| `x` | Background processes समाविष्ट करा |

---

### विशिष्ट Process फिल्टर करण्यासाठी (उदा. SSH):

```bash
ps aux | grep ssh

```

### Real AWS Ubuntu Output (निरीक्षण):

```
root      689  0.0  1.1  sshd: ubuntu [priv]
ubuntu   1006  0.0  0.7  sshd: ubuntu@pts/0
root     1156  0.0  0.8  sshd: /usr/sbin/sshd -D

```

📌 यावरून हे सिद्ध होते की:

* SSH Daemon रन होत आहे.
* Active SSH User Session अस्तित्वात आहे.

---

## 📊 **3. Real-time Process Monitoring with `top**`

### Command:

```bash
top

```

* **Live CPU, Memory आणि Process usage** दाखवते.
* दर काही सेकंदांनी माहिती Update होते.

👉 बाहेर पडण्यासाठी **`q`** दाबा.

📌 **Production Incidents** दरम्यान याचा मोठ्या प्रमाणावर वापर केला जातो.

---

## 🚀 **4. Enhanced Monitoring with `htop` (Optional)**

```bash
htop

```

✔ Colorful UI

✔ Scrollable list

✔ Keyboard वापरून Processes Kill करता येतात.

📌 जर सिस्टिममध्ये नसेल तर Install करा:

```bash
sudo apt install htop

```

---

## 🧪 **5. Creating a Background Process**

### एक तात्पुरती Process सुरू करा:

```bash
sleep 600 &

```

स्पष्टीकरण:

* `sleep 600` → ६०० सेकंदांसाठी Process रन होईल.
* `&` → ही Process **Background** मध्ये रन करेल.

---

### चालू असलेली Process तपासा:

```bash
ps aux | grep sleep

```

Example Output:
`ubuntu  1234  0.0  0.0  sleep 600`

---

## ❌ **6. Killing a Process Safely**

### Process च्या नावाने Kill करा:

```bash
pkill -f sleep

```

* `-f` → पूर्ण Command मॅच करते.
* 'sleep' नावाच्या सर्व चालू Processes थांबवते.

---

### Process बंद झाली आहे का हे तपासा:

```bash
ps aux | grep sleep

```

✔ Output न येणे म्हणजे Process यशस्वीपणे Kill झाली आहे.

📌 **Critical DevOps skill:** अडकलेल्या (Stuck) किंवा अनावश्यक (Rogue) Processes थांबवणे.

---

## ⚙️ **7. Understanding Linux Services (systemd)**

आधुनिक Linux मध्ये Services मॅनेज करण्यासाठी **systemd** चा वापर होतो.

**Service** म्हणजे:

* सिस्टिम Boot होताना आपोआप सुरू होते.
* सतत (Continuously) बॅकग्राउंडमध्ये रन होते.
* सिस्टिमची कार्यक्षमता (SSH, Docker, Jenkins, इ.) सांभाळते.

---

## 🔐 **8. Managing SSH Service with `systemctl**`

### SSH Service चे Status तपासा (Ubuntu):

```bash
systemctl status ssh

```

📌 **महत्त्वाची नोंद:**

* Ubuntu मध्ये Service चे नाव → `ssh`
* RedHat/CentOS मध्ये Service चे नाव → `sshd`

---

### SSH Service Restart करा (Ubuntu):

```bash
sudo systemctl restart ssh

```

✔ Configuration मध्ये बदल केल्यावर वापरले जाते.

✔ सिस्टिम Reboot न करता सुरक्षितपणे Restart करता येते.

---

## 🧪 **9. FULL TERMINAL SESSION (Real AWS Practice)**

```bash
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

✔ High CPU किंवा Memory Usage शोधण्यासाठी.

✔ अडकलेल्या (Hung) किंवा Zombie Processes ओळखण्यासाठी.

✔ नादुरुस्त Services सुरक्षितपणे Restart करण्यासाठी.

✔ Production मध्ये जास्तीत जास्त Uptime टिकवण्यासाठी.

🚨 **बहुतेक Outages या Commands वापरूनच फिक्स केले जातात.**

---

## 🧠 **Quick Summary**

| Command | Purpose (उद्देश) |
| --- | --- |
| `ps aux` | सर्व चालू Processes ची यादी पाहणे |
| `grep` | विशिष्ट Processes फिल्टर करणे |
| `top` | Live process मॉनिटरिंग |
| `htop` | Advanced interactive मॉनिटरिंग |
| `sleep &` | Background process तयार करणे |
| `pkill -f` | नावाने Process Kill करणे |
| `systemctl status ssh` | SSH service चे स्टेटस तपासणे |
| `systemctl restart ssh` | SSH service रिस्टार्ट करणे |

## 📌 Screenshot – Commands Output

```
screenshots/Day-04_AWS_Ubuntu_Processes_Services.png
```

![Day-04\_AWS\_Ubuntu\_Processes\_Services](https://github.com/ThinkerOnlineHub/linux-basics/blob/59169eed6c5265e13e73f633e70408efa36d3d94/screenshots/Day-04_AWS_Ubuntu_Processes_Services.png)

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

आता तुम्हाला खालील गोष्टी समजल्या आहेत:
✔ Linux Processes

✔ Background Execution

✔ Process Termination (बंद करणे)

✔ systemd वापरून Service Management

🚀 **Real-world DevOps Troubleshooting** साठी तुम्ही तयार आहात!

---
