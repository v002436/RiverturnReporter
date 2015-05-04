#!/bin/sh

rm -rf /usr/AIR/tmp/exec_job_readiness.txt
for i in `ls /usr/AIR/tmp/sa_jobs/`
do
echo "/var/www/cgi-bin/process_sa_job.py $i" >> /usr/AIR/tmp/exec_job_readiness.txt
done

