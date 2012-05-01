#!/bin/zsh

# Simple Script to download Etherpads
#
# Author: verr <verr@2904.cc>
# Date: 2012-05-02
#
# TODO: make more generic (download PAD by given PAD-URL, ..)

ETHERPADHOST="http://ppoe.piratenpad.de"
WGETPARAMS="--no-check-certificate"

DEFAULTFORMAT="wiki"
DEFAULTFILENAME="pad.txt"

################################################################################

if [[ $# -ge 1 ]] && [[ $# -le 3 ]]; then
	if [[ $# -ge 1 ]]; then
		echo "PADID FOUND.. USING $1"
		PADID=$1
	else
		echo "THIS MAY NEVER HAPPEN! :O"
		exit 0
	fi

	if [[ $# -ge 2 ]]; then
		echo "TARGETFILE FOUND.. USING $2"
		TARGETFILE=$2
	else 
		echo "NO TARGETFILE FOUND.. USING DEFAULT ${DEFAULTFILENAME}"
		TARGETFILE=${DEFAULTFILENAME}
	fi
	
	if [[ $# -ge 3 ]]; then
		echo "PADFORMAT FOUND.. USING $3"
		PADFORMAT=$3
	else
		echo "NO PADFORMAT FOUND.. USING DEFAULT ${DEFAULTFORMAT}"
		PADFORMAT=${DEFAULTFORMAT}
	fi

	wget ${WGETPARAMS} -O ${TARGETFILE} \
	     ${ETHERPADHOST}/ep/pad/export/${PADID}/latest\?format\=${PADFORMAT}
	
else
	if [[ $# -lt 1 ]]; then
		echo "getPad.sh: Zu wenige Parameter!"
	else
		echo "getPad.sh: Zu viele Parameter!"
	fi
		echo ""
    echo "Syntax: getPad.sh <PAD-ID> [<TARGET-FILENAME> [<EXPORT-FORMAT>]]"
		echo ""
		echo "   PAD-ID:           as in ${ETHERPADHOST}/<PAD-ID>"
		echo "   TARGET-FILENAME:  file to save the pad (Default: ${DEFAULTFILENAME})"
		echo "   EXPORT-FORMAT:    wiki | txt | html | pdf | doc | odt (Default: ${DEFAULTFORMAT})"
		echo ""
		echo "Etherpad-Server is set to '${ETHERPADHOST}'"
fi