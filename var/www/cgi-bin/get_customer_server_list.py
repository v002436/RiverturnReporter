#!/opt/opsware/agent/bin/python
# Search for servers by partial hostname.

import sys
import os
import subprocess
import time

argsiii = 'rm -rf /usr/AIR/tmp/asset.txt /usr/AIR/tmp/asset_ipaddress.txt'
out = os.system(argsiii)
if out < 1:
	print """File Cleanup Succeeded!"""
else:
	print """File Cleanup failed!"""
	
args = './get_asset_data.py '
out = os.system(args)
if out < 1:
	print """Export of Customer Data succeeded!"""
else:
	print """Export of Customer Data failed!"""
argsi = './import_data_blank.py asset.txt'
out = os.system(argsi)
if out < 1:
	print """Import of Customer Server Data succeeded!"""
else:
	print """Import of Customer Server Data failed!"""
argsii = './import_data_blank.py asset_ipaddress.txt'
out = os.system(argsii)
if out < 1:
	print """Import of Customer Interface Data succeeded!"""
else:
	print """Import of Customer Interface Data failed!"""
