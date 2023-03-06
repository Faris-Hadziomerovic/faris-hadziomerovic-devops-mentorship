# Over the Wire Wargames - Level: Bandit

## Level 0

### Objective

The objective of this level is to log into the game using SSH and find the password for the next level - user ***bandit1***. The password for the next level is stored in a file called **readme** located in the home directory.
<br>
Given info and credential:
- Host: `bandit.labs.overthewire.org`
- Port: `2220`
- User: `bandit0`
- Password: `bandit0`

### Solution

Connecting via SSH can been accomplished on the Windows 10 Command Prompt with the following command:

```sh
$ ssh bandit0@bandit.labs.overthewire.org -p 2220
# the template for the first parameter is: [username]@[host]
# the -p parameter represents the port number
```

If connecting to the server is successful, the server will prompt us to enter the password for the user, which was previously given - `bandit0`.

![Let the game begin](images/Let%20the%20game%20begin.png)

After logging in as user ***bandit0***, we need to find the password for the next level by locating the file **readme**. By using the `ls` command we will find that the file is located in our current working directory:

```sh
$ ls
# ls lists files and directories in the given directory, if none is given then the current directory is assumed
```

We can use the `cat` command to read the contents of the file, like this:

```sh
$ cat readme
# cat outputs the file content to the console
```

To get to the next level we can either log in as another user without leaving the session by using `su -l` command and stating the username of the user which would be ***bandit1***: 

```sh
$ su -l bandit1
# su allows commands to be run with a substitute user and group ID
# -l or just - makes the shell a login shell so we can change the user that is logged in
```

The other approach requires us to quit the session via the `exit` command and repeat the `ssh` command how we started the game in the first place, but we have to use the appropriate user in the command:

```sh
$ exit
# this will bring us back to our original host

$ ssh bandit1@bandit.labs.overthewire.org -p 2220
# this will establish a connection to the server as user "bandit1" after entering the correct password
```

We will use the second approach and it will be assumed throughout these notes.

![Solution](images/level%200%20-%20complete.png)

## Level 1

### Objective

The goal of this and every subsequent level is to find the password for the next level. 
<br>
Given info:
- The password for the next level is stored in a file called "**-**"

![Level 1: start](images/level%201%20-%20start.png)

### Solution

First we will use `ls` to see files of interest. We will find the target file in the current working dir. But it's name is conflicting with command parameters so we have to state its path:

```sh
# option 1:
$ cat ./-
# option 1:
$ cat < - 
# < takes the contents of the file and redirects it as the input for the cat command
```

![Solution](images/level%201%20-%20complete.png)

## Level 2

### Objective

Given info:
- The password for the next level is stored in a file called "**spaces in this filename**"

![Level 2: start](images/level%202%20-%20start.png)

### Solution

By using `ls` we will find the file, but to read it's content we need to use quotation marks because the shell would otherwise iterpret each word as a parameter:

```sh
$ cat "spaces in this filename" 
```

![Solution](images/level%202%20-%20complete.png)

## Level 3

### Objective

Given info:
- The password for the next level is stored in a hidden file in the **inhere** directory.

![Level 3: start](images/level%203%20-%20start.png)

### Solution

By using `ls` we will find the **inhere** directory. To navigate into it we can use the `cd` command: 

```sh
$ cd inhere
# cd allows us to change the current working dir
```

To find the hidden file we need to pass an additional parameter to the `ls` command:

```sh
$ ls -a
# -a parameter will list all folders and directories
```

We found out the file's name and we can pass it to the `cat` command which will output the password:

```sh
$ cat .hidden
```

![Solution](images/level%203%20-%20complete.png)

## Level 4

### Objective

Given info:
- The password for the next level is stored in the only human-readable file in the **inhere** directory.

![Level 4: start](images/level%204%20-%20start.png)

### Solution

By changing dirs with `cd` and listing the files with `ls` we will find many filename starting with a dash (-). To not go through each one manually we will use the following `for` loop:

```sh
$ for file in *; 
> do 
> echo $file; 
> cat -- $file; 
> echo -e "\n"; 
> done

# do marks the start of the loop
# done marks the end
# echo is used to print the filename to the console for easier reading of where we found the password
# -e parameter enables echo to output newline characters like /n
# -- in cat is used because the dash in the filename interferes with command options and -- marks the end of options and the start of filenames
```

We found the password in -file07:

![Solution](images/level%204%20-%20complete.png)

