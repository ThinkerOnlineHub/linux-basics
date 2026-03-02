# ✅ **Day-6: Linux Text Tools & System Logs**

## 📌 Goal

महत्वाची Linux Text Tools — `tail`, `less`, `head`, `grep`, `awk`, `sed` — समजून घेणे आणि त्यांचा सराव करणे. तसेच DevOps / Platform Operations इंजिनिअरप्रमाणे `/var/log` मधील खऱ्या System Logs ची तपासणी कशी करायची हे शिकणे.

---

## 🧩 1. Why Logs Matter in Linux

खऱ्या जगातील DevOps आणि Platform Operations च्या कामात, **जेव्हा एखादी गोष्ट बिघडते (Breaks), तेव्हा Logs ही पहिली जागा असते जिथे तुम्ही तपासणी करता.**

मग ते काहीही असो:

* Application Crash होणे
* एखादी Service Fail होणे
* SSH Login संदर्भात समस्या
* High CPU किंवा Memory Usage
* किंवा सिस्टिमचे अनपेक्षित वर्तन

👉 **Logs नेहमी खरी परिस्थिती (Story) सांगतात.**

Linux शक्तिशाली Text-processing tools प्रदान करते ज्यामुळे इंजिनिअर्सना खालील गोष्टी करता येतात:

* खूप मोठ्या Log files सुरक्षितपणे वाचणे
* Errors झटपट Filter करणे
* फक्त आवश्यक Fields शोधून काढणे (Extract)
* सिस्टिम बंद न करता (Without downtime) Live Debugging करणे

Production systems वर On-call इंजिनिअर्स नेमके याच पद्धतीने काम करतात.

---

## 🔍 2. Viewing Recent Logs with `tail`

### वापरलेली Command

```bash
sudo tail -n 50 /var/log/syslog

```

### स्पष्टीकरण (Explanation)

* System Log मधील **शेवटच्या ५० ओळी** दाखवते.
* अलीकडील Errors, Warnings आणि Service Events पटकन पाहण्यासाठी याचा वापर होतो.

### हे का महत्त्वाचे आहे (Why This Matters)

जेव्हा एखादी घटना (Incident) घडते, तेव्हा अलीकडील Logs सर्वात संबंधित असतात. **Incident Triage** (समस्येचे गांभीर्य ठरवणे) दरम्यान ही कमांड मोठ्या प्रमाणावर वापरली जाते.

---

## 📖 3. Reading Large Logs Safely with `less`

### वापरलेली Command

```bash
less /var/log/syslog

```

### स्पष्टीकरण (Explanation)

* Logs एका **Scrollable आणि Memory-efficient Viewer** मध्ये उघडते.
* मोठ्या फाईल्ससाठी `cat` ऐवजी `less` वापरणे अधिक श्रेयस्कर असते.

### उपयुक्त Keys (Useful Keys)

* `/error` → विशिष्ट Keyword शोधण्यासाठी (Search)
* `n` → पुढील मॅच (Next match) पाहण्यासाठी
* `q` → बाहेर पडण्यासाठी (Quit)

### हे का महत्त्वाचे आहे (Why This Matters)

Production Logs हे **कित्येक MB किंवा त्याहून मोठे** असू शकतात. Debugging करताना सिस्टिमवर लोड (Overload) येऊ नये म्हणून `less` मदत करते.

---

## 🔄 4. Monitoring Logs in Real Time with `tail -f`

### वापरलेली Command

```bash
tail -f /var/log/syslog

```

### स्पष्टीकरण (Explanation)

* Log entries **Live** प्रवाहित (Stream) करते.
* जशा घटना घडतात, तसे Logs लगेच स्क्रीनवर दिसतात.

### हे का महत्त्वाचे आहे (Why This Matters)

खालील गोष्टींसाठी हे अत्यंत आवश्यक आहे:

