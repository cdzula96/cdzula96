#!/bin/bash

#first command made 
#find /usr -ls

#command done in class

echo "SetUID files"
echo "----------"

find /usr -type f -executable -perm -4000 -ls

cat <<EOF

SetGID files
----------
EOF

find /usr -type f -executable -perm -2000 -ls