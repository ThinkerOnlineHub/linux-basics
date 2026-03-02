# ✅ **DAY-02: Linux File Types + Ownership + Permissions**

> **Goal:** Linux मध्ये Files, Ownership, Groups आणि Permission Control कसे काम करते हे समजून घेणे.
> DevOps, SRE, आणि Platform Engineering साठी हा सर्वात महत्त्वाचा पाया (Foundation) आहे.

---

# 🧩 **1. File Types in Linux**

जेव्हा आपण खालील Command वापरतो, तेव्हा Linux काही विशेष Characters द्वारे File Type ओळखते:

```bash
ls -l

```

तुम्हाला साधारणपणे असे Output दिसेल:

```
-rwxr-xr--  1 user  staff   120  Feb 10 12:21   script.sh

```

पहिले Character आपल्याला File Type सांगते:

| Symbol | Type | Description |
| --- | --- | --- |
| `-` | Regular File | text, config, scripts, binaries |
| `d` | Directory | folder |
| `l` | Symbolic Link | दुसऱ्या फाईलकडे पॉइंट करणारा shortcut |
| `c` | Character Device | keyboard, mouse, serial ports |
| `b` | Block Device | hard disks, SSDs |
| `s` | Socket | networking आणि communication साठी वापरले जाते |
| `p` | Named Pipe | inter-process communication |

तुमच्या दैनंदिन DevOps/SRE कामात प्रामुख्याने यांचा वापर होतो:
✔ Regular files
✔ Directories
✔ Symlinks

---

# 🔐 **2. Ownership in Linux**

प्रत्येक फाईलचे २ Owners असतात:

1️⃣ **user (u)** → मुख्य मालक (The owner)
2️⃣ **group (g)** → युजर्सचा समूह (A group of users)

तुमचे स्वतःचे Groups तपासण्यासाठी:

```bash
groups

```

Example output:
`staff admin everyone`

एखाद्या फाईलची Ownership तपासण्यासाठी:

```bash
ls -l perm_test1.txt

```

Example:
`-rw-r--r--  1 thinkerprafulla  staff  0 Feb 12 22:11 perm_test1.txt`

हे काय दर्शवते:

* **Owner:** thinkerprafulla
* **Group:** staff

---

# 🔧 **3. Changing Ownership (chown)** — तुम्ही रन केलेल्या Commands

तुमच्या History मधील काही महत्त्वाच्या Commands आणि त्यांचे स्पष्टीकरण:

### **3.1 स्वतःच्या युजरसाठी Ownership सेट करणे**

```bash
sudo chown $(whoami):$(whoami) perm_test1.txt

```

✔ **user = you** सेट करते.
✔ **group = you** (तुमचा Primary Group) सेट करते.

### **3.2 विशिष्ट Ownership सेट करणे**

```bash
sudo chown thinkerprafulla:staff perm_test1.txt

```

✔ Owner = `thinkerprafulla`
✔ Group = `staff`

### **3.3 फक्त User बदलणे (Group तोच ठेवणे)**

```bash
sudo chown $(whoami) perm_test1.txt

```

किंवा

```bash
sudo chown thinkerprafulla perm_test1.txt

```

✔ फक्त Owner बदलतो, Group तसाच राहतो.

---

# 🛡️ **4. Linux Permissions: rwx Explained**

Permissions खालील घटकांसाठी लागू होतात:

* **u** → user (owner)
* **g** → group
* **o** → others (इतर सर्व लोक)
* **a** → all users (सर्व)

Symbolic permissions:

| Symbol | Meaning |
| --- | --- |
| `r` | read |
| `w` | write |
| `x` | execute |

Example: `-rwxr-xr--` चा अर्थ:

| Section | Who | Meaning |
| --- | --- | --- |
| `rwx` | user | full access |
| `r-x` | group | read + execute |
| `r--` | others | read only |

---

# 🛠️ **5. Changing Permissions (chmod)**

तुमची Command:

```bash
chmod u=rwx,g=rx,o=r perm_test1.txt

```

याचा अर्थ:

* **u=rwx** → Owner वाचू शकतो, लिहू शकतो आणि रन करू शकतो.
* **g=rx** → Group फक्त वाचू शकतो आणि रन करू शकतो.
* **o=r** → Others फक्त वाचू शकतात.

---

# 🔢 **6. Numeric Permissions (Important!)**

Symbolic चे Numeric मध्ये रूपांतर:

| Symbolic | Numeric |
| --- | --- |
| `r--` | 4 |
| `rw-` | 6 |
| `r-x` | 5 |
| `rwx` | 7 |

त्यामुळे: `chmod 754 file` चा अर्थ होतो:

* **7** (rwx) → User साठी
* **5** (r-x) → Group साठी
* **4** (r--) → Others साठी

---

# 🎯 **End of Day-02: तुम्ही काय शिकलात?**

✔ File types ओळखणे (`-`, `d`, `l`, इ.)
✔ Ownership संकल्पना (user + group)
✔ `chown` चे विविध प्रकार
✔ Permission structure समजून घेणे
✔ Symbolic vs Numeric chmod मधील फरक
✔ Real-life DevOps फाईल हँडलिंगचे Basics

---

# 📌 Screenshot-Commands Output:

![day2_Permissions_&_Owners](https://github.com/ThinkerOnlineHub/linux-basics/blob/e7272a668b6bec45567aec30afd7d19418ffe7fb/screenshots/Day2_Change_File_Permissions_owner%2Cgroups_Linux.png)

![day2-Change_File-Permissions_&_Owners](https://github.com/ThinkerOnlineHub/linux-basics/blob/e7272a668b6bec45567aec30afd7d19418ffe7fb/screenshots/Day_02_File_permissions_and_owners.png)

---

## 💬 Commit Message

Add day-02.md — Linux File Types + Ownership + Permissions

🔗 **Links**
🎥 **YouTube:** @ThinkerTechSutraMarathi
💻 **GitHub Repo:** ThinkerOnlineHub/linux-basics
📰 **Blog:** [thinkertechsutramarathi](https://thinkertechsutramarathi.wordpress.com)
