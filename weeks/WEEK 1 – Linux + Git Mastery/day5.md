# ✅ **DAY-05: Linux Networking Basics (AWS Ubuntu)**

> **Goal:** Understand Linux networking fundamentals using real AWS EC2 Ubuntu practice.
> Focus on connectivity, DNS resolution, ports, and routing — **core skills for DevOps, SRE, and Platform Operations**.

---

# 🧩 **1. What is Networking in Linux?**

Networking in Linux is about **how systems communicate with each other** — locally and over the internet.

In production:

* Applications communicate over **ports**
* Services depend on **DNS**
* Failures often occur due to **network misconfiguration**, not code

📌 A running application is useless if it’s **not reachable over the network**.

---

# 🔍 **2. Testing Basic Connectivity with `ping`**

### Command used:

```bash
ping -c 4 google.com
```

### Explanation:

* `ping` checks if a remote host is reachable
* `-c 4` sends only 4 packets (safe for production)

### What this confirms:

✔ Internet access from EC2

✔ DNS resolution is working

✔ Network latency visibility

---

### Testing custom domain connectivity:

```bash
ping -c 3 thinkertechsutramarathi.wordpress.com
```

✔ Confirms external website reachability

✔ Verifies DNS + network path

---

# 📘 **3. Understanding Commands Using Manual Pages**

### Command used:

```bash
man ping
```

### Why this matters:

* Professional engineers **read manuals**
* Avoid wrong flags in production
* Build deep command understanding

📌 `man` usage is a **senior-engineer habit**.

---

# 🌐 **4. Testing HTTP Connectivity with `curl`**

### Command used:

```bash
curl -I https://github.com
```

### Explanation:

* `-I` fetches only HTTP headers
* Used to test API and web service reachability

### What this confirms:

✔ HTTPS outbound access

✔ Valid HTTP response (200 OK)

✔ TLS handshake success

---

### Finding public IP address:

```bash
curl https://api.ipify.org
```

✔ Identifies EC2 public IP

✔ Useful for firewall & security group debugging

---

# 🔌 **5. Checking Listening Ports with `ss`**

### Command used:

```bash
ss -tuln | head
```

### Explanation:

| Option | Meaning         |
| ------ | --------------- |
| `-t`   | TCP             |
| `-u`   | UDP             |
| `-l`   | Listening ports |
| `-n`   | Numeric output  |

### Why this matters:

✔ Confirms which services are running

✔ Verifies SSH (port 22)

✔ Used during outage debugging

📌 `ss` is the **modern replacement for netstat**.

---

# 🧰 **6. Legacy Port Inspection using `netstat`**

Initially, `netstat` was not available.

### Install command:

```bash
sudo apt install net-tools
```

### Command used after install:

```bash
netstat -tuln
```

### Why still important:

✔ Common in legacy systems

✔ Seen in older production servers

✔ Required knowledge for interviews

---

# 🌍 **7. DNS Resolution with `dig`**

### Command used:

```bash
dig +short google.com
```

```bash
dig +short thinkertechsutramarathi.wordpress.com
```

### Explanation:

* `dig` checks DNS resolution
* `+short` shows clean IP output

### What this confirms:

✔ DNS servers reachable

✔ Domain resolves correctly

✔ No name resolution issues

📌 **If DNS fails, applications fail**.

---

# 🛣️ **8. Tracing Network Path using `traceroute`**

Initially, `traceroute` was not installed.

### Install command:

```bash
sudo apt install traceroute
```

### Command used:

```bash
traceroute google.com
```

```bash
traceroute thinkertechsutramarathi.wordpress.com
```

### Explanation:

* Shows hop-by-hop network path
* Helps identify routing delays or drops

⚠️ `* * *` is normal due to firewalls blocking ICMP.

---

# 🎯 **9. Why This Matters for DevOps / SRE / Platform Ops**


✔ Network issues cause most production outages

✔ Debugging starts with connectivity, not code

✔ DNS, ports, and routing must be verified

✔ These tools are used **daily in real incidents**

---

# 🧠 **Quick Summary**

| Command      | Purpose                |
| ------------ | ---------------------- |
| `ping`       | Test connectivity      |
| `curl`       | Test HTTP / APIs       |
| `ss`         | Check listening ports  |
| `netstat`    | Legacy port inspection |
| `dig`        | DNS resolution         |
| `traceroute` | Network path analysis  |
| `man`        | Command documentation  |

---

# 📌 Screenshot – Commands Output

```
screenshots/Day-05_AWS_Ubuntu_Networking_Basics.png
```
![Day-5_Networking_basics_ping]([screenshots/Day-5_Networking_basics_ping.png](https://github.com/ThinkerOnlineHub/linux-basics/blob/fc6224c55d8295cc2ce2fb9f4605e38e1197ca65/screenshots/Day-5_Networking_basics_ping.png))

[Day-5_Networking_basics_curl_ss_install_netstat]([screenshots/Day-5_Networking_basics_curl_ss_install_netstat_cmd](https://github.com/ThinkerOnlineHub/linux-basics/blob/bee66936a00345055b678938da0faaf7d2957df7/screenshots/Day-5_Networking_basics_curl_ss_install_netstat_cmd.png))

[Day-5_Networking_basics_netstat_ss_-tuln_dig+short_traceroute_sudo_apt_install]([screenshots/Day-5_Networking_basics_netstat_ss_-tuln_dig+short_traceroute_sudo_apt_install_cmd](https://github.com/ThinkerOnlineHub/linux-basics/blob/bee66936a00345055b678938da0faaf7d2957df7/screenshots/Day-5_Networking_basics_netstat_ss_-tuln_dig%2Bshort_traceroute_sudo_apt_install_cmd.png))

[Day-5_Networking_basics_sudo_apt_install_traceroute]([screenshots/Day-5_Networking_basics_sudo_apt_install_traceroute_cmd](https://github.com/ThinkerOnlineHub/linux-basics/blob/bee66936a00345055b678938da0faaf7d2957df7/screenshots/Day-5_Networking_basics_sudo_apt_install_traceroute_cmd.png))

[Day-5_Networking_basics_traceroute]([screenshots/Day-5_Networking_basics_traceroute_cmd](https://github.com/ThinkerOnlineHub/linux-basics/blob/bee66936a00345055b678938da0faaf7d2957df7/screenshots/Day-5_Networking_basics_traceroute_cmd.png))

[Day-5_Networking_basics_ping_curl_ss_netstat_dig_traceroute]([screenshots/Day-5_Networking_basics_ping_curl_ss_netstat_dig_traceroute_cmd](https://github.com/ThinkerOnlineHub/linux-basics/blob/bee66936a00345055b678938da0faaf7d2957df7/screenshots/Day-5_Networking_basics_ping_curl_ss_netstat_dig_traceroute_cmd.png))

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

You now clearly understand:

✔ Linux networking fundamentals
✔ Connectivity & DNS troubleshooting
✔ Port & service inspection
✔ Network path analysis
✔ Real AWS EC2 networking practice

---
