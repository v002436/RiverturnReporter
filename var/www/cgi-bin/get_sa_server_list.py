#!/opt/opsware/agent/bin/python
# Search for servers by partial hostname.

import sys
import os
import subprocess
import time


sys.path.append("/opt/opsware/agent/pylibs")
from pytwist import *
from pytwist.com.opsware.search import Filter


filter = Filter()
filter.expression = 'device_hostname *=* "%s"' % ('')
# Create a TwistServer object.
ts = twistserver.TwistServer()
# Authenticate by passing an SA user name and password.
try:
  ts.authenticate("jgoodman","svvs1234")
except:
  print "Authentication failed."
  sys.exit(2)


# Get a reference to ServerService.
serverservice = ts.server.ServerService
# Perform the search, returning a tuple of references.

argsi = 'rm -rf /usr/AIR/tmp/server.txt /usr/AIR/tmp/sa_interfaces.txt /usr/AIR/tmp/all_sa_servers_by_id /usr/AIR/tmp/sa_installed_software.txt'
out = os.system(argsi)
if out < 1:
	print """File Cleanup Succeeded!"""
else:
	print """File Cleanup failed!"""

file = open('/usr/AIR/tmp/all_sa_servers_by_id', 'w')
servers = serverservice.findServerRefs(filter)
for server in servers:
	#print server.id
	print>>file, '%s' % (server.name)
	

#os.system('sleep 10')
#argsi = './import_data_blank.py server.txt'
#out = os.system(argsi)
#if out < 1:
#	print """Import of SA Server Data succeeded!"""
#else:
#	print """Import of SA Server Data failed!"""
#argsii = './import_data_blank.py sa_interfaces.txt'
#out = os.system(argsii)
#if out < 1:
#	print """Import of SA Interface Data succeeded!"""
#else:
#	print """Import of SA Interface Data failed!"""

