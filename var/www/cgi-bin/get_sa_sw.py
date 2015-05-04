#!/opt/opsware/agent/bin/python
# Search for servers by partial hostname.

import sys
import os
import subprocess
import time

sys.path.append("/opt/opsware/agent/pylibs")
#sys.path.append("/opt/opsware/pylibs")
from pytwist import *
from pytwist.com.opsware.search import Filter

# Check for the command-line argument.
if len(sys.argv) < 2:
  print 'You must specify part of the hostname as the search target.'
  print "Example: " + sys.argv[0] + "   " + "opsware.com"
  sys.exit(2)
#print 'Host:', sys.argv[1]
# Construct a search filter. 
filter = Filter()
filter.expression = 'device_hostname *=* "%s"' % (sys.argv[1])

# Create the TwistServerobject.
ts = twistserver.TwistServer()
# Authenticate by passing an SA user name and password.
try:
  ts.authenticate("jgoodman","svvs1234")
except:
  print "Authentication failed."
  sys.exit(2)

# Get a reference to ServerService.
serverservice = ts.server.ServerService
PhysicalDiskservice = ts.storage.PhysicalDiskService
interfacecomponent = ts.server.InterfaceComponent
# Perform the search, returning a tuple of references.
servers = serverservice.findServerRefs(filter)
  
if len(servers) < 1:
  print "No matching servers found"
  sys.exit(3)

if len(servers) > 1:
  print "Too many matching servers found"
  sys.exit(3)

# For each server found, get the server's value object (VO) and
# print some of the VO's attributesa.
file = open('/usr/AIR/tmp/sa_installed_software.txt', 'w')
#<tr><th>Opsware ID</th><th>Host Name</th><th>OS Version</th><th>Serial Number</th><th>Manufacturer</th><th>Model</th>"""
#print 'packageName	name	type	displayName	version	status	beginDate	uninstallable	release'
for server in servers:
   #print server.id
   vo = serverservice.getInstalledSoftware(server)
   for v in vo:
		#print '%s	%s	%s	%s	%s	%s	%s	%s	%s' % (v.packageName,v.name,v.type,v.displayName,v.version,v.status,time.strftime("%Y-%m-%d:%H:%M:%S", time.gmtime(v.beginDate)),v.uninstallable,v.release)
   #print '<tr><td>',vo.mid,'</td><td>', vo.name,'</td><td>', vo.osVersion,'</td><td>', vo.serialNumber,'</td><td>', vo.manufacturer,'</td><td>', vo.model,'</td></tr>'
		print>>file, '%s	%s	%s	%s	%s	%s	%s	%s	%s	%s' % (int(server.id),v.packageName,v.name,v.type,v.displayName,v.version,v.status,time.strftime("%Y-%m-%d:%H:%M:%S", time.gmtime(v.beginDate)),v.uninstallable,v.release)
   #print>>file, '%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s' % (vo.mid,'000000', vo.name, vo.osVersion, vo.osSPVersion, vo.opswLifecycle, vo.state, vo.use, vo.agentVersion, vo.stage, vo.defaultGw, vo.hypervisor, vo.codeset, time.strftime("%Y-%m-%d:%H:%M:%S", time.gmtime(vo.discoveredDate)), vo.loopbackIP, vo.managementIP, vo.netBIOSName, vo.description, vo.serialNumber, vo.manufacturer, vo.model)   

file.close

#file2 = open('/usr/AIR/tmp/sa_interfaces.txt', 'w')
#vi = serverservice.getServerHardwareVO(server)
		
#for s in vi.interfaces:
#	print '<tr><td>',vo.mid,'</td>', '<td>',s.type,'</td>', '<td>', s.slot, '</td>', '<td>', s.enabled, '</td>', '<td>', s.ipAddress, '</td>'
#	#print vo.mid, s.type, s.descriptor, s.slot, s.enabled, s.localHostName, s.hardwareAddress, s.ipAddress, s.collisions, s.configuredDuplex, s.configuredSpeed, s.netmask, s.adminEnabled, s.connectedTo, s.duplex, s.primaryInterface, s.speed, s.useDHCP, s.id, s.vendor
#	#print>>file2, '%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s' % (vo.mid, s.type, s.descriptor, s.slot, s.enabled, s.localHostName, s.hardwareAddress, s.ipAddress, s.collisions, s.configuredDuplex, s.configuredSpeed, s.netmask, s.adminEnabled, s.connectedTo, s.duplex, s.primaryInterface, s.speed, s.useDHCP, s.id, s.vendor)
#file2.close
