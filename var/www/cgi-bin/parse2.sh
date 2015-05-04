#!/bin/sh

cat /usr/AIR/tmp/all_jobs.txt | sed 's/,/\n/g' | awk -F'Ref:' {' print $2 '} | awk -F')' {' print "sudo /var/www/cgi-bin/get_sa_jobs3.py "$1" > /usr/AIR/tmp/sa_jobs/"$1 '}