* Service Restarts तपासणे
* SSH Login ट्रॅक करणे
* Cron job मॉनिटरिंग
* Outages दरम्यान Live Troubleshooting करणे

---

## 🔎 5. Searching Errors Using `grep`

### वापरलेली Command

```bash
grep -i error /var/log/syslog

```

### स्पष्टीकरण (Explanation)

* फक्त 'error' शब्द असलेल्या ओळी Filter करते.
* `-i` मुळे Search 'Case-insensitive' होतो (लहान किंवा मोठ्या लिपीतील फरक मानला जात नाही).

### हे का महत्त्वाचे आहे (Why This Matters)

हजारो ओळी वाचण्याऐवजी, तुम्ही थेट **Failure Signals** वर लक्ष केंद्रित करू शकता.

---

## 🧠 6. Extracting Process Data with `awk`

### वापरलेली Command

```bash
ps aux | awk '{print $1,$2,$11}' | head

```

### स्पष्टीकरण (Explanation)

यातील विशिष्ट माहिती बाहेर काढते (Extracts):

* User
* Process ID (PID)
* Command Name

### हे का महत्त्वाचे आहे (Why This Matters)

खालील गोष्टी ओळखण्यासाठी मदत होते:

* जास्त Resources खाणाऱ्या Processes
* संशयास्पद (Suspicious) Services
* कोणती Process कोणत्या युजरची आहे

हे **Performance Debugging आणि Security Audits** साठी अत्यंत मूलभूत आहे.

---

## 🚀 Why This Matters for DevOps / SRE

खऱ्या Production Environments मध्ये:

* Logs हे अनेकदा **सत्य शोधण्याचे एकमेव साधन (Source of truth)** असतात.
* SSH + Log inspection = **पहिली प्रतिक्रिया (First response)**.
* Dashboards नेहमीच सर्वकाही दाखवू शकत नाहीत.

या टूल्सचा रोजच्या कामात खालील गोष्टींसाठी वापर होतो:

* Incident Response
* Root Cause Analysis (RCA)
* Service Failure ची चौकशी
* Performance Troubleshooting
* Security Monitoring

जर तुम्ही आत्मविश्वासाने Logs वाचू शकत नसाल, तर तुम्ही Production Systems सुरक्षितपणे हाताळू शकत नाही.

---

## 📊 Quick Summary

| Tool | Purpose (उद्देश) |
| --- | --- |
| `tail` | अलीकडील Log entries पाहणे |
| `less` | मोठ्या फाईल्स सुरक्षितपणे वाचणे |
| `grep` | Errors किंवा Keywords शोधणे |
| `awk` | Structured fields बाहेर काढणे |
| `ps aux` | चालू असलेल्या Processes तपासणे |
| `/var/log` | मुख्य System log directory |

---

## 🖼️ Screenshots

📸 AWS EC2 Ubuntu instance वर खऱ्या अंमलबजावणीचे (Real execution) Terminal screenshots जोडले आहेत.

---

## 📝 Commit Message

```
Day-6: Practiced Linux text tools and system log analysis using tail, less, grep, awk on EC2

```

---

## ✅ End of Day-6

### आता तुम्हाला खालील गोष्टी समजल्या आहेत:

* Linux system logs सुरक्षितपणे कसे तपासायचे.
* Logs रिअल टाइममध्ये (Real time) कसे मॉनिटर करायचे.
* Errors झटपट फिल्टर कसे करायचे.
* DevOps इंजिनिअर्स Production Systems कशा Debug करतात.
* SRE आणि Platform Ops भूमिकांसाठी Text tools का मूलभूत आहेत.

---

🔗 **Links**
🎥 **YouTube:** @ThinkerTechSutraMarathi
💻 **GitHub Repo:** ThinkerOnlineHub/linux-basics
📰 **Blog:** [ThinkerTechSutraMarathi](https://thinkertechsutramarathi.wordpress.com/)

---
