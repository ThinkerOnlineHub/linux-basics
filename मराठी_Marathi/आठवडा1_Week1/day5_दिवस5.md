# ✅ **DAY-05: Linux Networking Basics (AWS Ubuntu)**

> **Goal:** खऱ्या AWS EC2 Ubuntu प्रॅक्टिसचा वापर करून Linux Networking मधील मूलभूत गोष्टी (Fundamentals) समजून घेणे.
> Connectivity, DNS resolution, Ports, आणि Routing यावर लक्ष केंद्रित करणे — जे **DevOps, SRE, आणि Platform Operations** साठी अत्यंत आवश्यक कौशल्ये आहेत.

---

# 🧩 **1. What is Networking in Linux?**

Linux मधील Networking म्हणजे **सिस्टिम्स एकमेकांशी कशा संवाद साधतात** — मग ते स्थानिक (Locally) असो किंवा इंटरनेटवर.

Production मध्ये:

* Applications हे **Ports** द्वारे संवाद साधतात.
* Services या **DNS** वर अवलंबून असतात.
* सिस्टिम मधील बिघाड (Failures) अनेकदा कोडमुळे नसून **Network Misconfiguration** मुळे होतात.

📌 एखादे चालू असलेले Application निरुपयोगी आहे जर ते **Network वर उपलब्ध (Reachable)** नसेल.

---

# 🔍 **2. Testing Basic Connectivity with `ping**`

### वापरलेली Command:

```bash
ping -c 4 google.com

```

### स्पष्टीकरण (Explanation):

* `ping` हे Remote Host उपलब्ध आहे की नाही हे तपासते.
* `-c 4` फक्त ४ Packets पाठवते (Production साठी सुरक्षित).

### यातून काय स्पष्ट होते:

✔ EC2 कडे इंटरनेट एक्सेस आहे.
✔ DNS Resolution व्यवस्थित काम करत आहे.
✔ Network Latency (विलंब) किती आहे हे दिसते.

---

### विशिष्ट Domain ची कनेक्टिव्हिटी तपासणे:

```bash
ping -c 3 thinkertechsutramarathi.wordpress.com

```

✔ बाह्य वेबसाइटची उपलब्धता तपासते.
✔ DNS आणि Network Path ची खात्री करते.

---

# 📘 **3. Understanding Commands Using Manual Pages**

### वापरलेली Command:

```bash
man ping

```

### हे का महत्त्वाचे आहे:

* व्यावसायिक इंजिनिअर्स नेहमी **Manuals वाचतात**.
* Production मध्ये चुकीचे Flags वापरणे टाळता येते.
* कमांडबद्दल सखोल ज्ञान मिळते.

📌 `man` वापरणे ही एका **Senior Engineer** ची सवय आहे.

---

# 🌐 **4. Testing HTTP Connectivity with `curl**`

### वापरलेली Command:

```bash
curl -I https://github.com

```

### स्पष्टीकरण (Explanation):

* `-I` फक्त HTTP Headers मिळवते.
* API आणि Web Service ची उपलब्धता तपासण्यासाठी वापरले जाते.

### यातून काय स्पष्ट होते:

✔ HTTPS Outbound Access चालू आहे.
✔ Valid HTTP Response (200 OK) मिळत आहे.
✔ TLS Handshake यशस्वी झाला आहे.

---

### सार्वजनिक (Public) IP Address शोधणे:

```bash
curl https://api.ipify.org

```

✔ EC2 चा Public IP ओळखते.
✔ Firewall आणि Security Group च्या Debugging साठी उपयुक्त.

---

# 🔌 **5. Checking Listening Ports with `ss**`

### वापरलेली Command:

```bash
ss -tuln | head

```

### स्पष्टीकरण (Explanation):

| Option | Meaning |
| --- | --- |
| `-t` | TCP |
| `-u` | UDP |
| `-l` | Listening ports |
| `-n` | Numeric output |

### हे का महत्त्वाचे आहे:

✔ कोणत्या Services रन होत आहेत याची खात्री करते.
✔ SSH (Port 22) चालू आहे का ते तपासते.
✔ Outage Debugging दरम्यान वापरले जाते.

📌 `ss` हे **netstat चे आधुनिक रिप्लेसमेंट** आहे.

---

# 🧰 **6. Legacy Port Inspection using `netstat**`

सुरुवातीला `netstat` उपलब्ध नसेल तर ते इन्स्टॉल करावे लागते.

### Install करण्याची Command:

```bash
sudo apt install net-tools

```

### इन्स्टॉल केल्यानंतर वापरलेली Command:

```bash
netstat -tuln

```

### हे अजूनही का महत्त्वाचे आहे:

✔ जुन्या (Legacy) सिस्टिम्समध्ये हे सर्रास वापरले जाते.
✔ अनेक इंटरव्ह्यूमध्ये यावर प्रश्न विचारले जातात.

---

# 🌍 **7. DNS Resolution with `dig**`

### वापरलेली Command:

```bash
dig +short google.com

```

