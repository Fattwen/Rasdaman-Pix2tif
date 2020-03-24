# Rasdaman_Pix2tif
* Before importing the image in pix format into the Rasdaman database, it needs to be converted into an importable format (such as tif ..). Here is a batch conversion method using gdal_translate.

* 在將格式為pix的影像匯入Rasdaman database之前，需要轉換成可匯入的格式(tif..之類的)，這裡提供了一個使用gdal_translate批次轉換的方法。

* 使用方式:  

1.將要轉換的影像放在同一目錄。  
2.在目錄建立before.txt 將要轉換的影像檔案名稱寫進去。  
範例:
```
20170118_97.pix
20170218_97.pix
20170312_97.pix
```
3.在目錄建立after.txt 將轉換後的檔案名稱寫進去。  
```
BNPQDET_2017-01-18.tif
BNPQDET_2017-02-18.tif
MNPQDET_2017-03-12.tif
```
4.更改script檔案裡的../路徑改為對應的位置。 
```bash
#放txt的路徑  
file=../before.txt   
export=../after.txt  
--------------------------------------------
input_file=../$input_data #轉換前檔案的路徑  
output_file=../$output_data #轉換後輸出的路徑  
``` 
5.在terminal裡使用以下指令
```console
user@linux:~$ bash pix2tif.sh
```
或
```console
user@linux:~$ sh pix2tif.sh
```
使用前需安裝gdal
```console
#ubuntu安裝
user@linux:~$ sudo apt-get update
user@linux:~$ sudo apt-get install libgdal-dev
user@linux:~$ sudo apt-get install gdal-bin
```
