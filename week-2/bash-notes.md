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

![Alt text](images/level%200%20-%20complete.png)

## Level 1

### Objective

The goal of this and every subsequent level is to find the password for the next level. 
<br>
Given info:
- The password for the next level is stored in a file called "**-**"

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
