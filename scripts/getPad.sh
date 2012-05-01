#!/bin/zsh

# Simple Script to download Etherpads
# Author: verr

ETHERPADHOST="http://ppoe.piratenpad.de"

if [[ $# -eq 3 ]]; then
    wget --no-check-certificate -O $2 \
          ${ETHERPADHOST}/ep/pad/export/$1/latest\?format\=$3
elif [[ $# -eq 2 ]]; then
    wget --no-check-certificate -O $2 \
          ${ETHERPADHOST}/ep/pad/export/$1/latest\?format\=wiki
elif [[ $# -eq 1 ]]; then
    wget --no-check-certificate -O pad.txt \
         ${ETHERPADHOST}/ep/pad/export/$1/latest\?format\=wiki
else
		echo "getPad.sh: Zu wenige Parameter!"
		echo ""
    echo "Syntax: getPad.sh <PAD-ID> [<TARGET-FILENAME> [<EXPORT-FORMAT>]]"
		echo ""
		echo "   PAD-ID:           as in ${ETHERPADHOST}/<PAD-ID>"
		echo "   TARGET-FILENAME:  file to save the pad (Default: pad.txt)"
		echo "   EXPORT-FORMAT:    wiki | txt | html | pdf | doc | odt"
		echo ""
		echo "Etherpad-Server is set to '${ETHERPADHOST}'"
fi