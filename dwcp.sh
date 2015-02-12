#!/bin/bash

if [ $# -lt 2 ]; then
	echo "Usage: ./dwcp.sh [In] [Out]"
	echo "[In] : The input directory."
	echo "[Out] : The output directory."
	exit 1;
fi

# The directory to move files from.
in=$1

# The directory to move files to.
out=$2

# The current date.
now=$(date +%s)

cd $in

shopt -s nullglob

# For every .CSV file in the directory.
for file in *.csv
do
	shopt -u nullglob

	# Generate file's new name.
	file_datestamped="${file%.*}_${now}"
	file_no_ext="${file%.*}"

	cp $file $out/${file}

	# Create processed directory if it doesn't exist.
	if [ ! -d "$in/processed" ]; then
			mkdir $in/processed
	fi

	mv $file $in/processed/${file_datestamped}.csv

	# remove .log and .bad files present from older versions of the file.
	rm $out/${file_no_ext}.log $out/${file_no_ext}.bad

done
