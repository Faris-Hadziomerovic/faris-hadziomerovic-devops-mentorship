#!/bin/bash
# iterating through multiple directories
for file in ~/faris-hadziomerovic-week-3/* ./nonExistant; do
    if [ -d "$file" ]; then
        echo "$file is a directory"
    elif [ -f "$file" ]; then
        echo "$file is a file"
    else
        echo "$file doesn't exist"
    fi
done
