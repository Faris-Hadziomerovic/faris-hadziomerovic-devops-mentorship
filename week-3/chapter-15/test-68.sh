#!/bin/bash
# storing STDOUT, then coming back to it
exec 3>&1
exec 1>./files/output.txt
echo "This should store in the output.txt file"
echo "along with this line."
exec 1>&3
echo "Now things should be back to normal"
