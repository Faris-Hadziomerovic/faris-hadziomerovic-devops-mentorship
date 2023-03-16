#!/bin/bash
# Testing parameters
#
if [ $# -ne 2 ]; then
    echo
    echo Usage: test-42.sh number1 number2
    echo
else
    total=$(($1 + $2))
    echo
    echo The total is $total
    echo
fi
