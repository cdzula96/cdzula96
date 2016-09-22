#!/bin/bash

#commands made before class
#ls ~/workspace/cdzula96/bash/lab1/Pictures | wc -l

#du ~/workspace/cdzula96/bash/lab1/Pictures/ -hs

#ls -l ~/workspace/cdzula96/bash/lab1/Pictures/ | sort -g -r | grep "^-rw" | head -3

#commands done with Dennis in class
echo -n "In the ~/workspace/cdzula96/bash/lab1/Pictures directory, the number of files is "
find ~/workspace/cdzula96/bash/lab1/Pictures -type f | wc -l

echo -n "Those files use "
du -h ~/workspace/cdzula96/bash/lab1/Pictures | awk '{print$1}'

echo "The three largest files are:"
echo "----------"
du -h ~/workspace/cdzula96/bash/lab1/Pictures/* | sort -h | tail -3