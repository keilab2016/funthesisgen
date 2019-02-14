#!/bin/sh
TARGET=b???????.pdf
echo $TARGET
REST=`echo $TARGET | sed -e 's,\.pdf,,g'`

# extract first 3 pages
pdftocairo -f 1 -l 3 -pdf $TARGET $REST.ab.pdf
pdftotext -f 1 -l 3 -layout $TARGET $REST.txt

# extract first 2 pages if the above output contains "目次"
grep -q "目次" $REST.txt && (
pdftocairo -f 1 -l 2 -pdf $TARGET $REST.ab.pdf;
pdftotext -f 1 -l 2 -layout $TARGET $REST.txt;
)

# generate csv from abstract text (without kana author name)
awk -f gencsv.awk $REST.txt > $REST.csv

exit 0
