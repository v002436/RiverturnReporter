#!/opt/opsware/agent/bin/python
# Search for servers by partial hostname.

import sys
import os
import subprocess as sp
import time
import shlex
import datetime
from email.Utils import formatdate

now = datetime.datetime.now()

				
#cmd = '/usr/bin/mysql -s -uroot -pR00tw0rd! AIR -e "SELECT b.opsware_id,a.asset_id FROM AIR.asset a JOIN AIR.server b on lower(a.hostname) = lower(b.hostname) union SELECT b.opsware_id, a.asset_id FROM AIR.asset_ipaddress a JOIN AIR.server b on lower(a.fqdn) = lower(b.hostname) union SELECT b.opsware_id, a.asset_id FROM AIR.asset_ipaddress a JOIN AIR.sa_interfaces b on lower(a.ip_address) = lower(b.Interface_IPAddress)"'
#args = shlex.split(cmd)
#p1 = sp.Popen(args, stdout = sp.PIPE)
#p2 = sp.Popen(["wc", "-c"], stdin = p1.stdout, stdout = sp.PIPE)
#out = p1.stdout.read()
path = '/usr/AIR/tmp/sa_jobs/' + sys.argv[1]
file = open(path, 'r') 
dict = {}
dict = { 'JOBID': sys.argv[1] }
line = file.readline()
while line:
	if line:
		line = file.readline()
		li = line.split('::')
		if "J" in li[0]:
			if len(li[1]) > 2:
				val = li[1].replace('\t','')
				val = li[1].replace('\n','')
				val = li[1].strip()
			else:
				val = 'null'
			#print sys.argv[1] + '-~~-' + li[0] + '-~~-' + val
			dict[li[0]] = val
	
file.close
if sys.argv[1]:
	JOB_BASE_ID = sys.argv[1]
	print 'Processing Job ID:' + JOB_BASE_ID 
else:
	JOB_BASE_ID = 'null'
if 'JOB_BASE_ENDDATE' in dict:
	JOB_BASE_ENDDATE = dict['JOB_BASE_ENDDATE']
	if 'None' in JOB_BASE_ENDDATE:
		JOB_BASE_ENDDATE = '0000-00-00 00:00:00'
	else:
		JOB_BASE_ENDDATE = dict['JOB_BASE_ENDDATE']
		JOB_BASE_ENDDATE = JOB_BASE_ENDDATE.replace(' UTC','').replace(' EDT','')
else:
	JOB_BASE_ENDDATE = '0000-00-00 00:00:00'
if 'JOB_BASE_NAME' in dict:
	JOB_BASE_NAME = dict['JOB_BASE_NAME']
else:
	JOB_BASE_NAME = 'null'
if 'JOB_BASE_OGFS_EXITCODE' in dict:
	JOB_BASE_OGFS_EXITCODE = dict['JOB_BASE_OGFS_EXITCODE']
else:
	JOB_BASE_OGFS_EXITCODE = 'null'
if 'JOB_BASE_OGFS_STDERR' in dict:
	JOB_BASE_OGFS_STDERR = dict['JOB_BASE_OGFS_STDERR']
else:
	JOB_BASE_OGFS_STDERR = 'null'
if 'JOB_BASE_OGFS_STDOUT' in dict:
	JOB_BASE_OGFS_STDOUT = dict['JOB_BASE_OGFS_STDOUT']
else:
	JOB_BASE_OGFS_STDOUT = 'null'
if 'JOB_BASE_PHASE' in dict:
	JOB_BASE_PHASE = dict['JOB_BASE_PHASE']
else:
	JOB_BASE_PHASE = 'null'
if 'JOB_BASE_PHASE_COMPLETED_STEPS' in dict:
	JOB_BASE_PHASE_COMPLETED_STEPS = dict['JOB_BASE_PHASE_COMPLETED_STEPS']
else:
	JOB_BASE_PHASE_COMPLETED_STEPS = 'null'
if 'JOB_BASE_PHASE_ENDDATE' in dict:
	JOB_BASE_PHASE_ENDDATE = dict['JOB_BASE_PHASE_ENDDATE']
	if 'None' in JOB_BASE_PHASE_ENDDATE:
		JOB_BASE_PHASE_ENDDATE = '0000-00-00 00:00:00'
	else:
		JOB_BASE_PHASE_ENDDATE = dict['JOB_BASE_PHASE_ENDDATE']
		JOB_BASE_PHASE_ENDDATE = JOB_BASE_PHASE_ENDDATE.replace(' UTC','').replace(' EDT','')
