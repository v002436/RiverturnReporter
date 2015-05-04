#!/opt/opsware/agent/bin/python
# Search for servers by partial hostname.

import sys
import os
import subprocess as sp
import time
import shlex


cmd = '/usr/bin/mysql -s -uroot -pR00tw0rd! AIR -e "SELECT b.opsware_id,a.asset_id FROM AIR.asset a JOIN AIR.server b on lower(a.hostname) = lower(b.hostname) union SELECT b.opsware_id, a.asset_id FROM AIR.asset_ipaddress a JOIN AIR.server b on lower(a.fqdn) = lower(b.hostname) union SELECT b.opsware_id, a.asset_id FROM AIR.asset_ipaddress a JOIN AIR.sa_interfaces b on lower(a.ip_address) = lower(b.Interface_IPAddress)"'
args = shlex.split(cmd)
p1 = sp.Popen(args, stdout = sp.PIPE)
#p2 = sp.Popen(["wc", "-c"], stdin = p1.stdout, stdout = sp.PIPE)
out = p1.stdout.read()

file = open('/usr/AIR/tmp/asset_to_sa_map.txt', 'w')  

o = out.split('\n')
for i in o:
	e = i.split()
	if e:
		print>>file, '%s	%s' % (e[0],e[1])

file.close
