#!/bin/bash
# redirecting file input
exec 0<./files/output.txt
count=1
while read -r line; do
    echo "Line #$count: $line"
    count=$((count + 1))
done