else:
	JOB_BASE_PHASE_ENDDATE = '0000-00-00 00:00:00'
if 'JOB_BASE_PHASE_STARTDATE' in dict:
	JOB_BASE_PHASE_STARTDATE = dict['JOB_BASE_PHASE_STARTDATE']
	if 'None' in JOB_BASE_PHASE_STARTDATE:
		JOB_BASE_PHASE_STARTDATE = '0000-00-00 00:00:00'
	else:
		JOB_BASE_PHASE_STARTDATE = dict['JOB_BASE_PHASE_STARTDATE']
		JOB_BASE_PHASE_STARTDATE = JOB_BASE_PHASE_STARTDATE.replace(' UTC','').replace(' EDT','')
else:
	JOB_BASE_PHASE_STARTDATE = '0000-00-00 00:00:00'
if 'JOB_BASE_PHASE_STATUS' in dict:
	JOB_BASE_PHASE_STATUS = dict['JOB_BASE_PHASE_STATUS']
else:
	JOB_BASE_PHASE_STATUS = 'null'
if 'JOB_BASE_PHASE_TOTAL_STEPS' in dict:
	JOB_BASE_PHASE_TOTAL_STEPS = dict['JOB_BASE_PHASE_TOTAL_STEPS']
else:
	JOB_BASE_PHASE_TOTAL_STEPS = 'null'
if 'JOB_BASE_POLICY_NAME' in dict:
	JOB_BASE_POLICY_NAME = dict['JOB_BASE_POLICY_NAME']
else:
	JOB_BASE_POLICY_NAME = 'null'
if 'JOB_BASE_SCRIPT_NAME' in dict:
	JOB_BASE_SCRIPT_NAME = dict['JOB_BASE_SCRIPT_NAME']
else:
	JOB_BASE_SCRIPT_NAME = 'null'
if 'JOB_BASE_SCRIPT_SOURCE' in dict:
	JOB_BASE_SCRIPT_SOURCE = dict['JOB_BASE_SCRIPT_SOURCE']
else:
	JOB_BASE_SCRIPT_SOURCE = 'null'
if 'JOB_BASE_STARTDATE' in dict:
	JOB_BASE_STARTDATE = dict['JOB_BASE_STARTDATE']
	if 'None' in JOB_BASE_STARTDATE:
		JOB_BASE_STARTDATE = '0000-00-00 00:00:00'
	else:
		JOB_BASE_STARTDATE = dict['JOB_BASE_STARTDATE']
		JOB_BASE_STARTDATE = JOB_BASE_STARTDATE.replace(' UTC','').replace(' EDT','')
else:
	JOB_BASE_STARTDATE = '0000-00-00 00:00:00'
if 'JOB_BASE_STATUS' in dict:
	JOB_BASE_STATUS = dict['JOB_BASE_STATUS']
else:
	JOB_BASE_STATUS = 'null'
if 'JOB_BASE_TICKET' in dict:
	JOB_BASE_TICKET = dict['JOB_BASE_TICKET']
else:
	JOB_BASE_TICKET = 'null'
if 'JOB_BASE_TYPE' in dict:
	JOB_BASE_TYPE = dict['JOB_BASE_TYPE']
else:
	JOB_BASE_TYPE = 'null'
if 'JOB_BASE_TZ' in dict:
	JOB_BASE_TZ = dict['JOB_BASE_TZ']
else:
	JOB_BASE_TZ = 'null'
if 'JOB_BASE_USER' in dict:
	JOB_BASE_USER = dict['JOB_BASE_USER']
else:
	JOB_BASE_USER = 'null'
