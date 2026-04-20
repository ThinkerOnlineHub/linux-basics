#!/bin/bash

# Directory Check Script

DIR_PATH="$HOME/bash-scripts/2nd-script"

if [ -d "$DIR_PATH" ]; then
    echo "Directory Exists."
else
    echo "Directory not found. Creating..."
    mkdir -p "$DIR_PATH"
fi
