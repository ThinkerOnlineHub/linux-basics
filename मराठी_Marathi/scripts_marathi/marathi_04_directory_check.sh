# Task: Linux madhe script "Hushar" banvnya-sathi Conditions garjechya ahet.
# **Scenario:** Jar folder aadhi pasunach asel, tar script ne "Folder already exists" mhanle pahije, ani nasel tar banvle pahije.
# -----------------------------shell script -----------------------------

#directory check karnyasathi ani jar folder/directory available nasel tar navin banavnyasathi chi script

#!/bin/bash

if [ -d ~/bash-scripts/2nd-script ]; then
        echo "Directory Exists."
else
        mkdir ~/bash-scripts/2nd-script
fi
