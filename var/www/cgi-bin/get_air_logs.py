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
file = open('/usr/AIR/tmp/server.txt', 'w')
print """
<html>

<head>	
<meta charset="utf-8">
	<title>AIR - Asset Inventory Retrieval</title>

	<link rel="stylesheet" media="screen" href="/css/214.css?v=8may2013">
	<link rel="stylesheet" type="text/css" href="http://www.w3schools.com/stdtheme.css">
	<meta name="description" content="A demonstration of what can be accomplished with AIR.">

  <meta HTTP-EQUIV="Pragma" CONTENT="public">
  <meta HTTP-EQUIV="Cache-Control" CONTENT="max-age=0">
 
  <link href="/css/openreports.css" rel="stylesheet" type="text/css">
  <!-- YUI Dependencies -->
  <script type="text/javascript" src="/js/yui/yahoo-min.js"></script>
  <script type="text/javascript" src="/js/yui/dom-min.js"></script>
  <script type="text/javascript" src="/js/yui/event-min.js"></script>
  <script type="text/javascript" src="/js/yui/animation-min.js"></script>
  <script type="text/javascript" src="/js/yui/dragdrop-min.js"></script>
  <script type="text/javascript" src="/js/yui/connection-min.js"></script>
  <script type="text/javascript" src="/js/yui/container-min.js"></script>
  <script type="text/javascript" src="/js/yui/element-beta-min.js"></script>
  <script type="text/javascript" src="/js/yui/tabview-min.js"></script>
  <script type="text/javascript" src="/js/yui/button-beta-min.js"></script> 
  <link rel="stylesheet" type="text/css" href="/css/yui/container.css" />
  <link rel="stylesheet" type="text/css" href="/css/yui/tabview.css">
  <link rel="stylesheet" type="text/css" href="/css/yui/button.css">    
  <!-- End YUI Dependencies -->
  <script type="text/javascript" src="/js/highlight.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script> 
$(function(){
  $("#header").load("/header.shtml"); 
  $("#footer").load("/footer.shtml"); 
});
</script> 

<body class="yui-skin-sam">


	<section class="intro" id="zen-intro">
		<header role="banner">
			<h1>AIR - Asset Inventory Retrieval</h1>
		</header>
	</section>
</head>

<div id="header"></div>

	<section class="intro" id="zen-intro">

		<div class="summary" id="zen-summary" role="article">
			<p> AIR enables you to import a single server into the database from SA. The information below is a summary of the details from SA. If the information below is correct, scroll to the bottom of the page and click the link to import the data into AIR.</p>
		</div>
	</section>
<hr>

<style>
.htmltut_table, .htmltut_table th, .htmltut_table td
{
border:1px solid black;
}
.htmltut_table1, .htmltut_table1 th, .htmltut_table1 td
{
border:1px solid black;
}
.htmltut_table1 th, .htmltut_table1 td
{
padding:5px;
}
</style>
	<section class="intro" id="zen-intro" align="center">

		<div class="summary" id="zen-summary" role="article">"""
print """<table class="reference" style="width:60%">
<tr><th><font face="Georgia" size="2">Opsware_ID</font></th><th><font face="Georgia" size="2">Host Name</font></th><th><font face="Georgia" size="2">OS Version</font></th><th><font face="Georgia" size="2">Serial Number</font></th><th><font face="Georgia" size="2">Manufacturer</font></th><th><font face="Georgia" size="2">Model</font></th>"""
for server in servers:
   vo = serverservice.getServerVO(server)
   print '<tr><td><font face="Georgia" size="2">',vo.mid,'</font></td><td><font face="Georgia" size="2">', vo.name,'</font></td><td><font face="Georgia" size="2">', vo.osVersion,'</font></td><td><font face="Georgia" size="2">', vo.serialNumber,'</font></td><td><font face="Georgia" size="2">', vo.manufacturer,'</font></td><td><font face="Georgia" size="2">', vo.model,'</font></td></tr>'
   print>>file, '%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s' %  (vo.mid,'000000', vo.name, vo.osVersion, vo.osSPVersion, vo.opswLifecycle, vo.state, vo.use, vo.agentVersion, vo.stage, vo.defaultGw, vo.hypervisor, vo.codeset, time.strftime("%Y-%m-%d:%H:%M:%S", time.gmtime(vo.discoveredDate)), vo.loopbackIP, vo.managementIP, vo.netBIOSName, vo.description, vo.serialNumber, vo.manufacturer, vo.model, now.strftime("%Y-%m-%d:%H:%M:%S"), now.strftime("%Y-%m-%d:%H:%M:%S"), vo.facility, vo.customer)
print '</table> <hr>'   
file.close

