#!/bin/bash

#Display UID and User for the script
USERNAME=$(id -un)
echo "UID is ${UID} and corresponding Username is ${USERNAME}"
#Display if the user is vagrant or not

#Only display if the UID is not 1000
UID_TEST='1000'
if [[ "${UID}" -ne "${UID_TEST}" ]]
then
 echo "Your UID does not match ${UID_TEST}"
 exit 1
fi

VAR=$(id -unx)

#Test if the previous command succeed

if [[ "${?}" -eq 0 ]]
then
 echo "Previous command does not executed properly"
else
 echo "It Executed Properly"
fi

#Test String

echo "${USERNAME}"

if [[ "${USERNAME}" = "vagrant" ]]
then
 echo "It Matches!!"
else
 echo "doesnt match!"
fi





