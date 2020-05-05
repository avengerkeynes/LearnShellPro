#!/bin/bash
#mis-using string comparisons
val1=baseball
val2=hockey
if [ $var1 \>$val2 ]
then
	echo "$val1 is greater then $val2"
else
	echo "$varl1 is less then $val2"
fi