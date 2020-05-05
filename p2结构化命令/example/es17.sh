#!/bin/bash
#testing file execution
if [ -x es16.sh ]
then
        echo "You can run the script:"
        ./es16.sh
else
        echo "Sorry,you are unable to execute the script"
fi

