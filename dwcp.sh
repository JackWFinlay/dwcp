#!/bin/bash

in=$1
out=$2
now=$(date +%Y_%m_%d)

cd $in

count=`ls -1 *.csv 2>/dev/null | wc -l`
if [ $count != 0 ]
then 
	for file in *.csv
	do
		file_datestamped="${file%.*}_${now}"
	
  		cp $file $out/${file_datestamped}.csv

		if [ ! -d "$in/processed" ]; then
 			mkdir $in/processed 
		fi

  		mv $file $in/processed/${file_datestamped}.csv

		rm $out/$file_datestamped.log $out/$file_datestamped.bad

	done
else
	echo "$in does not contain any .csv files"

fi
