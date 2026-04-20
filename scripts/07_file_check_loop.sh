#!/bin/bash

# List files in directory

shopt -s nullglob

for file in "$HOME/bash-scripts"/*.txt "$HOME/bash-scripts"/*.sh
do
    echo "Hya file che naav ahe: $file"
done
