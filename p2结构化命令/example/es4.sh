#!/bin/bash
#testing the els section
testuser=NoSuchUser
if grep $testuser /etc/passwd
then
	echo "The bash fiels for user $testuser are:"
	ls -a /home/$testuser/.b*
	echo
else
	echo "The user $testuser does not exist on this system."
	echo
fi