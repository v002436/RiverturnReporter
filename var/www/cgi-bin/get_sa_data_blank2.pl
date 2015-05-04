#!/opt/opsware/agent/bin/python
# Search for servers by partial hostname.

import sys
import os
import subprocess
import time
import datetime

now = datetime.datetime.now()

sys.path.append("/opt/opsware/agent/pylibs")
#sys.path.append("/opt/opsware/pylibs")
from pytwist import *
from pytwist.com.opsware.search import Filter

# Check for the command-line argument.
if len(sys.argv) < 2:
  print 'ERROR: You must specify part of the hostname as the search target.'
  print "Example: " + sys.argv[0] + "   " + "opsware.com"
  sys.exit(2)

# Construct a search filter. 
filter = Filter()
filter.expression = 'ServerVO.name EQUAL_TO "%s"' % (sys.argv[1])
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
PhysicalDiskservice = ts.storage.PhysicalDiskService
interfacecomponent = ts.server.InterfaceComponent
# Perform the search, returning a tuple of references.
servers = serverservice.findServerRefs(filter)
for s in servers:
	print 'Servers:', s
  
if len(servers) < 1:
  print sys.argv[1], "ERROR: No matching servers found"
  sys.exit(3)

if len(servers) > 1:
  print sys.argv[1], "ERROR: Too many matching servers found"
  sys.exit(3)

# For each server found, get the server's value object (VO) and
# print some of the VO's attributes.
for server in servers:
	vo = serverservice.getServerVO(server)
	filees = '/usr/AIR/tmp/sa_multi/' + vo.mid
	filee = '/usr/AIR/tmp/sa_multi/' + vo.mid + '/server.txt'
	if not os.path.exists(filees):
		os.makedirs(filees)
	file = open(filee, 'a')
	#print>>file, '%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s' %  (vo.mid,'000000', vo.name, vo.osVersion, vo.osSPVersion, vo.opswLifecycle, vo.state, vo.use, vo.agentVersion, vo.stage, vo.defaultGw, vo.hypervisor, vo.codeset, time.strftime("%Y-%m-%d:%H:%M:%S", time.gmtime(vo.discoveredDate)), vo.loopbackIP, vo.managementIP, vo.netBIOSName, vo.description, vo.serialNumber, vo.manufacturer, vo.model)  
	print>>file, '%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s' %  (vo.mid,'000000', vo.name, vo.osVersion, vo.osSPVersion, vo.opswLifecycle, vo.state, vo.use, vo.agentVersion, vo.stage, vo.defaultGw, vo.hypervisor, vo.codeset, time.strftime("%Y-%m-%d:%H:%M:%S", time.gmtime(vo.discoveredDate)), vo.loopbackIP, vo.managementIP, vo.netBIOSName, vo.description, vo.serialNumber, vo.manufacturer, vo.model, now.strftime("%Y-%m-%d:%H:%M:%S"), now.strftime("%Y-%m-%d:%H:%M:%S"), vo.facility, vo.customer)
file.close
vi = serverservice.getServerHardwareVO(server)
for s in vi.interfaces:
	fileee = '/usr/AIR/tmp/sa_multi/' + vo.mid + '/sa_interfaces.txt'
	file2 = open(fileee, 'a')
	#print>>file2, '%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s' % (vo.mid, s.type, s.descriptor, s.slot, s.enabled, s.localHostName, s.hardwareAddress, s.ipAddress, s.collisions, s.configuredDuplex, s.configuredSpeed, s.netmask, s.adminEnabled, s.connectedTo, s.duplex, s.primaryInterface, s.speed, s.useDHCP, s.id, s.vendor)
	print>>file2, '%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s' % (vo.mid, s.type, s.descriptor, s.slot, s.enabled, s.localHostName, s.hardwareAddress, s.ipAddress, s.collisions, s.configuredDuplex, s.configuredSpeed, s.netmask, s.adminEnabled, s.connectedTo, s.duplex, s.primaryInterface, s.speed, s.useDHCP, s.id, s.vendor, now.strftime("%Y-%m-%d:%H:%M:%S"), now.strftime("%Y-%m-%d:%H:%M:%S"))
if vi.interfaces:
	file2.close
for server in servers:
	fileeee = '/usr/AIR/tmp/sa_multi/' + vo.mid + '/sa_installed_software.txt'
	file3 = open(fileeee, 'a')
	vo = serverservice.getInstalledSoftware(server)
	for v in vo:
		if v.version is None:
			ver = v.version
		else:
			ver = v.version.replace('\\','\\\\')
		#print>>file3, '%s	%s	%s	%s	%s	%s	%s	%s	%s	%s' % (int(server.id),v.packageName,v.name,v.type,v.displayName,v.version,v.status,time.strftime("%Y-%m-%d:%H:%M:%S", time.gmtime(v.beginDate)),v.uninstallable,v.release)
		print>>file3, '%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s' % (int(server.id),v.packageName,v.name,v.type,v.displayName,ver,v.status,time.strftime("%Y-%m-%d:%H:%M:%S", time.gmtime(v.beginDate)),v.uninstallable,v.release)
file3.close
