#/bin/bash

#Make sure the script is executed with root privledges. If Other user No attempt to create user and return exit code 1

if [[ ${UID} -ne 0 ]]
then
 echo "You Need Root permission to create user."
 exit 1
fi

#Provides a usage statement much like you would find in a man page if the user does not supply an account name on the command line and returns an exit status of 1.

if [[ ${#} -eq 0 ]]
then
 echo "Forgot to supply arguemtn here. You need to supply an Username as argument. Refer to Man page"
 exit 1
fi


#Uses the first argument provided on the command line as the username for the account. Any remaining arguments on the command line will be treated as the comment for the account.

USERNAME="${1}"
shift
COMMENT="${@}"

#Automatically generates a password for the new account.

PASSWORD=$(date +%s%N | sha256sum | head -c11)

#Informs the user if the account was not able to be created for some reason. If the account is not created, the script is to return an exit status of 1.

useradd -c "${COMMENT}" -m ${USERNAME}

if [[ "${?}" -ne 0 ]]
then
 echo "UserAccount was not created"
 exit 1
fi

echo ${PASSWORD} | passwd --stdin ${USERNAME}

if [[ "${?}" -ne 0 ]]
then
 echo "PASSWORD for Useraccount was not created"
 exit 1
fi

passwd -e ${USERNAME}


#Displays the username, password, and host where the account was created. This way the help desk staff can copy the output of the script in order to easily deliver the information to the new account holder.


echo "USERNAME : ${USERNAME}"
echo "PASSWORD : ${PASSWORD}"
echo "HOST     : ${HOSTNAME}"