path = '/usr/AIR/tmp/sa_jobs/' + JOB_BASE_ID + '.BASE'
file = open(path, 'w')
print>>file, JOB_BASE_ID + '-~~-' + JOB_BASE_ENDDATE + '-~~-' + JOB_BASE_NAME + '-~~-' + JOB_BASE_OGFS_EXITCODE + '-~~-' + JOB_BASE_OGFS_STDERR + '-~~-' + JOB_BASE_OGFS_STDOUT + '-~~-' + JOB_BASE_PHASE + '-~~-' + JOB_BASE_PHASE_STARTDATE + '-~~-' + JOB_BASE_PHASE_COMPLETED_STEPS + '-~~-' + JOB_BASE_PHASE_ENDDATE + '-~~-' + JOB_BASE_PHASE_STATUS + '-~~-' + JOB_BASE_PHASE_TOTAL_STEPS + '-~~-' + JOB_BASE_POLICY_NAME + '-~~-' + JOB_BASE_SCRIPT_NAME + '-~~-' + JOB_BASE_SCRIPT_SOURCE + '-~~-' + JOB_BASE_STARTDATE + '-~~-' + JOB_BASE_STATUS + '-~~-' + JOB_BASE_TICKET + '-~~-' + JOB_BASE_TYPE + '-~~-' + JOB_BASE_TZ + '-~~-' + JOB_BASE_USER + '-~~-' + now.strftime("%Y-%m-%d:%H:%M:%S") + '-~~-' + now.strftime("%Y-%m-%d:%H:%M:%S")
file.close
# Process Comm Tests	
if 'JOB_COMM_AGENT_VER' in dict:
	JOB_COMM_AGENT_VER = dict['JOB_COMM_AGENT_VER']
else:
	JOB_COMM_AGENT_VER = 'null'
if 'JOB_COMM_CRYPTO_OK' in dict:
	JOB_COMM_CRYPTO_OK = dict['JOB_COMM_CRYPTO_OK']
else:
	JOB_COMM_CRYPTO_OK = 'null'
if 'JOB_COMM_DATA' in dict:
	JOB_COMM_DATA = dict['JOB_COMM_DATA']
else:
	JOB_COMM_DATA = 'null'
if 'JOB_COMM_ELEMENT' in dict:
	JOB_COMM_ELEMENT = dict['JOB_COMM_ELEMENT']
else:
	JOB_COMM_ELEMENT = 'null'
if 'JOB_COMM_ERROR' in dict:
	JOB_COMM_ERROR = dict['JOB_COMM_ERROR']
else:
	JOB_COMM_ERROR = 'null'
if 'JOB_COMM_FACILITY' in dict:
	JOB_COMM_FACILITY = dict['JOB_COMM_FACILITY']
else:
	JOB_COMM_FACILITY = 'null'
if 'JOB_COMM_IP' in dict:
	JOB_COMM_IP = dict['JOB_COMM_IP']
else:
	JOB_COMM_IP = 'null'
if 'JOB_COMM_LIFECYCLE' in dict:
	JOB_COMM_LIFECYCLE = dict['JOB_COMM_LIFECYCLE']
else:
	JOB_COMM_LIFECYCLE = 'null'
if 'JOB_COMM_MESSAGE' in dict:
	JOB_COMM_MESSAGE = dict['JOB_COMM_MESSAGE']
else:
	JOB_COMM_MESSAGE = 'null'
if 'JOB_COMM_MID_OK' in dict:
	JOB_COMM_MID_OK = dict['JOB_COMM_MID_OK']
else:
	JOB_COMM_MID_OK = 'null'
if 'JOB_COMM_OS' in dict:
	JOB_COMM_OS = dict['JOB_COMM_OS']
else:
	JOB_COMM_OS = 'null'
if 'JOB_COMM_REACHABLE' in dict:
	JOB_COMM_REACHABLE = dict['JOB_COMM_REACHABLE']
else:
	JOB_COMM_REACHABLE = 'null'
if 'JOB_COMM_SERVER_NAME' in dict:
	JOB_COMM_SERVER_NAME = dict['JOB_COMM_SERVER_NAME']
else:
	JOB_COMM_SERVER_NAME = 'null'
if 'JOB_COMM_SPIN_OK' in dict:
	JOB_COMM_SPIN_OK = dict['JOB_COMM_SPIN_OK']
else:
	JOB_COMM_SPIN_OK = 'null'
if 'JOB_COMM_STEPS' in dict:
	JOB_COMM_STEPS = dict['JOB_COMM_STEPS']
else:
	JOB_COMM_STEPS = 'null'
if 'JOB_COMM_STEPS_COMPLETED' in dict:
	JOB_COMM_STEPS_COMPLETED = dict['JOB_COMM_STEPS_COMPLETED']
else:
	JOB_COMM_STEPS_COMPLETED = 'null'
