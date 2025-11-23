### 📌 **Day 1 – Linux File System Exploration**

On Day 1, I explored the Linux filesystem using basic commands to understand the purpose of major directories.
Below are the commands executed and observations recorded from the terminal output.

---

### 🔹 **Command:** `ls /`

This lists the contents of the **root directory `/`**.

💡 **Observation:**
The root folder contains major system directories responsible for OS functions.
Some notable ones from the output:

| Directory       | Purpose                                                                          |
| --------------- | -------------------------------------------------------------------------------- |
| `/Applications` | Contains macOS applications installed system-wide                                |
| `/bin`          | Essential user binaries (system commands)                                        |
| `/dev`          | Device files (storage, keyboard, ports etc.)                                     |
| `/etc`          | System configuration files                                                       |
| `/home`         | Default location for user directories (not used in macOS — replaced by `/Users`) |
| `/Library`      | System and app libraries                                                         |
| `/usr`          | User-installed utilities and programs                                            |
| `/var`          | Variable files such as logs and temporary data                                   |

---

### 🔹 **Command:** `ls /home`

💡 **Observation:**
The `/home` directory returned **(No such directory)** in macOS.
Instead, macOS uses `/Users` for user accounts.
This confirms that directory structures vary by Linux/macOS.

---

### 🔹 **Command:** `ls /etc`

💡 **Observation:**
`/etc` contains critical **system configuration files**, such as:

| File/Folder               | Purpose                         |
| ------------------------- | ------------------------------- |
| `hosts`                   | Maps hostnames to IP addresses  |
| `passwd`                  | Stores user account information |
| `ssh`                     | SSH configuration               |
| `sudoers`                 | Sudo permission rules           |
| `networkd`, `resolv.conf` | Network configuration           |

Most services and authentication settings live here.

---

### 🔹 **Command:** `ls /var`

💡 **Observation:**
`/var` contains **frequently changing (variable) data**, including:

| Folder       | Purpose                                 |
| ------------ | --------------------------------------- |
| `/var/log`   | System & application logs               |
| `/var/mail`  | Local user mail data                    |
| `/var/spool` | Printing and cron job data              |
| `/var/run`   | Runtime process information (PIDs etc.) |

This directory is important for monitoring & troubleshooting in DevOps.

---

### 🔹 **Command:** `ls /usr`

💡 **Observation:**
`/usr` contains **user binaries and system resources**, including:

| Folder       | Purpose                        |
| ------------ | ------------------------------ |
| `/usr/bin`   | Executable programs            |
| `/usr/lib`   | Shared libraries               |
| `/usr/local` | Locally installed apps/tools   |
| `/usr/sbin`  | System binaries for root/admin |

Many developer tools and command-line utilities live here.

---

### 📌 Overall Learning

| Concept Learned            | Explanation                                                                       |
| -------------------------- | --------------------------------------------------------------------------------- |
| Root filesystem layout     | `/` is the top-level directory containing all system folders                      |
| Directory responsibilities | Different directories have specific jobs (logs, binaries, config, home etc.)      |
| OS differences             | macOS uses `/Users` instead of `/home`, showing variations across Unix systems    |
| DevOps Importance          | Understanding Linux structure is critical for debugging, automation & deployments |

---

### 🖼 Screenshot Reference

✔ Included as proof of hands-on practice (terminal output running file system commands)

![linux file system](screenshots/Linux_File_System_Structure_CLI.png)

---
