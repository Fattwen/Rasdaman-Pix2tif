# Rasdaman_Pix2tif
* Before importing the image in pix format into the Rasdaman database, it needs to be converted into an importable format (such as tif ..). Here is a batch conversion method using gdal_translate.

* 在將格式為pix的影像匯入Rasdaman資料庫之前，需要轉換成可匯入的格式(tif..之類的)，這裡提供了一個使用gdal_translate批次轉換的方法。

* 使用方式:  
1.將要轉換的影像放在同一目錄。  
2.打開before.txt 將要轉換的影像檔案名稱寫進去。
範例:
```
20170118_97.pix
20170218_97.pix
20170312_97.pix
```
3.打開after.txt 將轉換後的檔案名稱寫進去。  
```
BNPQDET_2017-01-18.tif
BNPQDET_2017-02-18.tif
MNPQDET_2017-03-12.tif
```
4.更改script檔案裡的../路徑改為對應的位置。 
```console
file=../before.txt   
export=../after.txt  
放txt的路徑  
input_file=../$input_data 轉換前檔案的路徑  
output_file=../$output_data 轉換後輸出的路徑  
``` 
5.
```bash
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
```