if 'JOB_COMM_TOTAL_DVCS' in dict:
	JOB_COMM_TOTAL_DVCS = dict['JOB_COMM_TOTAL_DVCS']
else:
	JOB_COMM_TOTAL_DVCS = 'null'
if 'JOB_COMM_TOTAL_FAILED' in dict:
	JOB_COMM_TOTAL_FAILED = dict['JOB_COMM_TOTAL_FAILED']
else:
	JOB_COMM_TOTAL_FAILED = 'null'
if 'JOB_COMM_TOTAL_SKIPPED' in dict:
	JOB_COMM_TOTAL_SKIPPED = dict['JOB_COMM_TOTAL_SKIPPED']
else:
	JOB_COMM_TOTAL_SKIPPED = 'null'
if 'JOB_COMM_TOTAL_SUCCESS' in dict:
	JOB_COMM_TOTAL_SUCCESS = dict['JOB_COMM_TOTAL_SUCCESS']
else:
	JOB_COMM_TOTAL_SUCCESS = 'null'
if 'JOB_COMM_TOTAL_SUMMARY' in dict:
	JOB_COMM_TOTAL_SUMMARY = dict['JOB_COMM_TOTAL_SUMMARY']
else:
	JOB_COMM_TOTAL_SUMMARY = 'null'
if 'JOB_COMM_WAY_OK' in dict:
	JOB_COMM_WAY_OK = dict['JOB_COMM_WAY_OK']
else:
	JOB_COMM_WAY_OK = 'null'
if 'JOB_COMM_WORD_OK' in dict:
	JOB_COMM_WORD_OK = dict['JOB_COMM_WORD_OK']
else:
	JOB_COMM_WORD_OK = 'null'
path = '/usr/AIR/tmp/sa_jobs/' + JOB_BASE_ID + '.COMM'
file = open(path, 'w')
print>>file, JOB_BASE_ID + '-~~-' + JOB_COMM_AGENT_VER + '-~~-' + JOB_COMM_CRYPTO_OK + '-~~-' + JOB_COMM_DATA + '-~~-' + JOB_COMM_ELEMENT + '-~~-' + JOB_COMM_ERROR + '-~~-' + JOB_COMM_FACILITY + '-~~-' + JOB_COMM_IP + '-~~-' + JOB_COMM_LIFECYCLE + '-~~-' + JOB_COMM_MESSAGE + '-~~-' + JOB_COMM_MID_OK + '-~~-' + JOB_COMM_OS + '-~~-' + JOB_COMM_REACHABLE + '-~~-' + JOB_COMM_SERVER_NAME + '-~~-' + JOB_COMM_SPIN_OK + '-~~-' + JOB_COMM_STEPS + '-~~-' + JOB_COMM_STEPS_COMPLETED + '-~~-' + JOB_COMM_TOTAL_DVCS + '-~~-' + JOB_COMM_TOTAL_FAILED + '-~~-' + JOB_COMM_TOTAL_SKIPPED + '-~~-' + JOB_COMM_TOTAL_SUCCESS + '-~~-' + JOB_COMM_TOTAL_SUMMARY + '-~~-' + JOB_COMM_WAY_OK + '-~~-' + now.strftime("%Y-%m-%d:%H:%M:%S") + '-~~-' + now.strftime("%Y-%m-%d:%H:%M:%S")
file.close
# process job server details
if 'JOB_SERVER_ERROR_MESSAGE' in dict:
	JOB_SERVER_ERROR_MESSAGE = dict['JOB_SERVER_ERROR_MESSAGE']
else:
	JOB_SERVER_ERROR_MESSAGE = 'null'
if 'JOB_SERVER_NAME' in dict:
	JOB_SERVER_NAME = dict['JOB_SERVER_NAME']
else:
	JOB_SERVER_NAME = 'null'
if 'JOB_SERVER_REMEDIATE_ENDDATE' in dict:
	JOB_SERVER_REMEDIATE_ENDDATE = dict['JOB_SERVER_REMEDIATE_ENDDATE']
	if 'None' in JOB_SERVER_REMEDIATE_ENDDATE:
		JOB_SERVER_REMEDIATE_ENDDATE = '0000-00-00 00:00:00'
	else:
		JOB_SERVER_REMEDIATE_ENDDATE = dict['JOB_SERVER_REMEDIATE_ENDDATE']
		JOB_SERVER_REMEDIATE_ENDDATE = JOB_SERVER_REMEDIATE_ENDDATE.replace(' UTC','').replace(' EDT','')
