#!/bin/bash

# Create Multiple Folders

for folder in Month_1 Month_2 Month_3
do
    echo "Creating Folder: $folder"
    mkdir -p "$folder"
done

echo "All folders created successfully!"
