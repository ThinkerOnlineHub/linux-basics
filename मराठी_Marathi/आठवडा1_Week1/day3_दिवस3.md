# ✅ **DAY-03: Linux Users, Groups & Sudo Access (AWS Ubuntu)**

> **Goal:** AWS EC2 Ubuntu instance चा वापर करून Linux Users, Groups आणि Sudo Access समजून घेणे.
> DevOps, SRE आणि Platform Engineering मध्ये हा **Critical Foundation** भाग आहे, कारण **Access Control = Security**.

---

# 🧩 **1. Understanding Users & Groups in Linux**

Linux ही एक **Multi-user Operating System** आहे.
प्रत्येक Command, File Access आणि Service एका विशिष्ट **User Identity** अंतर्गत रन होते.

प्रत्येक User कडे खालील गोष्टी असतात:

* **UID** → User ID
* **GID** → Primary Group ID
* **Secondary Groups** → अतिरिक्त Permissions (जादा अधिकार)

---

# 🔍 **2. Checking Groups on AWS Ubuntu**

### वापरलेली Command:

```bash
groups $(whoami)

```

### Real output (AWS Ubuntu):

```
ubuntu : ubuntu adm cdrom sudo dip lxd

```

### अर्थ (Meaning):

| Group | Purpose (उद्देश) |
| --- | --- |
| `ubuntu` | Primary user group |
| `adm` | System logs वाचण्यासाठी |
| `cdrom` | CD-ROM devices access करण्यासाठी |
| `sudo` | Administrative commands रन करण्यासाठी |
| `dip` | Network configuration साठी |
| `lxd` | LXD containers manage करण्यासाठी |

✅ **`sudo` group** ची उपस्थिती म्हणजे या User कडे आधीच Admin Access आहे.

---

# 🧾 **3. Checking Detailed User Identity**

```bash
id $(whoami)

```

### Real output:

```
uid=1000(ubuntu) gid=1000(ubuntu) groups=1000(ubuntu),4(adm),24(cdrom),27(sudo),30(dip),105(lxd)

```

### विश्लेषण (Breakdown):

* **UID:** `1000` → ubuntu user
* **Primary Group:** `ubuntu`
* **Secondary Groups:** sudo, adm, lxd इ.

📌 ही Command **Production Debugging** मध्ये वारंवार वापरली जाते.

---

# 🛡️ **4. Root Access vs Sudo (Best Practice)**

### Root shell मध्ये जाण्यासाठी:

```bash
sudo -i

```

Prompt असा बदलतो: `root@ip-172-31-17-4:~#`

### Root shell मधून बाहेर पडण्यासाठी:

```bash
exit

```

### DevOps मध्ये Root Login ऐवजी `sudo` का वापरतात:

✔ चांगली Security मिळते.
✔ Command Auditing (कोणती कमांड कोणी रन केली याचा मागोवा) सोपे जाते.
✔ सिस्टिमचे चुकून होणारे नुकसान टाळता येते.

⚠️ **AWS वर Direct Root Login डीफॉल्टनुसार (By default) बंद असते.**

---

# 👤 **5. Creating a New User on Ubuntu**

### User तयार करा:

```bash
sudo useradd testuser

```

✔ User तयार झाला (पण Password सेट करेपर्यंत Login करता येणार नाही).

### Password सेट करा:

```bash
sudo passwd testuser

```

✔ आता हा User सिस्टिममध्ये Login करू शकतो.

---

# 🔐 **6. Granting Sudo Access to a User**

```bash
sudo usermod -aG sudo testuser

```

### स्पष्टीकरण (Explanation):

| Option | Meaning |
| --- | --- |
| `usermod` | अस्तित्वात असलेला User मॉडिफाय करण्यासाठी |
| `-a` | Append (जुने Groups न काढता नवीन जोडणे) |
| `-G` | Group निर्दिष्ट करण्यासाठी (Specify) |
| `sudo` | Admin Privileges |
| `testuser` | Target User |

⚠️ **अत्यंत महत्त्वाचे:**
`-a` शिवाय कधीही `-G` वापरू नका → यामुळे त्या User चे **जुने सर्व Groups रिमूव्ह (Remove)** होऊ शकतात.

---

# 📖 **7. Reading Manual Pages (Professional Habit)**

```bash
man sudo usermod -aG
man sudo usermod -a
man sudo usermod -a | grep "G"

```

✔ खालील गोष्टींसाठी हे एक आवश्यक कौशल्य आहे:

* Commands सखोलपणे समजून घेणे.
* Production मधील चुका टाळणे.
* एक Self-reliant (स्वयंपूर्ण) Engineer बनणे.

---

# 🎯 **8. Why This Matters for DevOps / Platform Ops**

✔ प्रत्येक EC2 / VM मध्ये Linux Users चा वापर होतो.
✔ CI/CD Agents हे 'User' म्हणून रन होतात.
✔ चुकीच्या Permissions म्हणजे सुरक्षेचा मोठा धोका (Security Risk).
✔ Sudo Access Control मुळे सिस्टिम डाउन (Outages) होण्यापासून वाचवता येते.

---

# 🧠 **Quick Summary**

| Command | Purpose (उद्देश) |
| --- | --- |
| `groups` | User groups पाहण्यासाठी |
| `id` | UID, GID, groups पाहण्यासाठी |
| `sudo -i` | Root shell मिळवण्यासाठी |
| `useradd` | नवीन User तयार करण्यासाठी |
| `passwd` | Password सेट करण्यासाठी |
| `usermod -aG sudo` | Admin access देण्यासाठी |
| `man` | Documentation वाचण्यासाठी |

# 📌 Screenshot – Commands Output

```
screenshots/Day-03_AWS_Ubuntu_User_Groups_Sudo.png

```

![Day-03_AWS_Ubuntu_User_Groups_Sudo](https://github.com/ThinkerOnlineHub/linux-basics/blob/9b959e69091102a1bb8a0d4076b669cc4a9eb43f/screenshots/Day-03_AWS_Ubuntu_User_Groups_Sudo.png)

---

## 💬 Commit Message

```
Add day-03.md — Linux Users, Groups & Sudo Access (AWS Ubuntu)

```

🔗 **Links**
🎥 **YouTube:** @ThinkerTechSutraMarathi
💻 **GitHub Repo:** ThinkerOnlineHub/linux-basics
📰 **Blog:** [thinkertechsutramarathi](https://thinkertechsutramarathi.wordpress.com/)

---
