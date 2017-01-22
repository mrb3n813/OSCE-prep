#!/bin/bash

printf "\n"
echo "## Simple bash script to convert string copied from Olly to hex ## "
printf "\n"

read -r -p "Paste in binary copy string: " bcopy
printf "\n"

echo  $bcopy | sed -r 's/[^ ]+/\\x&/g' | tr -d ' ' |  sed -e "s/.\{20\}/&\n/g" |  sed 's/\\x50/\n&/g' | sed 's/\(.*\)/"\1"/g'
