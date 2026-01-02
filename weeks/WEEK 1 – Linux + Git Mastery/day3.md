
# ✅ **DAY-03: Linux Users, Groups & Sudo Access (AWS Ubuntu)**

> **Goal:** Understand Linux users, groups, and sudo access using a real AWS EC2 Ubuntu instance.
> This is a **critical foundation** for DevOps, SRE, and Platform Engineering because **access control = security**.

---

# 🧩 **1. Understanding Users & Groups in Linux**

Linux is a **multi-user operating system**.
Every command, file access, and service runs under a **user identity**.

Each user has:

* **UID** → User ID
* **GID** → Primary Group ID
* **Secondary Groups** → Additional permissions

---

# 🔍 **2. Checking Groups on AWS Ubuntu**

### Command used:

```bash
groups $(whoami)
```

### Real output (AWS Ubuntu):

```
ubuntu : ubuntu adm cdrom sudo dip lxd
```

### Meaning:

| Group    | Purpose                     |
| -------- | --------------------------- |
| `ubuntu` | Primary user group          |
| `adm`    | Read system logs            |
| `cdrom`  | Access CD-ROM devices       |
| `sudo`   | Run administrative commands |
| `dip`    | Network configuration       |
| `lxd`    | Manage LXD containers       |

✅ Presence of **`sudo` group** means this user already has admin access.

---

# 🧾 **3. Checking Detailed User Identity**

```bash
id $(whoami)
```

### Real output:

```
uid=1000(ubuntu) gid=1000(ubuntu) groups=1000(ubuntu),4(adm),24(cdrom),27(sudo),30(dip),105(lxd)
```

### Breakdown:

* **UID:** `1000` → ubuntu user
* **Primary Group:** `ubuntu`
* **Secondary Groups:** sudo, adm, lxd, etc.

📌 This command is **commonly used in production debugging**.

---

# 🛡️ **4. Root Access vs Sudo (Best Practice)**

### Switch to root shell:

```bash
sudo -i
```

Prompt changes to:

```
root@ip-172-31-17-4:~#
```

Exit root shell:

```bash
exit
```

### Why DevOps uses `sudo` instead of root login:

✔ Better security
✔ Command auditing
✔ Prevents accidental system damage

⚠️ **Direct root login is disabled on AWS by default**

---

# 👤 **5. Creating a New User on Ubuntu**

### Create user:

```bash
sudo useradd testuser
```

✔ User created (but login disabled until password is set)

---

### Set password:

```bash
sudo passwd testuser
```

Output:

```
passwd: password updated successfully
```

✔ Now the user can log in

---

# 🔐 **6. Granting Sudo Access to a User**

```bash
sudo usermod -aG sudo testuser
```

### Explanation:

| Option     | Meaning                                |
| ---------- | -------------------------------------- |
| `usermod`  | Modify existing user                   |
| `-a`       | Append (do not remove existing groups) |
| `-G`       | Specify group                          |
| `sudo`     | Admin privileges                       |
| `testuser` | Target user                            |

⚠️ **Very Important:**
Never use `-G` without `-a` → it can **remove existing groups**.

---

# 📖 **7. Reading Manual Pages (Professional Habit)**

```bash
man sudo usermod -aG
man sudo usermod -a
man sudo usermod -a | grep "G"
```

✔ Essential skill for:

* Understanding commands deeply
* Avoiding production mistakes
* Becoming a self-reliant engineer

---

# 🧪 **8. FULL TERMINAL SESSION (Real AWS Practice)**

```
groups $(whoami)
id $(whoami)
sudo -i
exit
sudo useradd testuser
sudo passwd testuser
sudo usermod -aG sudo testuser
man sudo usermod -aG
man sudo usermod -a
man sudo usermod -a | grep "G"
```

---

# 🎯 **9. Why This Matters for DevOps / Platform Ops**

✔ Every EC2 / VM uses Linux users
✔ CI/CD agents run as users
✔ Incorrect permissions = security risk
✔ Sudo access control prevents outages

---

# 🧠 **Quick Summary**

| Command            | Purpose               |
| ------------------ | --------------------- |
| `groups`           | Show user groups      |
| `id`               | Show UID, GID, groups |
| `sudo -i`          | Root shell            |
| `useradd`          | Create user           |
| `passwd`           | Set password          |
| `usermod -aG sudo` | Grant admin access    |
| `man`              | Read documentation    |

---

# 📌 Screenshot – Commands Output

```
screenshots/Day-03_AWS_Ubuntu_User_Groups_Sudo.png

![Day-03_AWS_Ubuntu_User_Groups_Sudo](https://github.com/ThinkerOnlineHub/linux-basics/blob/9b959e69091102a1bb8a0d4076b669cc4a9eb43f/screenshots/Day-03_AWS_Ubuntu_User_Groups_Sudo.png)

```

(Add the screenshot you shared here)

---

## 💬 Commit Message

```
Add day-03.md — Linux Users, Groups & Sudo Access (AWS Ubuntu)
```

---

## 🔗 Links

🎥 **YouTube:** @ThinkerTechSutraMarathi
💻 **GitHub Repo:** ThinkerOnlineHub/linux-basics
📰 **Blog:** [https://thinkertechsutramarathi.wordpress.com/](https://thinkertechsutramarathi.wordpress.com/)

---

# ✅ **End of Day-03**

You now clearly understand:
✔ Linux users
✔ Groups & permissions
✔ Sudo access model
✔ AWS Ubuntu best practices

---
