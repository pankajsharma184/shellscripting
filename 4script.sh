#!/bin/bash

#This script generates a list of random passwords

#A Random Number Password
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

#Three Random Number Together
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

#Use Current date/time as password

PASSWORD=$(date +%s)
echo "${PASSWORD}"

#Use Nano time as password

PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

#A Better password
PASSWORD=$(date +%s%N | sha256sum | head -c9)
echo "${PASSWORD}"

#Append a special character in the above password

SC=$(echo '!@#$%^&*' | fold -w1 | shuf | head -c1)

echo "${PASSWORD}${SC}"
