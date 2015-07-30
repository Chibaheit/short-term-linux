#!/bin/bash
#initialization, and in the test, I use 5 for n to test
n=100
max=0
min=0
ave=0
for i in `seq 1 $n`
do
  read num[$i]
  #if it is num[1], let max = min = num[1]
  if [ $i -lt 2 ]; then
    max=$[num[$i]]
    min=$[num[$i]]
  #In other case, comparing and assignment
  elif [ $[num[$i]] -gt $max ]; then
    max=$[num[$i]]
  elif [ $[num[$i]] -lt $min ]; then
    min=$[num[$i]]
  fi
    ave=$[$ave+$[num[$i]]/$n]
done
#show the special value
echo "max value is $max"
echo "min value is $min"
echo "average value is $ave"
#sort the array
for i in `seq 1 $n`
do
  for j in `seq 1 $i`
  do
    if [ $[num[$i]] -lt $[num[$j]] ]; then
      tmp=$[num[$i]]
      num[$i]=$[num[$j]]
      num[$j]=$tmp
    fi
  done
done
#show the sorted array
echo "sorted result:"
for i in `seq 1 $n`
do
  if [ $i -lt $n ]; then
    echo -n "$[num[$i]]"
  else
    echo "$[num[$i]]"
  fi
done
