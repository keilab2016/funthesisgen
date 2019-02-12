#!/bin/sh
TARGET=b???????.pdf
echo $TARGET
REST=`echo $TARGET | sed -e 's,\.pdf,,g'`

# extract first 3 pages
pdftocairo -f 1 -l 3 -pdf $TARGET $REST.ab.pdf
pdftotext -f 1 -l 3 -cfg xpdfrc -enc UTF-8 $TARGET $REST.txt

# extract first 2 pages if the above output contains "目次"
grep -q "目次" $REST.txt && (
pdftocairo -f 1 -l 2 -pdf $TARGET $REST.ab.pdf;
pdftotext -f 1 -l 2 -cfg xpdfrc -enc UTF-8 $TARGET $REST.txt;
)

# generate csv from abstract text (without kana author name)
awk -e 'BEGIN{count=0}{\
count++;\
switch(count){\
case 2:title=$0;break;\
case 3:author=$0;break;\
case 4:dep=$1;id=$2;teacher=$4;break;\
case 6:etitle=$0;break;\
case 8:eauthor=$0;break;\
case 9:gsub(/.*Advisor: /,"",$0);eteacher=$0;break;\
}}\
END{printf("%s,%s,%s,%s,%s,%s,%s,%s",id,author,eauthor,kauthor,teacher,eteacher,title,etitle);}' $REST.txt

exit 0
