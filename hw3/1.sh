#!/bin/bash

#show the help
if [ "$#" != "1" ]; then
  echo "usage: $0 directory"
  exit 1
fi

#main process to check count
if [ -d "$1" ]; then
  normalCnt=0
  childCnt=0
  executableCnt=0

  for i in `ls $1`
  do
    if [ -f "$1/$i" ]; then
      normalCnt=$[$normalCnt+1]
    elif [ -d "$1/$i" ]; then
      childCnt=$[$childCnt+1]
    elif [ -x "$1/$i" ]; then
      executableCnt=$[$executableCnt+1]
    fi
  done
#show each count of the file
  echo "Normal File: $normalCnt"
  echo "Child File: $childCnt"
  echo "Executable File: $executableCnt"

else
#if the input variable isn't a directory
  echo "$0: $1 must be a exactly directory"
fi
