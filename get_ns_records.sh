#!/bin/bash
# Get only the lowest priority NS record
DIR=`pwd`
for i in *vn; 
	do 
		cd "$DIR"/$i; 
		rm $i.mailservers
		for j in `cat *domains`
			do
				LOWNS=`dig +short MX $j | sort -n | nawk '{print $2; exit}'` 
				echo "$j,$LOWNS" >> $i.mailservers
			done
		NUMSERVERS=`wc -l $i.mailservers  | cut -f 1 -d " "`
		echo "Zone $i: $NUMSERVERS Primary MX records"
	done
