# 🧩 Platform Ops Journey – Day 02  
### Topic: Linux Basics – File Permissions  

---

## 🎯 Goal
Learn Linux file permissions (rwx), chmod, chown and practice on sample files.

---

## 📘 Commands Practiced

```bash
# Check permissions
ls -l

# change permissions (example)
chmod 644 file.txt
chmod +x script.sh

# change owner (example)
sudo chown username:group file.txt

🧠 Learnings & Notes
rwx means read, write, execute.
Owner / Group / Others permissions concept.
chmod numeric vs symbolic modes.

🧑‍💻 Practice Activity
Create file testperm.txt
ls -l to see default permissions
chmod 600 testperm.txt then check with ls -l
chmod +x on a small script and execute it


💬 Reflection
[तुमचा छोटा observation — full sentence in Marathi/English]

