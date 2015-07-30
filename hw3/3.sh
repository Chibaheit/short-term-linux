#!/bin/bash
#read the string
read -p "input string: " s
# use the string operate to comfirm the prerequisite
if [ `echo ${s//[!a-zA-Z]/} | rev` = `echo ${s//[!a-zA-Z]/}` ]; then
  echo "it's palindrome!"
else
  echo "it isn't palindrome!"
fi
