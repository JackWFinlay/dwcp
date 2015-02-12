#!/bin/bash

in=$1
out=$2
now=(date +"%Y_%m_%d")

for file in $in.csv
do

  file_datestamped="${file%.*}$now"

  sudo cp $file $out/$file_datestamped.csv
  sudo mv $file $in/processed/$out/$file_datestamped.csv

  sudo rm $file_datestamped.log $file_datestamped.bad

done
