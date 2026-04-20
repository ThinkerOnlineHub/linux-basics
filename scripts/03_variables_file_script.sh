#!/bin/bash

# Using Variables (Best Practice)

DIR_NAME="2nd-script"
FILE_NAME="2nd-file.txt"
BASE_PATH="$HOME/bash-scripts"

echo "Creating directory..."
mkdir -p "$BASE_PATH/$DIR_NAME"

echo "Writing to file..."
echo "Success" > "$BASE_PATH/$DIR_NAME/$FILE_NAME"

echo "Checking file content:"
cat "$BASE_PATH/$DIR_NAME/$FILE_NAME"

echo "Task Done!"
