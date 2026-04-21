# Task: Ek script banav ji ek folder create karel, tyat ek file banvel ani tyat "Success" lihil. He karun bagh, jamle nahi tar me tula code sudharun dein.
# Ha mi code lihila hota. login tar yogya ahe pan DevOps Pro
# pramane to pudhe dilela ahe tasa code lihinyacha try kara.
# -----------------------------shell script -----------------------------

#!/bin/bash

# 1. create directory | directory/folder banavnyasathichi command
mkdir ~/1st-script

# 2. make file | file banavnyasathichi command
touch ~/1st-script/1st-file.txt

# 3. write text on file | file madhe text add karnyasathichi command
echo "Success" > ~/1st-script/1st-file.txt
cat ~/1st-script/1st-file.txt
echo "Done!"
