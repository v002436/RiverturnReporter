#!/bin/sh
cd sa_jobs
for i in `grep -i JOB_ *`
do
id=`echo $i | awk -F':' {' print $1 '}`
key=`echo $i | awk -F':' {' print $2 '}`
val=`echo $i | awk -F'::' {' print $2 '}`
echo "ID~~KEY~~VALUE"
echo "$id~~$key~~$val"
done

