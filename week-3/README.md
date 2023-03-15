```shell
#!/bin/bash
# basic for command
for test in Alabama Alaska Arizona Arkansas California Colorado; do
   echo The next state is $test
done
```
```shell
#!/bin/bash
# iterate through all the files in a directory
for file in ~/*; do
    if [ -d "$file" ]; then
        echo "$file is a directory"
    elif [ -f "$file" ]; then
        echo "$file is a file"
    fi
done
```
```shell
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
```
```shell
#!/bin/bash
# testing the C-style for loop
for ((i = 1; i <= 10; i++)); do
    echo "The next number is $i"
done
```
```shell
#!/bin/bash
# multiple variables
for ((a = 1, b = 10; a <= 10; a++, b--)); do
    echo "$a - $b"
done
```
```shell
#!/bin/bash
# while command test
var1=10
while [ $var1 -gt 0 ]; do
    echo $var1
    var1=$((var1 - 1))
done
```
```shell
#!/bin/bash
# testing a multicommand while loop
var1=10
while
    echo $var1
    [ $var1 -ge 0 ]
do
    echo " This is inside the loop"
    var1=$((var1 - 1))
done
```
```shell
#!/bin/bash
# using the until command
var1=100
until [ $var1 -eq 0 ]; do
    echo $var1
    var1=$((var1 - 25))
done
```
```shell
#!/bin/bash
# using the until command
var1=100
until
    echo $var1
    [ $var1 -eq 0 ]
do
    echo Inside the loop: $var1
    var1=$((var1 - 25))
done
```
```shell
#!/bin/bash
#nesting for loops
for ((a = 1; a <= 3; a++)); do
    echo "Starting loop $a:"
    for ((b = 1; b <= 3; b++)); do
        echo " Inside loop: $b"
    done
done
```
```shell
#!/bin/bash
# placing a for loop inside a while loop
var1=5
while [ $var1 -ge 0 ]; do
    echo "Outer loop: $var1"
    for ((var2 = 1; var2 < 3; var2++)); do
        var3=$((var1 * var2))
        echo " Inner loop: $var1 * $var2 = $var3"
    done
    var1=$((var1 - 1))
done
```
```shell
#!/bin/bash
# testing the for variable after the looping
for test in Alabama Alaska Arizona Arkansas California Colorado; do
    echo "The next state is $test"
done
echo "The last state we visited was $test"
test=Connecticut
echo "Wait, now we're visiting $test"
```
```shell
#!/bin/bash
# using until and while loops
var1=3
until [ $var1 -eq 0 ]; do
    echo "Outer loop: $var1"
    var2=1
    while [ $var2 -lt 5 ]; do
        var3=$(echo "scale=4; $var1 / $var2" | bc)
        echo "  Inner loop: $var1 / $var2 = $var3"
        var2=$((var2 + 1))
    done
    var1=$((var1 - 1))
done
```
```shell
#!/bin/bash
# breaking out of a for loop
for var1 in 1 2 3 4 5 6 7 8 9 10; do
    if [ $var1 -eq 5 ]; then
        break
    fi
    echo "Iteration number: $var1"
done
echo "The for loop is completed"
```
```shell
#!/bin/bash
# breaking out of a while loop
var1=1
while [ $var1 -lt 10 ]; do
    if [ $var1 -eq 5 ]; then
        break
    fi
    echo "Iteration: $var1"
    var1=$((var1 + 1))
done
echo "The while loop is completed"
```
```shell
#!/bin/bash
# breaking out of an inner loop
for ((a = 1; a < 4; a++)); do
    echo "Outer loop: $a"
    for ((b = 1; b < 100; b++)); do
        if [ $b -eq 5 ]; then
            break
        fi
        echo "  Inner loop: $b"
    done
done
```
```shell
#!/bin/bash
# breaking out of an outer loop
for ((a = 1; a < 4; a++)); do
    echo "Outer loop: $a"
    for ((b = 1; b < 100; b++)); do
        if [ $b -gt 4 ]; then
            break 2
        fi
        echo "  Inner loop: $b"
    done
done
```
```shell
#!/bin/bash
# using the continue command
for ((var1 = 1; var1 < 15; var1++)); do
    if [ $var1 -gt 5 ] && [ $var1 -lt 10 ]; then
        continue
    fi
    echo "Iteration number: $var1"
done
```
```shell
#!/bin/bash
# improperly using the continue command in a while loop
var1=0
while
    echo "while iteration: $var1"
    [ $var1 -lt 15 ]
do
    if [ $var1 -gt 5 ] && [ $var1 -lt 10 ]; then
        continue
    fi
    echo "  Inside iteration number: $var1"
    var1=$((var1 + 1))
done
```
```shell
#!/bin/bash
# continuing an outer loop
for ((a = 1; a <= 5; a++)); do
    echo "Iteration $a:"
    for ((b = 1; b < 3; b++)); do
        if [ $a -gt 2 ] && [ $a -lt 4 ]; then
            continue 2
        fi
        var3=$((a * b))
        echo "  The result of $a * $b is $var3"
    done
done
```
```shell
#!/bin/bash
# redirecting the for output to a file
for ((a = 1; a < 10; a++)); do
    echo "The number is $a"
done >test-28.txt
echo "The command is finished."
```
```shell
#!/bin/bash
# piping a loop to another command
for state in "North Dakota" Connecticut Illinois Alabama Tennessee; do
    echo "$state is the next place to go"
done | sort
echo "This completes our travels"
```
```shell
#!/bin/bash
# another example of how not to use the for command
for test in I don't know if this'll work; do
    echo "word:$test"
done
```
```shell
#!/bin/bash
# finding files in the PATH
IFS=:
for folder in $PATH; do
    echo "$folder:"
    for file in "$folder"/*; do
        if [ -x "$file" ]; then
            echo "$file"
        fi
    done
done
```
```shell
#!/bin/bash
# process new user accounts
input="./files/users.csv"
while IFS=',' read -r userid name; do
    echo "adding $userid"
    useradd -c "$name" -m "$userid"
done <"$input"
tail /etc/passwd
```
```shell
#!/bin/bash
# changing the IFS value
IFS_OLD=$IFS
IFS=$'\n'
for entry in $(cat /etc/passwd); do
    echo "Values in $entry –"
    IFS=:
    for value in $entry; do
        echo " $value"
    done
done
echo "Old IFS: $IFS_OLD"
```
```shell
#!/bin/bash
# another example of how not to use the for command
for test in I don\'t know if "this'll" work; do
    echo "word:$test"
done
```
```shell
#!/bin/bash
# another example of how not to use the for command
for test in Nevada New Hampshire New Mexico New York North Carolina; do
    echo "Now going to $test"
done
```
```shell
#!/bin/bash
# an example of how to properly define values
for test in Nevada "New Hampshire" "New Mexico" "New York"; do
    echo "Now going to $test"
done
```
```shell
#!/bin/bash
# using a variable to hold the list
list="Alabama Alaska Arizona Arkansas Colorado"
list=$list" Connecticut"
for state in $list; do
    echo "Have you ever visited $state?"
done
```
```shell
#!/bin/bash
# reading values from a file
file="../src/states"
for state in $(cat $file); do
    echo "Visit beautiful $state"
done
```
```shell
#!/bin/bash
# reading values from a file
file="../../src/states"
IFS=$'\n'
for state in $(cat $file); do
    echo "Visit beautiful $state"
done
```
```shell
#!/bin/bash
# using one command line parameter
factorial=1
for ((number = 1; number <= $1; number++)); do
    factorial=$((factorial * number))
done
echo "The factorial of $1 is $factorial"
```
```shell
#!/bin/bash

total=$(($1 * $2))
echo "The first parameter is $1."
echo "The second parameter is $2."
echo The total value is $total.
```
```shell
#!/bin/bash
# testing string parameters
echo "Hello $1, glad to meet you."
```
```shell
#!/bin/bash
# handling lots of parameters
#
total=$((${10} * ${11}))
echo The tenth parameter is ${10}
echo The eleventh parameter is ${11}
echo The total is $total
```
```shell
#!/bin/bash
# Testing the $0 parameter
#
echo The zero parameter is set to: "$0"
```
```shell
#!/bin/bash
# Using basename with the $0 parameter
name=$(basename $0)
echo
echo The script name is: $name
```
```shell
#!/bin/bash
# Testing a Multi-function script
#
name=$(basename "$0")
#
if [ "$name" = "38-addem" ]; then
    total=$(($1 + $2))
#
elif [ "$name" = "38-multem" ]; then
    total=$(($1 * $2))
fi
#
echo
echo The calculated value is "$total".
```
```shell
#!/bin/bash
# testing parameters before use
#
if [ -n "$1" ]; then
    echo Hello $1, glad to meet you.
else
    echo "Sorry, you did not identify yourself. "
fi
```
```shell
#!/bin/bash
# getting the number of parameters
#
echo There were $# parameters supplied.
```
```shell
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
```
```shell
#!/bin/bash
# testing grabbing last parameter
#
echo The last parameter was ${$#}
```
```shell
#!/bin/bash
# Grabbing the last parameter
#
params=$#
echo
echo The last parameter is $params
echo The last parameter is ${!#}
echo
```
```shell
#!/bin/bash
# testing $* and $@
#
echo
echo "Using the \$* method: $*"
echo
echo "Using the \$@ method: $@"
```
```shell
#!/bin/bash
# testing $* and $@
#
echo
count=1
#
for param in "$*"; do
    echo "\$* Parameter #$count = $param"
    count=$((count + 1))
done
#
echo
count=1
#
for param in "$@"; do
    echo "\$@ Parameter #$count = $param"
    count=$((count + 1))
done
```
```shell
#!/bin/bash
# demonstrating the shift command
echo
count=1
while [ -n "$1" ]; do
    echo "Parameter #$count = $1"
    count=$((count + 1))
    shift
done
```
```shell
#!/bin/bash
# demonstrating a multi-position shift
#
echo
echo "The original parameters: $*"
shift 2
echo "Here's the new first parameter: $1"
```
```shell
#!/bin/bash
# extracting command line options as parameters
#
echo
while [ -n "$1" ]; do
    case "$1" in
    -a) echo "Found the -a option" ;;
    -b) echo "Found the -b option" ;;
    -c) echo "Found the -c option" ;;
    *) echo "$1 is not an option" ;;
    esac
    shift
done
```
```shell
#!/bin/bash
# extracting options and parameters
echo
while [ -n "$1" ]; do
    case "$1" in
    -a) echo "Found the -a option" ;;
    -b) echo "Found the -b option" ;;
    -c) echo "Found the -c option" ;;
    --)
        shift
        break
        ;;
    *) echo "$1 is not an option" ;;
    esac
    shift
done
#
count=1
for param in "$@"; do
    echo "Parameter #$count: $param"
    count=$((count + 1))
done
```
```shell
#!/bin/bash
# extracting command line options and values
echo
while [ -n "$1" ]; do
    case "$1" in
    -a) echo "Found the -a option" ;;
    -b)
        param="$2"
        echo "Found the -b option, with parameter value $param"
        shift
        ;;
    -c) echo "Found the -c option" ;;
    --)
        shift
        break
        ;;
    *) echo "$1 is not an option" ;;
    esac
    shift
done
count=1
for param in "$@"; do
    echo "Parameter #$count: $param"
    count=$((count + 1))
done
```
```shell
#!/bin/bash
# Extract command line options & values with getopt
#
set -- $(getopt -q ab:cd "$@")
#
echo
while [ -n "$1" ]; do
    case "$1" in
    -a) echo "Found the -a option" ;;
    -b)
        param="$2"
        echo "Found the -b option, with parameter value $param"
        shift
        ;;
    -c) echo "Found the -c option" ;;
    --)
        shift
        break
        ;;
    *) echo "$1 is not an option" ;;
    esac
    shift
done
#
count=1
for param in "$@"; do
    echo "Parameter #$count: $param"
    count=$((count + 1))
done
```
```shell
#!/bin/bash
# simple demonstration of the getopts command
#
echo
while getopts :ab:c opt; do
    case "$opt" in
    a) echo "Found the -a option" ;;
    b) echo "Found the -b option, with value $OPTARG" ;;
    c) echo "Found the -c option" ;;
    *) echo "Unknown option: $opt" ;;
    esac
done
```
```shell
#!/bin/bash
# Processing options & parameters with getopts
#
echo
while getopts :ab:cd opt; do
    case "$opt" in
    a) echo "Found the -a option" ;;
    b) echo "Found the -b option, with value $OPTARG" ;;
    c) echo "Found the -c option" ;;
    d) echo "Found the -d option" ;;
    *) echo "Unknown option: $opt" ;;
    esac
done
#
shift $((OPTIND - 1))
#
echo
count=1
for param in "$@"; do
    echo "Parameter $count: $param"
    count=$((count + 1))
done
```
```shell
#!/bin/bash
# testing the read command
#
echo -n "Enter your name: "
read name
echo "Hello $name, welcome to my program."
```
```shell
#!/bin/bash
# testing the read -p option
#
read -p "Please enter your age: " age
days=$((age * 365))
echo "That makes you over $days days old! "
```
```shell
#!/bin/bash
# entering multiple variables
#
read -p "Enter your name: " first last
echo "Checking data for $last, $first…"
```
```shell
#!/bin/bash
# Testing the REPLY Environment variable
#
read -p "Enter your name: "
echo
echo Hello $REPLY, welcome to my program.
```
```shell
#!/bin/bash
# timing the data entry
#
if read -t 5 -p "Please enter your name: " name; then
    echo "Hello $name, welcome to my script"
else
    echo
    echo "Sorry, too slow! "
fi
```
```shell
#!/bin/bash
# getting just one character of input
#
read -n1 -p "Do you want to continue [Y/N]? " answer
case $answer in
Y | y)
    echo
    echo "fine, continue on…"
    ;;
N | n)
    echo
    echo OK, goodbye
    exit
    ;;
esac
echo "This is the end of the script"
```
```shell
#!/bin/bash
# hiding input data from the monitor
#
read -s -p "Enter your password: " pass
echo
echo "Is your password really $pass? "
```
```shell
#!/bin/bash
# reading data from a file
#
count=1
cat ./files/states | while read line; do
    echo "Line $count: $line"
    count=$((count + 1))
done
echo "Finished processing the file"
```
```shell
#!/bin/bash
# testing STDERR messages
echo "This is an error" >&2
echo "This is normal output"
```
```shell
#!/bin/bash
# redirecting all output to a file
exec 1>./files/output.txt
echo "This is a test of redirecting all output"
echo "from a script to another file."
echo "without having to redirect every individual line"
```
```shell
#!/bin/bash
# redirecting output to different locations
exec 2>./files/error_log.txt
echo "This is the start of the script"
echo "now redirecting all output to another location"

exec 1>./files/output.txt
echo "This output should go to the output.txt file"
echo "but this should go to the error_log.txt file" >&2
```
```shell
#!/bin/bash
# redirecting file input
exec 0<./files/output.txt
count=1
while read -r line; do
    echo "Line #$count: $line"
    count=$((count + 1))
done
```
```shell
#!/bin/bash
# using an alternative file descriptor
exec 3>./files/output.txt
echo "This should display on the monitor"
echo "and this should be stored in the file" >&3
echo "Then this should be back on the monitor"
```
```shell
#!/bin/bash
# storing STDOUT, then coming back to it
exec 3>&1
exec 1>./files/output.txt
echo "This should store in the output.txt file"
echo "along with this line."
exec 1>&3
echo "Now things should be back to normal"
```
```shell
#!/bin/bash
# redirecting input file descriptors
exec 6<&0
exec 0<./files/output.txt
count=1
while read -r line; do
    echo "Line #$count: $line"
    count=$((count + 1))
done

exec 0<&6
read -p "Are you done now? " answer
case $answer in
Y | y) echo "Goodbye" ;;
N | n) echo "Sorry, this is the end." ;;
esac
```
```shell
#!/bin/bash
# testing input/output file descriptor
exec 3<>./files/output.txt
read line <&3
echo "Read: $line"
echo "This is a test line" >&3
```
```shell
#!/bin/bash
# testing closing file descriptors
exec 3>./files/output.txt
echo "This is a test line of data" >&3
exec 3>&-
echo "This won't work" >&3
```
```shell
#!/bin/bash
# testing closing file descriptors
exec 3>./files/output_file.txt
echo "This is a test line of data" >&3
exec 3>&-
cat ./files/output_file.txt
exec 3>./files/output_file.txt
echo "This'll be bad" >&3
```
```shell
#!/bin/bash
# testing lsof with file descriptors
exec 3>./files/output_file_1.txt
exec 6>./files/output_file_2.txt
exec 7<./files/output.txt
/usr/sbin/lsof -a -p $$ -d0,1,2,3,6,7
```
```shell
#!/bin/bash
# creating and using a temp file
tempfile=$(mktemp test-74.XXXXXX)
exec 3>"$tempfile"
echo "This script writes to temp file $tempfile"
echo "This is the first line" >&3
echo "This is the second line." >&3
echo "This is the last line." >&3
exec 3>&-
echo "Done creating temp file. The contents are:"
cat "$tempfile"
sleep 3
rm -f "$tempfile" 2>/dev/null
```
```shell
#!/bin/bash
# creating a temp file in /tmp
tempfile=$(mktemp -t tmp.XXXXXX)
echo "This is a test file." >"$tempfile"
echo "This is the second line of the test." >>"$tempfile"
echo "The temp file is located at: $tempfile"
cat "$tempfile"
rm -f "$tempfile"
```
```shell
#!/bin/bash
# using a temporary directory
tempdir=$(mktemp -d dir.XXXXXX)
cd "$tempdir" || exit
tempfile1=$(mktemp temp.XXXXXX)
tempfile2=$(mktemp temp.XXXXXX)
exec 7>"$tempfile1"
exec 8>"$tempfile2"
echo "Sending data to directory $tempdir"
echo "This is a test line of data for $tempfile1" >&7
echo "This is a test line of data for $tempfile2" >&8
```
```shell
#!/bin/bash
# using the tee command for logging
tempfile=./files/test-77
echo "This is the start of the test" | tee $tempfile
echo "This is the second line of the test" | tee -a $tempfile
echo "This is the end of the test" | tee -a $tempfile
```
```shell
#!/bin/bash
# read file and create INSERT statements for MySQL
outfile='./files/members.sql'
IFS=','
while read lname fname address city state zip; do
    cat >>$outfile <<EOF
INSERT INTO members (lname,fname,address,city,state,zip) VALUES
('$lname', '$fname', '$address', '$city', '$state', '$zip');
EOF
done <"${1}"
```
```shell
#!/bin/bash
# Testing signal trapping
trap "echo ' Sorry! I have trapped Ctrl-C'" SIGINT
#
echo This is a test script
#
count=1
while [ $count -le 10 ]; do
    echo "Loop #$count"
    sleep 1
    count=$((count + 1))
done
#
echo "This is the end of the test script"
```
```shell
#!/bin/bash
# Trapping the script exit
#
trap "echo Goodbye..." EXIT
#
count=1
while [ $count -le 5 ]; do
    echo "Loop #$count"
    sleep 1
    count=$((count + 1))
done
```
```shell
#!/bin/bash
# Modifying a set trap
#
trap "echo ' Sorry... Ctrl-C is trapped.'" SIGINT
count=1
while [ $count -le 5 ]; do
    echo "Loop #$count"
    sleep 1
    count=$((count + 1))
done
#
trap "echo ' I modified the trap!'" SIGINT
#
count=1
while [ $count -le 5 ]; do
    echo "Second Loop #$count"
    sleep 1
    count=$((count + 1))
done
```
```shell
#!/bin/bash
# Removing a set trap
#
trap "echo ' Sorry... Ctrl-C is trapped.'" SIGINT
count=1
while [ $count -le 5 ]; do
    echo "Loop #$count"
    sleep 1
    count=$((count + 1))
done
#
# Remove the trap
trap -- SIGINT
echo "I just removed the trap"
#
count=1
while [ $count -le 5 ]; do
    echo "Second Loop #$count"
    sleep 1
    count=$((count + 1))
done
```
```shell
#!/bin/bash
# Test running in the background
#
count=1
while [ $count -le 10 ]; do
    sleep 1
    count=$((count + 1))
done
```
```shell
#!/bin/bash
# Test running in the background with output
#
echo "Start the test script"
count=1
while [ $count -le 5 ]; do
    echo "Loop #$count"
    sleep 5
    count=$((count + 1))
done
#
echo "Test script is complete"
```
```shell
#!/bin/bash
# Testing signal trapping
trap "echo 'Sorry! I have trapped Ctrl-C'" SIGINT
#
echo This is a test script
#
count=1
while [ $count -le 10 ]; do
    echo "Loop #$count"
    sleep 1
    count=$((count + 1))
done
#
echo "This is the end of the test script"
```
```shell
#!/bin/bash
# Test job control
#
echo "Script Process ID: $$"
#
count=1
while [ $count -le 10 ]; do
    echo "Loop #$count"
    sleep 10
    count=$((count + 1))
done
#
echo "End of script..."
```
```shell
#!/bin/bash
# Test using at command
#

echo "This script ran at $(date +%B%d,%T)"
echo
sleep 5
echo "This is the script's end..."
```
```shell
#!/bin/bash
# Test using at command
#

export PATH="$PATH:/home/centos/faris-hadziomerovic-week-3/"

echo "This script ran at $(date +%B%d,%T)" >./files/output.out
echo >>./files/output.out
sleep 5
echo "This is the script's end..." >>./files/output.out
```
