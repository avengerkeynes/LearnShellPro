#!/bin/bash
#using the until c command
var1=100
until echo $var1
			[ $var1 -eq 0 ]
do
	echo Inside the loop:$var1
	var1=$[ $var1 -25 ]
done