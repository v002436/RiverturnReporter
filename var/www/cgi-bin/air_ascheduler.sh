#!/bin/sh

pid = `ps -ef | grep get_sa_server_list.py | grep -v grep`

if [ $pid ];then 
	echo "SA Batch Loader is running with pid $pid"
else
	echo "SA Batch Loader is not running, starting now"
	nohup ./get_sa_server_list.py &
	if [ $? -eq 0 ];then
		echo "SA Batch process has started"
	else
		echo "SA Batch process did not start"
	fi
fi
