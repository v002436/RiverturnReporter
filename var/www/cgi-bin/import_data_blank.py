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
#print '/usr/bin/mysqlimport -uroot -pR00tw0rd! --local AIR /usr/AIR/tmp/' + sys.argv[1]
args = '/usr/bin/mysqlimport -uroot -pR00tw0rd! --local AIR /usr/AIR/tmp/' + sys.argv[1]

input = sys.argv[1]

#print args
args = 'mysql -uroot -pR00tw0rd! --local-infile=1 <' + input
out = os.system(args)
if out < 1:
	print '<p>Import of file %s succeeded!</p>' % (input)
	print 'EXITCODE', out, '\n'
else:
	print '<p>Import of file %s failed!</p>' % (input)
	print 'EXITCODE', out, '\n'