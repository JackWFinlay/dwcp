#!/bin/bash

in=$1
out=$2
now=$(date +%Y_%m_%d)

cd in

# if ls ${in}/*.txt &>/dev/null && ls ${in}/*.csv &>/dev/null
# then 
	for file in *.csv
	do
		file_datestamped="${file%.*}_${now}"
	
  		cp $file $out/${file_datestamped}.csv

		if [ ! -d "$in/processed" ]; then
 			mkdir $in/processed 
		fi

  		mv $file $in/processed/${file_datestamped}.csv

		rm $file_datestamped.log $file_datestamped.bad

	done
# fi
