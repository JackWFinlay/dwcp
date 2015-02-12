#!/bin/bash

# Usage: ./dwcp.sh <in> <out>

# The directory to move files from.
in=$1

# The directory to move files to.
out=$2

# The current date.
now=$(date +%Y_%m_%d)

cd $in

# Check if current directory contains any .CSV files.
count=`ls -1 *.csv 2>/dev/null | wc -l`
if [ $count != 0 ]
then

	# For every .CSV file in the directory.
	for file in *.csv
	do
		# Generate file's new name.
		file_datestamped="${file%.*}_${now}"

  	cp $file $out/${file_datestamped}.csv

		# Create processed directory if it doesn't exist.
		if [ ! -d "$in/processed" ]; then
 			mkdir $in/processed
		fi

  	mv $file $in/processed/${file_datestamped}.csv

		# remove .log and .bad files present from older versions of the file.
		rm $out/$file_datestamped.log $out/$file_datestamped.bad

	done

else
	# If a directory contains no .CSV files, don't do anything.
	echo "Directory $in	does not contain any .csv files."

fi
