#!/bin/bash
: <<'END'
#This script demonstrate I/O redirection

#Redirect STDOUT to a file

FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}
cat ${FILE}

#Redirect STDIN to a program

read LINE < ${FILE}
echo
echo
echo "LINE contains : ${FILE}"

#Redirect STDOUT to a file, overwritting the file

head -n3 /etc/hostname > ${FILE}
echo
echo
echo "Contents of ${FILE}"
cat ${FILE}


#Redirect STDOUT to a file, Appending

echo  $(date +%s%N | sha256sum | head -c9) >> ${FILE}
echo
echo "Content of ${FILE}"
echo
cat ${FILE}

# 0 - STDIN
# 1 - STDOUT
# 2 - SDERR

#Redirect STDIN to a program, using FD 0
read LINE 0< ${FILE}
echo
echo "Redirect STDIN to a program using FD 0 Line Contains: ${LINE}"

#Redirect STDOUT to a file using FD 1, overwriting the file

head -n1 /etc/centos-release 1>> ${FILE}
echo
echo "Redirect STDOUT to a file using FD 1 Contents of ${FILE} : "
cat ${FILE}

#Redirect STDERR to a file using FD 2

ERR_FILE="/tmp/data.err"
head -n1 /etc/passwd 1>> ${FILE} /fakefile 2> ${ERR_FILE}

#Redirect both STDOUT and STDERR to the same file
echo "#################################################################"
head -n1 /etc/passwd /fakefile &> ${FILE} 
cat ${FILE}



#Redirect STDOUT and STDERR through a pipe
echo
head -n1 /etc/passwd /etc/centos-release  /fakefile/fake |& cat -n 

#Send output to STDERR
echo "This is STDERR!" >&2
END

echo "######################################################"
echo
head -n1 /etc/passwd 
echo
head -n1  /fakefile 
# ./7script.sh | cat -n (This command only display STDOUT)
# ./7script.sh |& cat -n (This command display both STDOUT and STDERR)