## Level 5

### Objective

Given info:
- The password for the next level is stored somewhere in the **inhere** directory.
 The file has all of the following properties:
    - human-readable
    - 1033 bytes in size
    - not executable

![Level 5: start](images/level%205%20-%20start.png)

### Solution

First we will change dirs with `cd`. The with `ls` we can see that the current one contains 18 other directories and if we add the `-R` option to `ls` we can see their structure as well by going through them recursively: 

```sh
$ ls -Ra
# we can chain -R and -a like -Ra to also list hidden files
```

Now to find the file and output it's content we will use `find` and redirect it's output into `cat` as an argument so we will use the command substitution syntax `$(...)`:

```sh
$ cat $(find . ! -executable -size 1033c)
# find will search through the hierarchy tree from the given location, "." means the current working dir, and return all files or dirs that have the corresponding properties
# ! -executable searches for all files that are NOT (!) executable, that is that do not have the x in rwx permissions set to true
# -size returns all files that have the corresponding size, which is 1033c (the c tells the size that it's in bytes)
```

![Solution](images/level%205%20-%20complete.png)


## Level 6

### Objective

Given info:
- The password for the next level is stored somewhere server.
 The file has all of the following properties:
    - owned by user bandit7
    - owned by group bandit6
    - 33 bytes in size

![Level 6: start](images/level%206%20-%20start.png)

### Solution

We will change dirs and go "up" 2 levels so the find command can search more files: 

```sh
# option 1 (go up 2 levels):
$ cd ../..
# option 2 (go directly to root):
$ cd /
```

Now to find the file and output it to the console using the same tehnique as last level, just with different options and srguments:

```sh
$ cat $(find -group bandit6 -user bandit7 -size 33c -readable)
# -group and -user search for files that are owned by the passed group or user id respectively
```

![Solution](images/level%206%20-%20complete.png)

## Level 7

### Objective

Given info:
- The password for the next level is stored in the file **data.txt** next to the word *millionth*.

![Level 7: start](images/level%207%20-%20start.png)

### Solution

We can find the file **data.txt** in the current dir with `ls`. 
Now we have to search the file and find the line of text that contains the word *millionth* which we will pass as the patter to search for using the `grep` command: 

```sh
$ grep 'millionth' data.txt
# grep searches for patterns in each file
```

Now we have the password outputed next to the word *millionth*

![Solution](images/level%207%20-%20complete.png)


## Level 8

### Objective

Given info:
- The password for the next level is stored in the file **data.txt** and is the only line of text that occurs only once.

![Level 8: start](images/level%208%20-%20start.png)

### Solution

We will use the `uniq -u` command to single out the unique line, but it only works with sorted text files so we have to also use the `sort` command first: 

```sh
$ sort data.txt | uniq -u
# sort will sort the lines of text in alphabetical order
# the pipe operator will take the output of the sort command and redirect it into the uniq command
# uniq -u will return only unique lines of text that appear only once
```

![Solution](images/level%208%20-%20complete.png)

## Level 9

### Objective

Given info:
- The password for the next level is stored in the file **data.txt** in one of the few human-readable strings, preceded by several ‘=’ characters.

![Level 9: start](images/level%209%20-%20start.png)

### Solution

We will use the `grep` command with a regex pattern find the password and redirect the output to another `grep` command to only show the 32 character long password as was the case previously: 

```sh
$ grep -a -o -E '[=]{2,}.+[[:alnum:]]{32}' data.txt | grep -o -E '[[:alnum:]]+'
# the first grep will search for and find the given regex pattern and return it into the second grep that will single out the password
# -a is used so grep treats the file which is mostly in binary as a text file
# -o will only output the matching text and not the line where it's found
# -E will enable the use of extended regex characters like + and .
# [:alnum:] is a pattern for matching alpha-numeric characters like a-z A-Z and 0-9
```

![Solution](images/level%209%20-%20complete.png)

## Level 10

### Objective

Given info:
- The password for the next level is stored in the file **data.txt**, which contains base64 encoded data.

![Level 10: start](images/level%2010%20-%20start.png)

### Solution

We will use the `base64` command with `-d` option to decode the file and redirect the output to another `grep` command to only show the 32 character long password: 

```sh
$ base64 -d data.txt | grep -o -E '[[:alnum:]]{32}$'
# base64 -d will decode the file and give the output to grep to single out the password
```

![Solution](images/level%2010%20-%20complete.png)
