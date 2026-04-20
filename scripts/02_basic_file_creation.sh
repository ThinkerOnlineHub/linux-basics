#!/bin/bash

# Basic File Creation Script

echo "Creating directory..."
mkdir -p "$HOME/1st-script"

echo "Creating file..."
touch "$HOME/1st-script/1st-file.txt"

echo "Writing content..."
echo "Success" > "$HOME/1st-script/1st-file.txt"

echo "Reading file..."
cat "$HOME/1st-script/1st-file.txt"

echo "Done!"
