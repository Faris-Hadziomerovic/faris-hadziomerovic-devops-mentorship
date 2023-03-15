#!/bin/bash
# redirecting output to different locations
exec 2>./files/error_log.txt
echo "This is the start of the script"
echo "now redirecting all output to another location"

exec 1>./files/output.txt
echo "This output should go to the output.txt file"
echo "but this should go to the error_log.txt file" >&2
