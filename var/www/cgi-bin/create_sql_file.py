#!/usr/bin/python
# Search for servers by partial hostname.


import sys
import os
import subprocess
import time

sql_file = ' @/usr/AIR/tmp/sql.sql'
sql_file2 = '/usr/AIR/tmp/sql.sql'
file = open(sql_file2, 'w')
print>>file, '%s \n %s \n %s \n %s \n %s \n %s \n %s \n %s \n %s' % ('set colsep ,','set pagesize 0','set trimspool on','set headsep off','set linesize 500','spool myfile.csv','select system_id,system_name from assets;','quit;','/')
file.close
