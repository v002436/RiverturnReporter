#!/opt/opsware/agent/bin/python
# Search for servers by partial hostname.

import sys
import os
import subprocess
import time

time.sleep(1)

# Check for the command-line argument.
if len(sys.argv) < 2:
  print 'You must specify part a sql.txt file to import.'
  print "Example: " + sys.argv[0] + "   " + ".txt"
  sys.exit(2)
  
#cmd = 'echo test; cat /usr/AIR/tmp/asset.txt'
#os.system(cmd)
#print '/usr/bin/mysqlimport --debug[d:t:o,sqlout] -uroot -pR00tw0rd! --local AIR /usr/AIR/tmp/' + sys.argv[1]
#args = '/usr/bin/mysqlimport --debug[d:t:o,sqlout] -uroot -pR00tw0rd! --local AIR /usr/AIR/tmp/' + sys.argv[1]
#print 'mysql --login-path=local  --local-infile=1 <' + sys.argv[1]
#set = 'mysql_config_editor set --login-path=local --host=localhost --user=root --password'
#outt = os.system(set)
input = sys.argv[1]

#print args
args2 = 'sudo chmod 777 /tmp/*.txt'
out2 = os.system(args2)
args = 'mysql -uroot -pR00tw0rd! --local-infile=1 <' + input
out = os.system(args)
if out < 1:
	print '<tr><td align="left"><font face="Georgia" size="2" align="left">%s</td><td align="left"><font face="Georgia" size="2" align="left"><font face="Georgia" size="2">Complete</td></tr>' % (input)
else:
	print '<tr><td align="left"><font face="Georgia" size="2" align="left">%s</td><td align="left"><font face="Georgia" size="2" align="left">Failed with exit code %s</td></tr>' % (input,out)


	