else:
	JOB_SERVER_REMEDIATE_ENDDATE = '0000-00-00 00:00:00'
if 'JOB_SERVER_REMEDIATE_ERROR' in dict:
	JOB_SERVER_REMEDIATE_ERROR = dict['JOB_SERVER_REMEDIATE_ERROR']
else:
	JOB_SERVER_REMEDIATE_ERROR = 'null'
if 'JOB_SERVER_REMEDIATE_MESSAGE' in dict:
	JOB_SERVER_REMEDIATE_MESSAGE = dict['JOB_SERVER_REMEDIATE_MESSAGE']
else:
	JOB_SERVER_REMEDIATE_MESSAGE = 'null'
if 'JOB_SERVER_REMEDIATE_PHASE' in dict:
	JOB_SERVER_REMEDIATE_PHASE = dict['JOB_SERVER_REMEDIATE_PHASE']
else:
	JOB_SERVER_REMEDIATE_PHASE = 'null'
if 'JOB_SERVER_REMEDIATE_STATUS' in dict:
	JOB_SERVER_REMEDIATE_STATUS = dict['JOB_SERVER_REMEDIATE_STATUS']
else:
	JOB_SERVER_REMEDIATE_STATUS = 'null'
if 'JOB_SERVER_REMEDIATE_WARNING' in dict:
	JOB_SERVER_REMEDIATE_WARNING = dict['JOB_SERVER_REMEDIATE_WARNING']
else:
	JOB_SERVER_REMEDIATE_WARNING = 'null'
if 'JOB_SERVER_SCRIPT_ACTION' in dict:
	JOB_SERVER_SCRIPT_ACTION = dict['JOB_SERVER_SCRIPT_ACTION']
else:
	JOB_SERVER_SCRIPT_ACTION = 'null'
if 'JOB_SERVER_SCRIPT_ERROR' in dict:
	JOB_SERVER_SCRIPT_ERROR = dict['JOB_SERVER_SCRIPT_ERROR']
else:
	JOB_SERVER_SCRIPT_ERROR = 'null'
if 'JOB_SERVER_SCRIPT_EXITCODE' in dict:
	JOB_SERVER_SCRIPT_EXITCODE = dict['JOB_SERVER_SCRIPT_EXITCODE']
else:
	JOB_SERVER_SCRIPT_EXITCODE = 'null'
if 'JOB_SERVER_SCRIPT_NAME' in dict:
	JOB_SERVER_SCRIPT_NAME = dict['JOB_SERVER_SCRIPT_NAME']
else:
	JOB_SERVER_SCRIPT_NAME = 'null'	
if 'JOB_SERVER_SCRIPT_STATUS' in dict:
	JOB_SERVER_SCRIPT_STATUS = dict['JOB_SERVER_SCRIPT_STATUS']
else:
	JOB_SERVER_SCRIPT_STATUS = 'null'
if 'JOB_SERVER_SCRIPT_STDERR' in dict:
	JOB_SERVER_SCRIPT_STDERR = dict['JOB_SERVER_SCRIPT_STDERR']
else:
	JOB_SERVER_SCRIPT_STDERR = 'null'
if 'JOB_SERVER_SCRIPT_STDOUT' in dict:
	JOB_SERVER_SCRIPT_STDOUT = dict['JOB_SERVER_SCRIPT_STDOUT']
	JOB_SERVER_SCRIPT_STDERR = JOB_SERVER_SCRIPT_STDERR[:1000] + '..'
else:
	JOB_SERVER_SCRIPT_STDOUT = 'null'
if 'JOB_SERVER_UNIT_ACTION' in dict:
	JOB_SERVER_UNIT_ACTION = dict['JOB_SERVER_UNIT_ACTION']
else:
	JOB_SERVER_UNIT_ACTION = 'null'
if 'JOB_SERVER_UNIT_ERROR' in dict:
	JOB_SERVER_UNIT_ERROR = dict['JOB_SERVER_UNIT_ERROR']
else:
	JOB_SERVER_UNIT_ERROR = 'null'
