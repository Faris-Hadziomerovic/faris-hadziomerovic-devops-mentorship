#!/bin/bash
# testing closing file descriptors
exec 3>./files/output_file.txt
echo "This is a test line of data" >&3
exec 3>&-
cat ./files/output_file.txt
exec 3>./files/output_file.txt
echo "This'll be bad" >&3
