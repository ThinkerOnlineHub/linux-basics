# Task: Jar tula एकाच वेळी 3 folders (Month_1, Month_2, Month_3) banvayche astil, tar loop kasa vapraycha?
# # for loop use kartana

# -----------------------------shell script -----------------------------

#!/bin/bash


for folder in Month_1 Month_2 Month_3
do
	echo "Creating Folder: $folder"
	mkdir $folder
done
echo "sagle banun tayar ahet!"
