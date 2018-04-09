#!/bin/bash
# Get only the lowest priority NS record
DIR=`pwd`
for i in *vn 
	do 
		cd "$DIR"/$i; 
		rm $i.mailservers 2>/dev/null
		cat $i.domains | xargs -I {}  -P 512 -n 1 sh -c 'mailserver=`dig +short MX {} | sort -n | cut -f 2 -d " "`; echo {},$mailserver' >> $i.mailservers
		NUMSERVERS=`wc -l $i.mailservers  | cut -f 1 -d " "`
		echo "Zone $i: $NUMSERVERS Primary MX records"
	done
