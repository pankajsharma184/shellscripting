#!/bin/bash

read -p 'Enter your username: ' USERNAME

read -p 'Enter your full name: ' NAME

read -p 'Enter password for the username: ' PASSWORD

useradd -c "${NAME}" -m ${USERNAME}

echo ${PASSWORD} | passwd --stdin ${USERNAME}

echo passwd -e ${USERNAME}






