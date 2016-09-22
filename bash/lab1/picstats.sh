#!/bin/bash

ls ~/workspace/cdzula96/bash/lab1/Pictures | wc -l

du ~/workspace/cdzula96/bash/lab1/Pictures/ -hs

ls -l ~/workspace/cdzula96/bash/lab1/Pictures/ | sort -g -r | grep "^-rw" | head -3
