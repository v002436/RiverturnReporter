#!/opt/opsware/agent/bin/python
# Search for servers by partial hostname.

import sys
import os
import subprocess
import time
import re

argsa = 'sudo rm -rf /usr/AIR/tmp/audit_result*; sudo rm -rf /tmp/audit_result*; sudo rm -rf /usr/AIR/tmp/audits/*'
out = os.system(argsa)
rep = open('/usr/AIR/tmp/luigi_sa_data_load.rslta','w')
print>>rep, '<br</style><section class="intro" id="zen-intro" align="center"><div align=center>'
print>>rep, '<table border=1><tr><th>Audit File</th><th>Status</th></tr>' 
rep.close()
sys.path.append("/opt/opsware/agent/pylibs")
from pytwist import *

from pytwist.com.opsware.compliance.sco import *
from pytwist.com.opsware.search import Filter
from pytwist.com.opsware.compliance.sco import AuditResultRef

filter = Filter()
filter.expression = 'AuditResultVO.name *=* "%s"' % ('')

ts = twistserver.TwistServer()
serverservice = ts.compliance.sco.AuditResultService
# Authenticate by passing an SA user name and password.
#auditrefid = sys.argv[1]
try:
  ts.authenticate("jgoodman","svvs1234")
except:
  print "Authentication failed."
  sys.exit(2)

ref = serverservice.findAuditResultRefs(filter) 
print ref

frs = open('/usr/AIR/tmp/audits_by_id', 'w')
for id in ref:
	ids = id
	print>>frs, ids
frs.close()

fr = open('/usr/AIR/tmp/audits_by_id_clean', 'w')
fd = open('/usr/AIR/tmp/audits_by_id', 'r')
for line in fd:
	line = line.split(':')
	print>>fr, 'sudo /var/www/cgi-bin/export_audit.py ' + line[1].replace('\n','').replace(')','')
fr.close()
fd.close()


argss = 'sleep 10'
out = os.system(argss)

argsb = 'sudo /usr/local/bin/python ./spawn_luigi4.py'
out = os.system(argsb)

argsc = 'sudo rm -rf /usr/AIR/tmp/audit_results.txt; for i in `ls /usr/AIR/tmp/audits | grep .AUDIT`; do sudo cat /usr/AIR/tmp/audits/$i >> /usr/AIR/tmp/audit_results.txt; sudo cp /usr/AIR/tmp/audit_results.txt /tmp/audit_results.txt; sudo chmod 777 /tmp/audit_results.txt; done'
out = os.system(argsc)
argsd = 'sudo /var/www/cgi-bin/import_data.py audit_results.sql >> /usr/AIR/tmp/luigi_sa_data_load.rslta'
out = os.system(argsd)


argse = 'sudo rm -rf /usr/AIR/tmp/audit_result_source.txt; for i in `ls /usr/AIR/tmp/audits | grep .SOURCE`; do sudo cat /usr/AIR/tmp/audits/$i >> /usr/AIR/tmp/audit_result_source.txt; sudo cp /usr/AIR/tmp/audit_result_source.txt /tmp/audit_result_source.txt; sudo chmod 777 /tmp/audit_result_source.txt; done'
out = os.system(argse)
argsf = 'sudo /var/www/cgi-bin/import_data.py audit_result_source.sql >> /usr/AIR/tmp/luigi_sa_data_load.rslta'
out = os.system(argsf)


argsg = 'sudo rm -rf /usr/AIR/tmp/audit_result_server.txt; for i in `ls /usr/AIR/tmp/audits | grep .SERVER`; do sudo cat /usr/AIR/tmp/audits/$i >> /usr/AIR/tmp/audit_result_server.txt; sudo cp /usr/AIR/tmp/audit_result_server.txt /tmp/audit_result_server.txt; sudo chmod 777 /tmp/audit_result_server.txt; done'
out = os.system(argsg)
argsh = 'sudo /var/www/cgi-bin/import_data.py audit_result_server.sql >> /usr/AIR/tmp/luigi_sa_data_load.rslta'
out = os.system(argsh)


argsi = 'sudo rm -rf /usr/AIR/tmp/audit_result_rules.txt; for i in `ls /usr/AIR/tmp/audits | grep -w RULE`; do sudo cat /usr/AIR/tmp/audits/$i >> /usr/AIR/tmp/audit_result_rules.txt; sudo cp /usr/AIR/tmp/audit_result_rules.txt /tmp/audit_result_rules.txt; sudo chmod 777 /tmp/audit_result_rules.txt; done'
out = os.system(argsi)
argsj = 'sudo /var/www/cgi-bin/import_data.py audit_result_rules.sql >> /usr/AIR/tmp/luigi_sa_data_load.rslta'
out = os.system(argsj)


argsh = 'sudo rm -rf /usr/AIR/tmp/audit_result_rule_attribute.txt; for i in `ls /usr/AIR/tmp/audits | grep -w RULEATTR`; do sudo cat /usr/AIR/tmp/audits/$i >> /usr/AIR/tmp/audit_result_rule_attribute.txt; sudo cp /usr/AIR/tmp/audit_result_rule_attribute.txt /tmp/audit_result_rule_attribute.txt; sudo chmod 777 /tmp/audit_result_rule_attribute.txt; done'
out = os.system(argsh)
argsi = 'sudo /var/www/cgi-bin/import_data.py audit_result_rule_attribute.sql >> /usr/AIR/tmp/luigi_sa_data_load.rslta'
out = os.system(argsi)


argsj = 'sudo rm -rf /usr/AIR/tmp/audit_result_rule_attrib_status.txt; for i in `ls /usr/AIR/tmp/audits | grep -w RULESTAT`; do sudo cat /usr/AIR/tmp/audits/$i >> /usr/AIR/tmp/audit_result_rule_attrib_status.txt; sudo cp /usr/AIR/tmp/audit_result_rule_attrib_status.txt /tmp/audit_result_rule_attrib_status.txt; sudo chmod 777 /tmp/audit_result_rule_attrib_status.txt; done'
out = os.system(argsj)
argsk = 'sudo /var/www/cgi-bin/import_data.py audit_result_rule_attrib_status.sql >> /usr/AIR/tmp/luigi_sa_data_load.rslta'
out = os.system(argsk)


argsl = 'sudo rm -rf /usr/AIR/tmp/audit_result_rule_attrib_script.txt; for i in `ls /usr/AIR/tmp/audits | grep -w RULESCRIPT`; do sudo cat /usr/AIR/tmp/audits/$i >> /usr/AIR/tmp/audit_result_rule_attrib_script.txt; sudo cp /usr/AIR/tmp/audit_result_rule_attrib_script.txt /tmp/audit_result_rule_attrib_script.txt; sudo chmod 777 /tmp/audit_result_rule_attrib_script.txt; done'
out = os.system(argsl)
argsm = 'sudo /var/www/cgi-bin/import_data.py audit_result_rule_attrib_script.sql >> /usr/AIR/tmp/luigi_sa_data_load.rslta'
out = os.system(argsm)


