#!/bin/bash

#Creating a directory Secure_vault
dir="secure_vault"
mkdir -p $HOME/"$dir"

#Creating files in the directory secure_vault
file1="keys.txt"
file2="secrets.txt"
file3="logs.txt"
echo "Store your encryption keys here" > $HOME/"$dir"/"$file1"
echo "Store your confidential data here" > $HOME/"$dir"/"$file2"
echo "Store your system logs here" > $HOME/"$dir"/"$file3"

#Prints a  success
echo -e  "You have successfully secured your data. \n Here are all present files: "

#List the files in a long format
ls -l $HOME/"$dir"
