## 🔧 **Commands Practiced**

mkdir platformops-learning
cd platformops-learning
mkdir day1
cd day1

touch about-me.txt
echo "Learning Linux Day 1" >> about-me.txt

mkdir projects documents downloads
cp about-me.txt documents/
mv about-me.txt downloads/
rm downloads/about-me.txt


## 🧠 **What Happened Step-by-Step (Observations)**

### **Step	Command	What I Observed / Result:**

| Step | Command                                       | What I Observed / Result                                                                                           |
| ---- | --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| 1    | `mkdir platformops-learning`                  | A new directory named **platformops-learning** was created.                                                        |
| 2    | `cd platformops-learning`                     | Entered the new directory successfully.                                                                            |
| 3    | `mkdir day1`                                  | Created a sub-folder **day1** for practice.                                                                        |
| 4    | `cd day1`                                     | Moved into **day1** directory.                                                                                     |
| 5    | `touch about-me.txt`                          | A blank text file **about-me.txt** was created.                                                                    |
| 6    | `echo "Learning Linux Day 1" >> about-me.txt` | Added text content *Learning Linux Day 1* inside the file.                                                         |
| 7    | `mkdir projects documents downloads`          | Three new folders were created: **projects**, **documents**, **downloads**.                                        |
| 8    | `cp about-me.txt documents/`                  | A **copy** of `about-me.txt` was created inside **documents** folder — original file remained in current location. |
| 9    | `mv about-me.txt downloads/`                  | The original file was **moved** (not copied) into **downloads** folder — now only one file exists.                 |
| 10   | `rm downloads/about-me.txt`                   | The file inside **downloads** folder was **deleted** permanently. No recycle bin in terminal.                      |


### ✔️ **Learning Outcome**

| Concept                              | Status                     |
| ------------------------------------ | -------------------------- |
| Directory creation + navigation      | ✅                          |
| File creation + editing text         | ✅                          |
| Copy vs Move difference              | **Understood**             |
| Permanent deletion using `rm`        | **Understood**             |
| Folder structuring for real projects | **Practiced successfully** |

### 📂 **Folder Structure After Completion**

platformops-learning/
└── day1/
    ├── documents-/
    │   └── about-me.txt
    ├── downloads-/        (empty because file was deleted)
    └── projects/         (empty)

### 📝 **Screenshot Reference**
📎 ![Day 1 Practice Screenshot](./screenshots/day1.png)


