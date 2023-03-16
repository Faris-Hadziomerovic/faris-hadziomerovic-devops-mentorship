#!/bin/bash
# Test using at command
#

export PATH="$PATH:/home/centos/faris-hadziomerovic-week-3/"

echo "This script ran at $(date +%B%d,%T)" >./files/output.out
echo >>./files/output.out
sleep 5
echo "This is the script's end..." >>./files/output.out
