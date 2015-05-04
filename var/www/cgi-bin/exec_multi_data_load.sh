#!/bin/sh

nohup sudo /var/www/cgi-bin/get_sa_data3.pl > /usr/AIR/tmp/get_multiple_sa_data.log 2<&1 &
