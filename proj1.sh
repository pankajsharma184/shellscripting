#!/bin/bash

#Run the Script only for super user privledge

if [[ "${UID}" -ne 0 ]]
then
 echo "Run the script with sudo or root"
 exit 1
fi


#Prompt to enter add username

read -p 'Enter a Username of your choice: ' USERNAME

#Prompt to enter full name

read -p 'Enter Full Name of the user: ' NAME

#Prompt to enter password

read -p 'Enter Password for the account: ' PASSWORD


#Create user with the username added

useradd -c "${NAME}" -m  ${USERNAME}

#If the account is not created display a proper message

if [[ "${?}" -ne 0 ]]
then
 echo "Username could not be created!"
 exit 1
fi
#Set Password and force password to change on first login
echo ${PASSWORD} | passwd --stdin ${USERNAME}
echo passwd -e ${USERNAME}

#Display all credentials on the screen
echo 
echo "Username: "
echo "${USERNAME}"
echo "Name :"
echo " ${NAME}"
echo "Password : "
echo "${PASSWORD}"








