#!/bin/bash

echo '================= start  process ================='
file=../before.txt
export=../after.txt
process_count=0
lns=`wc -l $file`
lines=`expr "$lns" : '\([0-9]*\)'`
process_limit=100
count=0
time=1

while [ "$process_count" -lt "$process_limit" ] && [ "$count" -lt "$lines" ]
do	
	echo ==================================================	
	input_data=$(head -n $time $file | tail -n 1)
	echo 'input : ' $input_data
	output_data=$(head -n $time $export | tail -n 1)
	echo 'output : ' $output_data
	input_file=../$input_data
	output_file=../$output_data

	count=$(($count+1))
	time=$(($time+1))
	echo ================ Process Progress ================
	file_exists=1
	test -f "input_file" && file_exists=1

	if [ "$file_exists" = 1  ]
	then
		process_count=$(($process_count+1))
		echo "$count.$input_data"
		gdal_translate -of GTiff $input_file $output_file
	else
		echo "$count.$input_data not found";
	fi
done

