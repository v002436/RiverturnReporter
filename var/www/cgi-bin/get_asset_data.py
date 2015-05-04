#!/usr/bin/python
# Search for servers by partial hostname.


import sys
import os
import subprocess
import time


oracle_home = 'export ORACLE_HOME=/opt/opsware/oracle_instantclient/instantclient_11.2.0.3;'
path = 'export PATH=$PATH:$ORACLE_HOME/bin;'
ld_library_path = 'export LD_LIBRARY_PATH=$ORACLE_HOME/lib;'
user = 'air/jennyl01'
connect = '@"(DESCRIPTION =(ADDRESS_LIST =(ADDRESS = (PROTOCOL = TCP)(HOST = sadb10)(PORT = 1521)))(CONNECT_DATA =(SID = TRUTH)))"'
exe = 'sqlplus -S '

sql_file = ' @/var/www/cgi-bin/asset.sql'

command = oracle_home + path + ld_library_path + exe + user + connect + sql_file
#print command
process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=None, shell=True)
file = open('/usr/AIR/tmp/asset.txt', 'a')
#Launch the shell command:
output = process.communicate()
#print output
output2 = output[0].split('\n')
print """<style>
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
</style>"""
print """<table class="reference" style="width:60%">
<tr><th>Asset ID</th><th>Host Name</th></tr>"""
#print output2

for o in output2:
  o = o.split(',')
  if o[0]:
    print '<tr>'
    print '<td>', o[0].rstrip(),'</td>','<td>', o[1].rstrip(), '</td>'
    print>>file, '%s  %s' %  (o[0].rstrip(), o[1].rstrip())
    print '</tr>'

file.close


sql_file = ' @/var/www/cgi-bin/asset_ipaddress.sql'

command = oracle_home + path + ld_library_path + exe + user + connect + sql_file
#print command
process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=None, shell=True)
file = open('/usr/AIR/tmp/asset_ipaddress.txt', 'a')
#Launch the shell command:
output = process.communicate()
#print output
output2 = output[0].split('\n')
#print output2
print """<tr><th>Asset ID</th><th>IP Address</th><th>Host Name</th><th>MAC Address</th></tr>"""
for o in output2:
  o = o.split(',')
  if o[0]:
    print '<tr>'
    print '<td>', o[0].rstrip(),'</td>','<td>', o[1].rstrip(),'</td>','<td>', o[2].rstrip(),'</td>','<td>', o[3].rstrip(), '</td>'
    print>>file, '%s  %s  %s  %s' %  (o[0].rstrip(), o[1].rstrip(), o[2].rstrip(), o[3].rstrip())
    print '<tr>'

file.close
