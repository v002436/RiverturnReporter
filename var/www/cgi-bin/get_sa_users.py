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
  print 'You must specify part of the username as the search target.'
 # print "Example: " + sys.argv[0] + "   " + "opsware.com"
  sys.exit(2)
#print 'Host:', sys.argv[1]
# Construct a search filter.
role = sys.argv[1]
filter = Filter()
filter.expression = 'UserRoleVO.rolespace *=* %s' % role

# Create the TwistServerobject.
ts = twistserver.TwistServer()
# Authenticate by passing an SA user name and password.
try:
  ts.authenticate("jgoodman","svvs1234")
except:
  print "Authentication failed."
  sys.exit(2)

# Get a reference to ServerService.
users = ts.fido.UserRoleService.findUserRoleRefs(filter)
#servers = serverservice.findServerRefs(filter)

if len(users) < 1:
  print "No matching users found"
  sys.exit(3)

#if len(users) > 1:
  #print "Too many matching users found"
  #sys.exit(3)


# For each server found, get the server's value object (VO) and
# print some of the VO's attributesa.
file = open('/usr/AIR/tmp/users.txt', 'w')
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
print """<table class="reference">
<tr><th><font face="Georgia" size="2">displayName</font></th><th><font face="Georgia" size="2">description</font></th><th><font face="Georgia" size="2">namespace</font></th><th><font face="Georgia" size="2">roleName</font></th><th><font face="Georgia" size="2">roleType</font></th><th><font face="Georgia" size="2">rolespace</font></th><th><font face="Georgia" size="2">roleId</font></th></tr>"""
for user in users:
   #print user
   vo = ts.fido.UserRoleService.getUserRoleVO(user)
   print '<tr><td><font face="Georgia" size="2">', vo.displayName, '</font></td><td><font face="Georgia" size="2">', vo.description, '</font></td><td><font face="Georgia" size="2">', vo.namespace,'</font></td><td><font face="Georgia" size="2">', vo.roleName,'</font></td><td><font face="Georgia" size="2">', vo.roleType,'</font></td><td><font face="Georgia" size="2">', vo.rolespace,'</font></td><td><font face="Georgia" size="2">', vo.roleId,'</font></td></tr>'
   #print '<tr><td><font face="Georgia" size="2">',vo.mid,'</font></td><td><font face="Georgia" size="2">', vo.name,'</font></td><td><font face="Georgia" size="2">', vo.osVersion,'</font></td><td><font face="Georgia" size="2">', vo.serialNumber,'</font></td><td><font face="Georgia" size="2">', vo.manufacturer,'</font></td><td><font face="Georgia" size="2">', vo.model,'</font></td></tr>'
   print>>file, '%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s~~%s' %  (vo.displayName, vo.description, vo.namespace, vo.roleName, vo.roleType, vo.rolespace, vo.roleId, now.strftime("%Y-%m-%d:%H:%M:%S"), now.strftime("%Y-%m-%d:%H:%M:%S"))
#print '</table> <hr>'   
file.close

	
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

