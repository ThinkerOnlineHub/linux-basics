#!/bin/bash

# 1. Variable define kara
GREETING="Welcome to DevOps Learning"

# 2. Output dakhva
echo "Hello $USER, $GREETING"

# 3. Simple automation (Folder banvane)
echo "Creating a backup folder..."
mkdir -p ~/my_backup
echo "Done!"