file2 = open('/usr/AIR/tmp/sa_interfaces.txt', 'w')
vi = serverservice.getServerHardwareVO(server)
print """<table class="reference" style="width:60%">
		<tr><th><font face="Georgia" size="2">Opsware ID</th><th><font face="Georgia" size="2">NIC Type</th><th><font face="Georgia" size="2">NIC Slot</th><th><font face="Georgia" size="2">Enabled</th><th><font face="Georgia" size="2">IP Address</th>"""	
for s in vi.interfaces:
	print '<tr><td><font face="Georgia" size="2">',vo.mid,'</td>', '<td><font face="Georgia" size="2">',s.type,'</td>', '<td><font face="Georgia" size="2">', s.slot, '</td>', '<td><font face="Georgia" size="2">', s.enabled, '</td>', '<td><font face="Georgia" size="2">', s.ipAddress, '</td>'
	#print vo.mid, s.type, s.descriptor, s.slot, s.enabled, s.localHostName, s.hardwareAddress, s.ipAddress, s.collisions, s.configuredDuplex, s.configuredSpeed, s.netmask, s.adminEnabled, s.connectedTo, s.duplex, s.primaryInterface, s.speed, s.useDHCP, s.id, s.vendor
	print>>file2, '%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s' % (vo.mid, s.type, s.descriptor, s.slot, s.enabled, s.localHostName, s.hardwareAddress, s.ipAddress, s.collisions, s.configuredDuplex, s.configuredSpeed, s.netmask, s.adminEnabled, s.connectedTo, s.duplex, s.primaryInterface, s.speed, s.useDHCP, s.id, s.vendor, now.strftime("%Y-%m-%d:%H:%M:%S"), now.strftime("%Y-%m-%d:%H:%M:%S"))
file2.close
print '</table> <hr>' 

file3 = open('/usr/AIR/tmp/sa_installed_software.txt', 'w')
#<tr><th>Opsware ID</th><th>Host Name</th><th>OS Version</th><th>Serial Number</th><th>Manufacturer</th><th>Model</th>"""
print """<table class="reference" style="width:60%">
<tr><th><font face="Georgia" size="2">packageName</th><th><font face="Georgia" size="2">name</th><th><font face="Georgia" size="2">type</th><th><font face="Georgia" size="2">version</th><th><font face="Georgia" size="2">status</th></tr>"""
for server in servers:
   #print server.id
   vo = serverservice.getInstalledSoftware(server)
   for v in vo:
		print '<tr><td><font face="Georgia" size="2">%s</td><td><font face="Georgia" size="2">%s</td><td><font face="Georgia" size="2">%s</td><td><font face="Georgia" size="2">%s</td><td><font face="Georgia" size="2">%s</td><td><font face="Georgia" size="2">%s</td></tr>' % (v.packageName,v.name,v.type,v.displayName,v.version,v.status)
   #print '<tr><td><font face="Georgia" size="2">',vo.mid,'</td><td><font face="Georgia" size="2">', vo.osVersion,'</td><td><font face="Georgia" size="2">', vo.serialNumber,'</td><td><font face="Georgia" size="2">', vo.manufacturer,'</td><td><font face="Georgia" size="2">', vo.model,'</td></tr>'
		print>>file3, '%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s' % (int(server.id),v.packageName,v.name,v.type,v.displayName,v.version,v.status,time.strftime("%Y-%m-%d:%H:%M:%S", time.gmtime(v.beginDate)),v.uninstallable,v.release)
   #print>>file, '%s~~%s~~%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s	%s' % (vo.mid,'000000', vo.name, vo.osVersion, vo.osSPVersion, vo.opswLifecycle, vo.state, vo.use, vo.agentVersion, vo.stage, vo.defaultGw, vo.hypervisor, vo.codeset, time.strftime("%Y-%m-%d:%H:%M:%S", time.gmtime(vo.discoveredDate)), vo.loopbackIP, vo.managementIP, vo.netBIOSName, vo.description, vo.serialNumber, vo.manufacturer, vo.model,, time.strftime("%Y-%m-%d:%H:%M:%S", time.gmtime(vo.discoveredDate)), vo.loopbackIP, vo.managementIP, vo.netBIOSName, vo.description, vo.serialNumber, vo.manufacturer, vo.model, now.strftime("%Y-%m-%d:%H:%M:%S"), now.strftime("%Y-%m-%d:%H:%M:%S"))   

file3.close
	
print """</table>
<tr>
<td>
			<br>
			<hr>
			<a href="/cgi-bin/import_data.pl?file=server.sql&file=sa_installed_software.sql&file=sa_interfaces.sql">Import data to AIR</a>
			<br>
			<hr>
			</td>
<tr>
		</div>
	</section>


<div id="footer"></div>
</body>
</html>"""	
file2.close
