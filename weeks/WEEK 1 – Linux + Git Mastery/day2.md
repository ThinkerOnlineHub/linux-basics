# ✅ **DAY-02: Linux File Types + Ownership + Permissions**

> **Goal:** Understand how Linux handles files, ownership, groups & permission control.
> This is one of the MOST IMPORTANT foundations for DevOps, SRE, and Platform Engineering.

---

# 🧩 **1. File Types in Linux**

Linux identifies files with special characters when using:

```bash
ls -l
```

You get something like:

```
-rwxr-xr--  1 user  staff   120  Feb 10 12:21   script.sh
```

The first character tells file type:

| Symbol | Type             | Description                        |
| ------ | ---------------- | ---------------------------------- |
| `-`    | Regular File     | text, config, scripts, binaries    |
| `d`    | Directory        | folder                             |
| `l`    | Symbolic Link    | shortcut pointing to another file  |
| `c`    | Character Device | keyboard, mouse, serial ports      |
| `b`    | Block Device     | hard disks, SSDs                   |
| `s`    | Socket           | used for networking, communication |
| `p`    | Named Pipe       | inter-process communication        |

Your daily DevOps/SRE work uses mainly:
✔ Regular files
✔ Directories
✔ Symlinks

---

# 🔐 **2. Ownership in Linux**

Every file has 2 owners:

1️⃣ **user (u)** → The owner
2️⃣ **group (g)** → A group of users

Check your own groups:

```bash
groups
```

Example output:

```
staff admin everyone
```

Check ownership of a file:

```bash
ls -l perm_test1.txt
```

Example:

```
-rw-r--r--  1 thinkerprafulla  staff  0 Feb 12 22:11 perm_test1.txt
```

This shows:

* **Owner:** thinkerprafulla
* **Group:** staff

---

# 🔧 **3. Changing Ownership (chown)** — Real Commands You Ran

Here are all the commands from your history with explanations:

---

### **3.1 Set ownership to your user**

```bash
sudo chown $(whoami):$(whoami) perm_test1.txt
```

✔ Sets **user = you**
✔ Sets **group = you** (your primary group)

---

### **3.2 Set ownership specifically**

```bash
sudo chown thinkerprafulla:staff perm_test1.txt
```

✔ Owner = `thinkerprafulla`
✔ Group = `staff`

---

### **3.3 Change only user (keep same group)**

```bash
sudo chown $(whoami) perm_test1.txt
```

✔ Only owner changes
✔ Group stays same

Equivalent to:

```bash
sudo chown thinkerprafulla perm_test1.txt
```

---

### **3.4 Check ownership**

```bash
ls -l perm_test1.txt
```

---

# 🛡️ **4. Linux Permissions: rwx Explained**

Permissions apply to:

* **u** → user (owner)
* **g** → group
* **o** → others (everyone else)
* **a** → all users

Symbolic permissions:

| Symbol | Meaning |
| ------ | ------- |
| `r`    | read    |
| `w`    | write   |
| `x`    | execute |

Example:

```
-rwxr-xr--
```

Breakdown:

| Section | Who    | Meaning        |
| ------- | ------ | -------------- |
| `rwx`   | user   | full access    |
| `r-x`   | group  | read + execute |
| `r--`   | others | read only      |

---

# 🛠️ **5. Changing Permissions (chmod)**

Your exact command:

```bash
chmod u=rwx,g=rx,o=r perm_test1.txt
```

Meaning:

* **u=rwx** → owner can read, write, execute
* **g=rx** → group can read + execute
* **o=r** → others can only read

Check result:

```bash
ls -l perm_test1.txt
```

Expect something like:

```
-rwxr-xr--  1 thinkerprafulla  staff   0 Feb 12 22:33 perm_test1.txt
```

---

# 🔢 **6. Numeric Permissions (Important!)**

Symbolic → Numeric conversion:

| Symbolic | Numeric |
| -------- | ------- |
| `r--`    | 4       |
| `rw-`    | 6       |
| `r-x`    | 5       |
| `rwx`    | 7       |

So:

```
chmod 754 file
```

Means:

* 7 → rwx for user
* 5 → r-x for group
* 4 → r-- for others

---

# 🧪 **7. FULL TERMINAL SESSION (Your Real Commands)**

```
651  sudo chown $(whoami):$(whoami) perm_test1.txt
652  whoami
653  sudo chown $(thinkerprafulla):$(thinkerprafulla) perm_test1.txt
654  sudo chown $(thinkerprafulla) perm_test1.txt
655  chown
656  sudo chown thinkerprafulla:staff perm_test1.txt
657  ls -l perm_test1.txt
658  sudo chown $(whoami):staff perm_test1.txt
659  ls -l perm_test1.txt
660  sudo chown $(whoami) perm_test1.txt
661  ls -l
662  ls -l perm_test1.txt
663  groups
664  chmod u=rwx,g=rx,o=r perm_test1.txt
665  ls -l perm_test1.txt
666  clear
```

---

# 🎯 **End of Day-02: What You Learned**

✔ File types (`-`, `d`, `l`, etc.)
✔ Ownership (user + group)
✔ `chown` variations
✔ Permission structure
✔ Symbolic vs Numeric chmod
✔ Real-life DevOps file-handling basics

---

# 📌 Want me to generate:

![day2-File-Permissions_&_Owners](screenshots/Day2_Change_File_Permissions_owner,groups_Linux.png)
![day2-Change_File-Permissions_&_Owners](screenshots/Day_02_File_permissions_and_owners.png)
