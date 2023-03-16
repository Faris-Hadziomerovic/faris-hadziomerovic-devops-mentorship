#!/bin/bash
# testing input/output file descriptor
exec 3<>./files/output.txt
read line <&3
echo "Read: $line"
echo "This is a test line" >&3
