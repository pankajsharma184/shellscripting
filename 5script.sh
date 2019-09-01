#!/bin/bash

# command 'hash -r' delete all those customized path for existing shell builtins

# If we save any fine in /usr/local/bin/user it becomes a path and can be executed from anywhere.

# command 'basename' removes the path and shows the file name. For ex command 'basename /vagrant/proj1.sh' will give proj1.sh as the output. Use case would be to use it somewhere in fetching file name without the full path.

#Above revarsal would be command 'dirname' which strips off the file name and gives the path. For Ex: command 'dirname /vagrant/proj1.sh' gives /vagrant as output. 

#This script generates a random password for each user specified on the command line

# Display what the user typed on the command line

echo "You executed this command: ${0}"

#Display path of the file and the script file name that is executed. 

echo "You used $(dirname ${0}) as path and the $(basename ${0}) script"

# Tell how many arguments are passed in the command line when executing the script
#(Inside the script there are parameters and outside we pass argements)

echo "You supplied ${#} arg(s) on the command line"

# Make sure to pass atleast one argument to the script

if [[ ${#} -lt 1 ]]
then
 echo "Usage: ${0} needs one [USERNAME]"
 exit 1
fi

# Supply Multiple username and generate password

for USERNAME in ${@}
do
 PASSWORD=$(date +%s%N | sha256sum | head -c11)
 echo "${USERNAME}@op5.com : ${PASSWORD}"
done