if 'JOB_SERVER_UNIT_NAME' in dict:
	JOB_SERVER_UNIT_NAME = dict['JOB_SERVER_UNIT_NAME']
else:
	JOB_SERVER_UNIT_NAME = 'null'
if 'JOB_SERVER_UNIT_OUTPUT' in dict:
	JOB_SERVER_UNIT_OUTPUT = dict['JOB_SERVER_UNIT_OUTPUT']
else:
	JOB_SERVER_UNIT_OUTPUT = 'null'
if 'JOB_SERVER_UNIT_REBOOT' in dict:
	JOB_SERVER_UNIT_REBOOT = dict['JOB_SERVER_UNIT_REBOOT']
else:
	JOB_SERVER_UNIT_REBOOT = 'null'
if 'JOB_SERVER_UNIT_RESULT' in dict:
	JOB_SERVER_UNIT_RESULT = dict['JOB_SERVER_UNIT_RESULT']
else:
	JOB_SERVER_UNIT_RESULT = 'null'
if 'JOB_SERVER_UNIT_STATUS' in dict:
	JOB_SERVER_UNIT_STATUS = dict['JOB_SERVER_UNIT_STATUS']
else:
	JOB_SERVER_UNIT_STATUS = 'null'	
	
if 'JOB_SERVER_REMEDIATE_STARTDATE' in dict:
	JOB_SERVER_REMEDIATE_STARTDATE = dict['JOB_SERVER_REMEDIATE_STARTDATE']
	JOB_SERVER_REMEDIATE_STARTDATE = JOB_SERVER_REMEDIATE_STARTDATE.replace(' UTC','').replace(' EDT','')
	if 'None' in JOB_SERVER_REMEDIATE_STARTDATE:
		JOB_SERVER_REMEDIATE_STARTDATE = '0000-00-00 00:00:00'
	else:
		JOB_SERVER_REMEDIATE_STARTDATE = dict['JOB_SERVER_REMEDIATE_STARTDATE']
		JOB_SERVER_REMEDIATE_STARTDATE = JOB_SERVER_REMEDIATE_STARTDATE.replace(' UTC','').replace(' EDT','')
else:
	JOB_SERVER_REMEDIATE_STARTDATE = '0000-00-00 00:00:00'

if 'JOB_SERVER_SCRIPT_ENDDATE' in dict:
	JOB_SERVER_SCRIPT_ENDDATE = dict['JOB_SERVER_SCRIPT_ENDDATE']
	if 'None' in JOB_SERVER_SCRIPT_ENDDATE:
		JOB_SERVER_SCRIPT_ENDDATE = '0000-00-00 00:00:00'
	else:
		JOB_SERVER_SCRIPT_ENDDATE = dict['JOB_SERVER_SCRIPT_ENDDATE']
		JOB_SERVER_SCRIPT_ENDDATE = JOB_SERVER_SCRIPT_ENDDATE.replace(' UTC','').replace(' EDT','')
else:
	JOB_SERVER_SCRIPT_ENDDATE = '0000-00-00 00:00:00'
			
if 'JOB_SERVER_SCRIPT_STARTDATE' in dict:
	JOB_SERVER_SCRIPT_STARTDATE = dict['JOB_SERVER_SCRIPT_STARTDATE']
	if 'None' in JOB_SERVER_SCRIPT_STARTDATE:
		JOB_SERVER_SCRIPT_STARTDATE = '0000-00-00 00:00:00'
	else:
		JOB_SERVER_SCRIPT_STARTDATE = dict['JOB_SERVER_SCRIPT_STARTDATE']
		JOB_SERVER_SCRIPT_STARTDATE = JOB_SERVER_SCRIPT_STARTDATE.replace(' UTC','').replace(' EDT','')
else:
	JOB_SERVER_SCRIPT_STARTDATE = '0000-00-00 00:00:00'
	
if 'JOB_SERVER_UNIT_ENDDATE' in dict:
	JOB_SERVER_UNIT_ENDDATE = dict['JOB_SERVER_UNIT_ENDDATE']
	if 'None' in JOB_SERVER_UNIT_ENDDATE:
		JOB_SERVER_UNIT_ENDDATE = '0000-00-00 00:00:00'
	else:
		JOB_SERVER_UNIT_ENDDATE = dict['JOB_SERVER_UNIT_ENDDATE']
		JOB_SERVER_UNIT_ENDDATE = JOB_SERVER_UNIT_ENDDATE.replace(' UTC','').replace(' EDT','')
