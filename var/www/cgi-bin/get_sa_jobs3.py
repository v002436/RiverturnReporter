#!/opt/opsware/agent/bin/python

import os
import sys
import time

sys.path.append("/opt/opsware/agent/pylibs")

import pytwist
from pytwist.com.opsware.script import ScriptJobOutput
from pytwist.com.opsware.job import JobRef
from pytwist.com.opsware.server import ServerRef
#import dump_obj

def initTwist():
	#username = os.environ['ISMTOOLUSERNAME']
	#password = os.environ['ISMTOOLPASSWORD']
	ts = pytwist.twistserver.TwistServer()
	try:
		ts.authenticate("jgoodman","svvs1234")
	except:
		print "Authentication failed."
		#sys.exit(2)
	return ts
	
def getJob(ts, jobid):
	f = pytwist.com.opsware.search.Filter()
	f.expression = 'JobInfoVO.pK EQUAL_TO "%s"' % jobid
	refs = ts.job.JobService.findJobRefs(f)
	#print refs
	#print 'COUNT::\t', len(refs)
	return refs

def getJobStatus(obj):
	status = 'STATUS_'
	for attr in dir(obj):
		if status == attr[0:len(status)] and getattr(obj, attr) == obj.status:
			return attr[len(status):]
	raise 'TODO: JobInfoVO status'
	
	

def getServerStatus(obj):
	status = '_STATUS'
	incl = '_INCLUSION_STATUS'
	for attr in dir(obj):
		if status == attr[-len(status):] and incl != attr[-len(incl):] and getattr(obj, attr) == obj.status:
			return attr[:-len(status)]
	raise 'TODO: JobServerInfoVO status'

def formatTime(epoch):
	if epoch:
		t = time.localtime(epoch)
		return time.strftime('%Y-%m-%d %H:%M:%S %Z', t)
	else:
		return None

def main(jobid):
	ts = initTwist()
	for ref in getJob(ts, jobid):
		vo = ts.job.JobService.getJobInfoVO(ref)
		print 'JOB_BASE_ID::\t', ref.id
		print 'JOB_BASE_NAME::\t', ref.name
		print 'JOB_BASE_TYPE::\t', vo.type
		print 'JOB_BASE_STATUS::\t', getJobStatus(vo)
		print 'JOB_BASE_USER::\t', vo.userName
		print 'JOB_BASE_TICKET::\t', vo.userTag
		print 'JOB_BASE_STARTDATE::\t', formatTime(vo.startDate), ''
		print 'JOB_BASE_ENDDATE::\t', formatTime(vo.endDate), ''
		if ref.name == 'Run Server Script':
			if vo.script:
				print 'JOB_BASE_SCRIPT_NAME::\t', vo.script.name
			if vo.source:
				print 'JOB_BASE_SCRIPT_SOURCE::\t', vo.source.replace('\n',' ')

		if isinstance(ref, pytwist.com.opsware.job.RecurringJobRef):
			print 'JOB_BASE_STARTDATE::\t', formatTime(vo.schedule.startDate), ''
			print 'JOB_BASE_ENDDATE::\t', formatTime(vo.schedule.endDate), ''
			print 'JOB_BASE_TZ::\t', vo.schedule.timezone, ''
			print 'JOB_BASE_CRON::\t', vo.schedule.cronSpec, ''
#			print dump_obj.dump_obj(vo)
			continue
		elif isinstance(ref, pytwist.com.opsware.job.ScheduledJobRef):
			print 'JOB_BASE_STARTDATE::\t', formatTime(vo.schedule.startDate), ''
#			print dump_obj.dump_obj(vo)
#			print dump_obj.dump_obj(vo.schedule)
			continue
		if not isinstance(ref, pytwist.com.opsware.job.JobRef):
			raise 'TODO: implement JobType', ref.__class__

		try:
			result = ts.job.JobService.getResult(ref)
		except  pytwist.com.opsware.job.UnknownJobTypeException:
#			print 'ERROR: pytwist unsupported', ref, ''
#			print dump_obj.dump_obj(vo)
			continue

		#if None != result.error:
			#raise 'TODO: job error'

		serverMap = {}
		if ref.name == 'Communication Test':
			print'JOB_COMM_STEPS::\t', result.totalSteps
			print'JOB_COMM_STEPS_COMPLETED::\t', result.totalCompleted
			print'JOB_COMM_TOTAL_DVCS::\t', result.totalDvcs
			print'JOB_COMM_TOTAL_FAILED::\t', result.totalFailed
			print'JOB_COMM_TOTAL_SKIPPED::\t', result.totalSkipped
			print'JOB_COMM_TOTAL_SUCCESS::\t', result.totalSuccess
			print'JOB_COMM_TOTAL_SUMMARY::\t', result.summary
		for e in result.elemResultInfo: 
			if e.error:
				#if e.element:
					#if s:
						#print'JOB_SERVER_NAME::\t', e.element.name, '::', s.server.id
				eerror = e.error
				#print 'ERROR MESSAGE::\t', eerror
				print 'JOB_SERVER_ERROR_MESSAGE::\t', eerror.message.replace('\n',' ')
			if ref.name == 'Run OGFS Script':
				scriptJobRef = JobRef(ref.id)
				serverScriptService = ts.script.OGFSScriptService
				scriptOutput = ScriptJobOutput()
				scriptOutput = serverScriptService.getOGFSScriptJobOutput(scriptJobRef)
				output = scriptOutput.getTailStdout()
				stderr = scriptOutput.getTailStderr()
				exitcode = scriptOutput.getExitCode()
				if output:
					print 'JOB_BASE_OGFS_STDOUT::\t', output.replace('\n',' ')
					print 'JOB_BASE_OGFS_STDERR::\t', stderr.replace('\n',' ')
					print 'JOB_BASE_OGFS_EXITCODE::\t', exitcode
			if ref.name == 'Communication Test':
				print'JOB_COMM_SERVER_NAME::\t', e.name
				print'JOB_COMM_OS::\t', e.osVersion
				print'JOB_COMM_AGENT_VER::\t', e.agentVersion
				print'JOB_COMM_IP::\t', e.primaryIP
				print'JOB_COMM_FACILITY::\t', e.facility
				print'JOB_COMM_DATA::\t', e.commTestJobData
				print'JOB_COMM_LIFECYCLE::\t', e.opswLifeCycle
				print'JOB_COMM_REACHABLE::\t', e.agentReachable
				print'JOB_COMM_CRYPTO_OK::\t', e.cryptoOk
				print'JOB_COMM_WAY_OK::\t', e.wayReachable
				print'JOB_COMM_SPIN_OK::\t', e.spinReachable
				print'JOB_COMM_WORD_OK::\t', e.wordReachable
				print'JOB_COMM_MID_OK::\t', e.midOk
				print'JOB_COMM_MESSAGE::\t', e.message
				print'JOB_COMM_ERROR::\t', e.error
				print'JOB_COMM_ELEMENT::\t', e.element
			if isinstance(e, pytwist.com.opsware.swmgmt.PhaseJobResult):
				print 'JOB_BASE_PHASE::\t', e.phaseType
				print 'JOB_BASE_PHASE_STATUS::\t', e.status
				print 'JOB_BASE_PHASE_COMPLETED_STEPS::\t', e.completedSteps
				print 'JOB_BASE_PHASE_TOTAL_STEPS::\t', e.totalSteps
				print 'JOB_BASE_PHASE_STARTDATE::\t', formatTime(e.startDate)
				print 'JOB_BASE_PHASE_ENDDATE::\t', formatTime(e.endDate)
			elif ref.name != 'Communication Test' and vo.type != 'program_apx.execute':
				if not serverMap.has_key(e.element.id):
					serverMap[e.element.id] = []
				serverMap[e.element.id].append(e)
		if ref.name == 'Remediate Policies':
			for s in result.jobInfo.jobArgs.policyAttachableMap:
				#print s.policies[0]
				if s.policies:
					polid = s.policies[0]
					policyservice = ts.swmgmt.SoftwarePolicyService
					vu = policyservice.getSoftwarePolicyVO(polid)
					print 'JOB_BASE_POLICY_NAME::\t', vu.name, ''
		for s in result.jobInfo.serverInfo:
			if ref.name != 'Communication Test' and vo.type != 'program_apx.execute':
				print 'JOB_SERVER_NAME::\t', s.server.name, '::', s.server.id
				#ts = pytwist.twistserver.TwistServer()
				if ref.name == 'Run Server Script':
					scriptJobRef = JobRef(ref.id)
					scriptServerRef = ServerRef(s.server.id)
					serverScriptService = ts.script.ServerScriptService
					scriptOutput = ScriptJobOutput()
					scriptOutput = serverScriptService.getServerScriptJobOutput(scriptJobRef, scriptServerRef)
					output = scriptOutput.getTailStdout()
					stderr = scriptOutput.getTailStderr()
					exitcode = scriptOutput.getExitCode()
					if output:
						print 'JOB_SERVER_SCRIPT_STDOUT::\t', output.replace('\n',' '), '::', s.server.id
						print 'JOB_SERVER_SCRIPT_STDERR::\t', stderr.replace('\n',' '), '::', s.server.id
						print 'JOB_SERVER_SCRIPT_EXITCODE::\t', exitcode, '::', s.server.id
				for e in serverMap[s.server.id]:
					if isinstance(e, pytwist.com.opsware.compliance.sco.SCODvcJobResult):
						if s.status == 1:
							print 'JOB_SERVER_SCRIPT_STATUS: SUCCESS', '::', s.server.id
						elif s.status == 2:
							print 'JOB_SERVER_SCRIPT_STATUS: WARNING', '::', s.server.id
						elif s.status == 3:
							print 'JOB_SERVER_SCRIPT_STATUS: FAILED', '::', s.server.id
						if e.error:
							print 'JOB_SERVER_SCRIPT_ERROR::\t', e.error.message.replace('\n',' '), '::', s.server.id
					elif isinstance(e, pytwist.com.opsware.swmgmt.DeviceJobResult):
						print 'JOB_SERVER_REMEDIATE_PHASE::\t', e.phase, '::', s.server.id
						print 'JOB_SERVER_REMEDIATE_STATUS::\t', e.status, '::', s.server.id
						print 'JOB_SERVER_REMEDIATE_MESSAGE::\t', e.message.defaultMsg, '::', s.server.id
						print 'JOB_SERVER_REMEDIATE_ERROR::\t', e.error, '::', s.server.id
						print 'JOB_SERVER_REMEDIATE_STARTDATE::\t', formatTime(e.startDate), '::', s.server.id
						print 'JOB_SERVER_REMEDIATE_ENDDATE::\t', formatTime(e.endDate), '::', s.server.id
						if e.errorInfo:
							print 'JOB_SERVER_REMEDIATE_ERROR::\t',e.errorInfo.key, '::', s.server.id
						for f in e.warningInfos:
							print 'JOB_SERVER_REMEDIATE_WARNING::\t',f.key, '::', s.server.id
					elif isinstance(e, pytwist.com.opsware.swmgmt.ScriptJobResult):
						if ref.name != 'Uninstall Software' and ref.name != 'Install Software' and ref.name != 'Reboot Servers' and ref.name != 'Remediate Policies':
							print 'JOB_SERVER_SCRIPT_NAME::\t', e.script.name, '::', s.server.id
						print 'JOB_SERVER_SCRIPT_ACTION::\t',e.action, '::', s.server.id
						print 'JOB_SERVER_SCRIPT_STATUS::\t',e.status, '::', s.server.id
						print 'JOB_SERVER_SCRIPT_STARTDATE::\t', formatTime(e.startDate), '::', s.server.id
						print 'JOB_SERVER_SCRIPT_ENDDATE::\t', formatTime(e.endDate), '::', s.server.id
					elif isinstance(e, pytwist.com.opsware.script.ScriptJobTargetResult):
						if None == e.error:
							status = 'SUCCESS'
						else:
							status = 'FAILED'
						print 'JOB_SERVER_SCRIPT_STATUS::\t', status
					elif isinstance(e, pytwist.com.opsware.swmgmt.UnitJobResult):
						print 'JOB_SERVER_UNIT_NAME::\t', e.unitName, '::', s.server.id
						print 'JOB_SERVER_UNIT_ACTION::\t', e.action, '::', s.server.id
						print 'JOB_SERVER_UNIT_RESULT::\t', e.result, '::', s.server.id
						print 'JOB_SERVER_UNIT_STATUS::\t', e.status, '::', s.server.id
						print 'JOB_SERVER_UNIT_REBOOT::\t', e.reboot, '::', s.server.id
						if e.output:
							print 'JOB_SERVER_UNIT_OUTPUT::\t', e.output.replace('\n',' '), '::', s.server.id
						else:
							print 'JOB_SERVER_UNIT_OUTPUT::\t', e.output, '::', s.server.id
						for i in e.messageInfos:
							print 'JOB_SERVER_UNIT_ERROR::\t', i.key, '::', s.server.id
						print 'JOB_SERVER_UNIT_STARTDATE::\t', formatTime(e.startDate), '::', s.server.id
						print 'JOB_SERVER_UNIT_ENDDATE::\t', formatTime(e.endDate), '::', s.server.id
					else:
						raise 'TODO: element', e.__class__, dir(e)
			else:
				print 'JOB_SERVER_NAME::\t', s.server.name, '::', s.server.id
if '__main__' == __name__:
	main(sys.argv[1])

