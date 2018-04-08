#!/bin/bash
DIR=`pwd`
for i in *vn; 
	do 
		cd "$DIR"/$i; 
		grep NS *txt | cut -f 1 | cut -f 1 -d " " | sort | uniq >$i.domains; 
		NUMDOMAINS=`wc -l $i.domains  | cut -f 1 -d " "`
		echo "Zone $i: $NUMDOMAINS domains"
	done
