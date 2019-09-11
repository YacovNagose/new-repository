#!/bin/bash

read -p "Please enter file and names and the path seperated by spaces: " files
read -p "Please enter path : " path
read -p "Please enter remote server : " destination

for file in $files;
do
  ((count++))
  eval scp "$file" vagrant@$destination:/$path/
done


echo "Total Bytes Copied"
echo "=================="

eval du -bcl $files | awk 'END { print $1 }'
