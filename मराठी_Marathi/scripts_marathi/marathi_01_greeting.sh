# Task: Ek script banav ji Greetings Text Print karel mhanje script run keli tar tumhi jo msg lihila ahe to dakhavel.
# Linux madhe file banvlya-banvlya ti "Executable" naste. Tula tila power dyavi lagel:
# commmand: `chmod +x myscript.sh`

# Run Karaych asel tar pudhil command use kara
# command: `./myscript.sh`
# -----------------------------shell script -----------------------------

#!/bin/bash

# 1. Variable define kara
GREETING="Welcome to DevOps Learning"

# 2. Output dakhva
echo "Hello $USER, $GREETING"

# 3. Simple automation (Folder banvane)
echo "Creating a backup folder..."
mkdir -p ~/my_backup
echo "Done!"