```bash
dig +short thinkertechsutramarathi.wordpress.com

```

### स्पष्टीकरण (Explanation):

* `dig` हे DNS Resolution तपासते.
* `+short` फक्त IP Address चे क्लीन आउटपुट दाखवते.

### यातून काय स्पष्ट होते:

✔ DNS Servers उपलब्ध आहेत.
✔ Domain चे अचूक IP मध्ये रूपांतर होत आहे.

📌 **जर DNS फेल झाले, तर Applications फेल होतात.**

---

# 🛣️ **8. Tracing Network Path using `traceroute**`

सुरुवातीला `traceroute` इन्स्टॉल नसेल तर:

### Install करण्याची Command:

```bash
sudo apt install traceroute

```

### वापरलेली Command:

```bash
traceroute google.com

```

### स्पष्टीकरण (Explanation):

* हे Network चा टप्प्याटप्प्याने (Hop-by-hop) प्रवास दाखवते.
* Routing मध्ये कुठे विलंब होत आहे किंवा Packets ड्रॉप होत आहेत हे ओळखण्यास मदत करते.

⚠️ काही वेळा `* * *` दिसते, याचा अर्थ Firewall मुळे ICMP ब्लॉक केला जात आहे.

---

# 🎯 **9. Why This Matters for DevOps / SRE / Platform Ops**

✔ बहुतेक Production Outages चे कारण Network इश्यूज असतात.
✔ Debugging ची सुरुवात कनेक्टिव्हिटीपासून होते, कोडपासून नाही.
✔ DNS, Ports आणि Routing ची पडताळणी करणे अनिवार्य आहे.
✔ ही टूल्स **दैनंदिन कामात आणि खऱ्या इन्सिडेंट्समध्ये** वापरली जातात.

---

# 🧠 **Quick Summary**

| Command | Purpose (उद्देश) |
| --- | --- |
| `ping` | Connectivity तपासणे |
| `curl` | HTTP / APIs तपासणे |
| `ss` | Listening Ports तपासणे |
| `netstat` | जुन्या पद्धतीने Ports पाहणे |
| `dig` | DNS Resolution तपासणे |
| `traceroute` | Network Path विश्लेषण |
| `man` | कमांडचे डॉक्युमेंटेशन वाचणे |

---

# 📌 Screenshot – Commands Output

```
screenshots/Day-05_AWS_Ubuntu_Networking_Basics.png
```
![Day-5_Networking_basics_ping](https://github.com/ThinkerOnlineHub/linux-basics/blob/fc6224c55d8295cc2ce2fb9f4605e38e1197ca65/screenshots/Day-5_Networking_basics_ping.png)

![Day-5_Networking_basics_curl_ss_install_netstat](https://github.com/ThinkerOnlineHub/linux-basics/blob/bee66936a00345055b678938da0faaf7d2957df7/screenshots/Day-5_Networking_basics_curl_ss_install_netstat_cmd.png)

![Day-5_Networking_basics_netstat_ss_-tuln_dig+short_traceroute_sudo_apt_install](https://github.com/ThinkerOnlineHub/linux-basics/blob/bee66936a00345055b678938da0faaf7d2957df7/screenshots/Day-5_Networking_basics_netstat_ss_-tuln_dig%2Bshort_traceroute_sudo_apt_install_cmd.png)

![Day-5_Networking_basics_sudo_apt_install_traceroute](https://github.com/ThinkerOnlineHub/linux-basics/blob/bee66936a00345055b678938da0faaf7d2957df7/screenshots/Day-5_Networking_basics_sudo_apt_install_traceroute_cmd.png)

![Day-5_Networking_basics_traceroute](https://github.com/ThinkerOnlineHub/linux-basics/blob/bee66936a00345055b678938da0faaf7d2957df7/screenshots/Day-5_Networking_basics_traceroute_cmd.png)

![Day-5_Networking_basics_ping_curl_ss_netstat_dig_traceroute](https://github.com/ThinkerOnlineHub/linux-basics/blob/bee66936a00345055b678938da0faaf7d2957df7/screenshots/Day-5_Networking_basics_ping_curl_ss_netstat_dig_traceroute_cmd.png)

*(Attached screenshots show real AWS EC2 practice)*

---

## 💬 Commit Message

```
Add day-05.md — Linux Networking Basics (AWS Ubuntu)

```

---

## 🔗 Links

🎥 **YouTube:** @ThinkerTechSutraMarathi

💻 **GitHub Repo:** ThinkerOnlineHub/linux-basics

📰 **Blog:** [ThinkerTechSutraMarathi](https://thinkertechsutramarathi.wordpress.com/)

---

# ✅ **End of Day-05**

आता तुम्हाला खालील गोष्टी स्पष्ट समजल्या आहेत:
✔ Linux Networking Fundamentals

✔ Connectivity आणि DNS Troubleshooting

✔ Port आणि Service Inspection

✔ Network Path विश्लेषण

✔ प्रत्यक्ष AWS EC2 Networking प्रॅक्टिस

---
