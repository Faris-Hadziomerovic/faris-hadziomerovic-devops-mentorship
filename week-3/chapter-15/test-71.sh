#!/bin/bash
# testing closing file descriptors
exec 3>./files/output.txt
echo "This is a test line of data" >&3
exec 3>&-
echo "This won't work" >&3
