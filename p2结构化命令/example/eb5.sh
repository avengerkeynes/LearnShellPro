#!/bin/bash
#reading values from a file
file="tt"
for state in $(cat $file)
do
	echo "Visit beautiful $state"
done