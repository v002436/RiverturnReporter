#!/bin/sh

rm -rf /usr/AIR/tmp/exec_sa_jobs.txt
for i in `cat /usr/AIR/tmp/all_jobs.txt`
do 
id=`echo $i | awk -F',' {' print $1 '} | grep JobRef | awk -F':' {' print $2 '} | sed 's/)//g'`
if [ "$id" ];then
#echo "~$id~"
echo "sudo /var/www/cgi-bin/get_sa_jobs3.py $id > /usr/AIR/tmp/sa_jobs/$id" >> /usr/AIR/tmp/exec_sa_jobs.txt
fi
done