else:
	JOB_SERVER_UNIT_ENDDATE = '0000-00-00 00:00:00'
	
if 'JOB_SERVER_UNIT_STARTDATE' in dict:
	JOB_SERVER_UNIT_STARTDATE = dict['JOB_SERVER_UNIT_STARTDATE']
	if 'None' in JOB_SERVER_UNIT_STARTDATE:
		JOB_SERVER_UNIT_STARTDATE = '0000-00-00 00:00:00'
	else:
		JOB_SERVER_UNIT_STARTDATE = dict['JOB_SERVER_UNIT_STARTDATE']
		JOB_SERVER_UNIT_STARTDATE = JOB_SERVER_UNIT_STARTDATE.replace(' UTC','').replace(' EDT','')
else:
	JOB_SERVER_UNIT_STARTDATE = '0000-00-00 00:00:00'
	
path = '/usr/AIR/tmp/sa_jobs/' + JOB_BASE_ID + '.SERVER'
file = open(path, 'w')
print>>file, JOB_BASE_ID + '-~~-' + JOB_SERVER_ERROR_MESSAGE + '-~~-' + JOB_SERVER_NAME + '-~~-' + JOB_SERVER_REMEDIATE_ENDDATE + '-~~-' + JOB_SERVER_REMEDIATE_ERROR + '-~~-' + JOB_SERVER_REMEDIATE_MESSAGE + '-~~-' + JOB_SERVER_REMEDIATE_PHASE + '-~~-' + JOB_SERVER_REMEDIATE_STATUS + '-~~-' + JOB_SERVER_REMEDIATE_WARNING + '-~~-' + JOB_SERVER_SCRIPT_ACTION + '-~~-' + JOB_SERVER_SCRIPT_ERROR + '-~~-' + JOB_SERVER_SCRIPT_EXITCODE + '-~~-' + JOB_SERVER_SCRIPT_NAME + '-~~-' + JOB_SERVER_SCRIPT_STATUS + '-~~-' + JOB_SERVER_SCRIPT_STDERR + '-~~-' + JOB_SERVER_SCRIPT_STDOUT + '-~~-' + JOB_SERVER_UNIT_ACTION + '-~~-' + JOB_SERVER_UNIT_ERROR + '-~~-' + JOB_SERVER_UNIT_NAME + '-~~-' + JOB_SERVER_UNIT_OUTPUT + '-~~-' + JOB_SERVER_UNIT_REBOOT + '-~~-' + JOB_SERVER_UNIT_RESULT + '-~~-' + JOB_SERVER_UNIT_STATUS + '-~~-' + JOB_SERVER_REMEDIATE_STARTDATE + '-~~-' + JOB_SERVER_SCRIPT_ENDDATE + '-~~-' + JOB_SERVER_SCRIPT_STARTDATE + '-~~-' + JOB_SERVER_UNIT_ENDDATE + '-~~-' + JOB_SERVER_UNIT_STARTDATE + '-~~-' + now.strftime("%Y-%m-%d:%H:%M:%S") + '-~~-' + now.strftime("%Y-%m-%d:%H:%M:%S")
file.close
#if dict.has_key('JOB_BASE_ID'):
#print 'JOB_BASE_ID-~~-JOB_BASE_ENDDATE-~~-JOB_BASE_NAME-~~-JOB_BASE_OGFS_EXITCODE-~~-JOB_BASE_OGFS_STDERR-~~-JOB_BASE_OGFS_STDOUT-~~-JOB_BASE_PHASE-~~-JOB_BASE_PHASE_COMPLETED_STEPS-~~-JOB_BASE_PHASE_ENDDATE-~~-JOB_BASE_PHASE_STARTDATE-~~-JOB_BASE_PHASE_STATUS-~~-JOB_BASE_PHASE_TOTAL_STEPS-~~-JOB_BASE_POLICY_NAME-~~-JOB_BASE_SCRIPT_NAME-~~-JOB_BASE_SCRIPT_SOURCE-~~-JOB_BASE_STARTDATE-~~-JOB_BASE_STATUS-~~-JOB_BASE_TICKET-~~-JOB_BASE_TYPE-~~-JOB_BASE_TZ-~~-JOB_BASE_USER'


