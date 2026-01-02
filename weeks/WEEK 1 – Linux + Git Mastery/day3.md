## 📄 **Day-3 — Linux Users, Groups & Sudo Access**

````markdown
# Day-3 — Linux Users, Groups & Sudo Access

> **Topic:** Linux User Management, Groups, and Sudo Privileges  
> **Category:** Linux Fundamentals  
> **Level:** Beginner → Platform Ops Foundation

---

## 🔍 Overview

Today’s focus is on **Linux user and group management**, along with understanding **sudo access**.

In Platform Operations and DevOps roles, **access control and permissions** are critical.  
Most real-world incidents, security issues, and automation tasks involve users, groups, and privilege escalation.

Understanding this properly is **mandatory for production systems**.

---

## 🧑‍💻 Commands Practiced (Terminal History)

```bash
groups $(whoami)
id $(whoami)
sudo -i
sudo useradd testuser
sudo passwd testuser
sudo usermod -aG sudo testuser
man sudo usermod -aG
man sudo usermod -a | grep "-a"
man sudo usermod | grep "G"
````

---

## 🚀 What I Learned (Step-by-Step)

---

### 1️⃣ Checking User Groups

Linux is a **multi-user operating system**.
Knowing which user belongs to which group is essential for permissions and access control.

```bash
groups $(whoami)
```

* `whoami` → shows the currently logged-in user
* `groups` → displays all groups that user belongs to

```bash
id $(whoami)
```

* Displays:

  * User ID (UID)
  * Group ID (GID)
  * All assigned groups

✅ This is commonly used for **auditing access on servers**.

---

### 2️⃣ Root Access vs Sudo

```bash
sudo -i
```

* Switches to a **root shell**
* Used when administrative tasks are required

⚠️ **Best Practice:**
Direct root login is usually **disabled on production servers**.
Instead, users are granted `sudo` access for security and accountability.

---

### 3️⃣ Creating a New User

```bash
sudo useradd testuser
```

* Creates a new user named `testuser`

Set a password for the user:

```bash
sudo passwd testuser
```

---

### 4️⃣ Granting Sudo Privileges

```bash
sudo usermod -aG sudo testuser
```

#### Explanation of options:

| Option     | Description                                        |
| ---------- | ----------------------------------------------     |
| `usermod`  | Modify an existing user                            |
| `-a`       | Append (important to **preserve** existing groups) |
| `-G`       | Specify group                                      |
| `sudo`     | Group name                                         |
| `testuser` | Target user                                        |

✅ After this, `testuser` can run administrative commands using `sudo`.

📌 **Critical Note:**
Never omit `-a` when using `-G`, or existing groups may be removed.

---

### 5️⃣ Using Manual Pages (Professional Habit)

Linux provides built-in documentation via `man` pages:

```bash
man sudo usermod -aG
man sudo usermod -a | grep "-a"
man sudo usermod | grep "G"
```

This helps:

* Understand command options
* Avoid mistakes on production systems
* Build strong troubleshooting habits

---

## 📌 DevOps / Platform Ops Takeaways

✔ User and group management is a **daily task** in Platform Ops
✔ `sudo` access should be **controlled, audited, and minimal**
✔ `groups` and `id` are commonly used during **incident troubleshooting**
✔ Manual pages (`man`) are a professional engineer’s best friend

---

## 🧠 Quick Summary

| Command                 | Purpose                      |
| ----------------------- | ---------------------------- |
| `groups $(whoami)`      | List groups for current user |
| `id $(whoami)`          | Show UID, GID, and groups    |
| `sudo useradd`          | Create a new user            |
| `sudo passwd`           | Set user password            |
| `sudo usermod -aG sudo` | Grant sudo access            |
| `man`                   | View command documentation   |

---

## 📸 Screenshots to Capture

* Output of `groups $(whoami)`
* Output of `id $(whoami)`
* Verification of sudo access for `testuser`

📁 Recommended path:

```
screenshots/day-03-user-groups.png
```

---

## 🧪 Practice Exercises

1. Create another user (e.g., `devopsuser`)
2. Assign it to a non-sudo group
3. Switch to that user:

   ```bash
   su - devopsuser
   ```
4. Grant sudo access and verify

---

## 🔑 Key Concepts to Remember

* `sudo -i` vs `sudo su -` (try both and observe differences)
* Always verify group membership after changes
* Never give unnecessary sudo access on production systems

---

✅ **Day-3 Completed Successfully**

---

