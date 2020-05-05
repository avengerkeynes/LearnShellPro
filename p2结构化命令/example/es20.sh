#!/bin/bash
#testing file dates
if [ es19.sh -nt es18.sh ]
then
        echo "The es19 file is newer than es18"
else
        echo "The es18 file is newer than es19"
fi

if [ es17.sh -ot es18.sh ]
then
        echo "The es17 file is older than es18"
else
        echo "The es18 file is older than es17"
fi
