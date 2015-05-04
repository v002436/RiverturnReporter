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
	#print 'COUNT:\t', len(refs)
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
		print 'JOB:\t', ref.id, '\t\t'
		print '\tNAME:\t', ref.name, '\t'
		print '\tTYPE:\t', vo.type, '\t'
		print '\tSTATUS:\t', getJobStatus(vo), '\t'
		print '\tUSER:\t', vo.userName, '\t'
		print '\tTICKET:\t', vo.userTag, '\t'
		if ref.name == 'Run Server Script':
			if vo.script:
				print '\tScript:\t', vo.script.name, '\t'
			if vo.source:
				print '\tScript Source:\t', vo.source.replace('\n','\n\t\t\t'), '\t\t'

		if isinstance(ref, pytwist.com.opsware.job.RecurringJobRef):
			print '\tSTARTDATE:\t', formatTime(vo.schedule.startDate), '\t\t\t'
			print '\tENDDATE:\t', formatTime(vo.schedule.endDate), '\t\t\t'
			print '\tTZ:\t', vo.schedule.timezone, '\t\t\t'
			print '\tCRON:\t', vo.schedule.cronSpec, '\t\t\t'
#			print dump_obj.dump_obj(vo)
			continue
		elif isinstance(ref, pytwist.com.opsware.job.ScheduledJobRef):
			print '\tSTARTDATE:\t', formatTime(vo.schedule.startDate), '\t\t\t'
#			print dump_obj.dump_obj(vo)
#			print dump_obj.dump_obj(vo.schedule)
			continue
		if not isinstance(ref, pytwist.com.opsware.job.JobRef):
			raise 'TODO: implement JobType', ref.__class__

		try:
			result = ts.job.JobService.getResult(ref)
		except  pytwist.com.opsware.job.UnknownJobTypeException:
#			print '\tERROR: pytwist unsupported', ref, '\t\t\t'
#			print dump_obj.dump_obj(vo)
			continue

		#if None != result.error:
			#raise '\tTODO: job error'

		serverMap = {}
		if ref.name == 'Communication Test':
			print'\tTOTAL STEPS:\t', result.totalSteps, '\t\t'
			print'\tTOTAL COMPLETED:\t', result.totalCompleted, '\t\t'
			print'\tTOTAL DVCS:\t', result.totalDvcs, '\t\t'
			print'\tTOTAL FAILED:\t', result.totalFailed, '\t\t'
			print'\tTOTAL SKIPPED:\t', result.totalSkipped, '\t\t'
			print'\tTOTAL SUCCESS:\t', result.totalSuccess, '\t\t'
			print'\tTOTAL SUMMARY:\t', result.summary, '\t\t'
		for e in result.elemResultInfo: 
			if e.error:
				print'\tSERVER:\t', e.element.name, '\t'
				eerror = e.error
				#print '\t\tERROR MESSAGE:\t', eerror
				print '\t\tERROR MESSAGE:\t', eerror.message.replace('\n','\n\t\t\t'), '\t\t'
			if ref.name == 'Run OGFS Script':
				scriptJobRef = JobRef(ref.id)
				serverScriptService = ts.script.OGFSScriptService
				scriptOutput = ScriptJobOutput()
				scriptOutput = serverScriptService.getOGFSScriptJobOutput(scriptJobRef)
				output = scriptOutput.getTailStdout()
				stderr = scriptOutput.getTailStderr()
				exitcode = scriptOutput.getExitCode()
				if output:
					print '\t\tSTDOUT:\t', output.replace('\n','\n\t\t\t'), '\t\t'
					print '\t\tSTDERR:\t', stderr.replace('\n','\n\t\t\t'), '\t\t'
					print '\t\tEXITCODE:\t', exitcode, '\t\t'
			if ref.name == 'Communication Test':
				print'\tSERVER:\t', e.name, '\t'
				print'\t\tOS:\t', e.osVersion, '\t\t\t'
				print'\t\tAGENT VER:\t', e.agentVersion, '\t\t'
				print'\t\tIP:\t', e.primaryIP, '\t\t'
				print'\t\tFACILITY:\t', e.facility, '\t\t'
				print'\t\tDATA:\t', e.commTestJobData, '\t\t'
				print'\t\tLIFECYCLE:\t', e.opswLifeCycle, '\t\t'
				print'\t\tREACHABLE:\t', e.agentReachable, '\t\t'
				print'\t\tCRYPTO OK:\t', e.cryptoOk, '\t\t'
				print'\t\tWAY OK:\t', e.wayReachable, '\t\t'
				print'\t\tSPIN OK:\t', e.spinReachable, '\t\t'
				print'\t\tWORD OK:\t', e.wordReachable, '\t\t'
				print'\t\tMID OK:\t', e.midOk, '\t\t'
				print'\t\tMESSAGE:\t', e.message, '\t\t'
				print'\t\tERROR:\t', e.error, '\t\t'
				print'\t\tELEMENT:\t', e.element, '\t\t'
			if isinstance(e, pytwist.com.opsware.swmgmt.PhaseJobResult):
				print '\tPHASE:\t', e.phaseType, e.status, '\t\t\t'
				print '\t\tSTEPS:\t', e.completedSteps, e.totalSteps, '\t\t'
				print '\t\tSTARTDATE:\t', formatTime(e.startDate), '\t\t'
				print '\t\tENDDATE:\t', formatTime(e.endDate), '\t\t'
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
					print '\tPOLICY:\t', vu.name, '\t\t\t'
		for s in result.jobInfo.serverInfo:
			if ref.name != 'Communication Test' and vo.type != 'program_apx.execute':
				print '\tSERVER:\t', s.server.name, '\t'
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
						print '\t\tSTDOUT:\t', output.replace('\n','\n\t\t\t'), ''
						print '\t\tSTDERR:\t', stderr.replace('\n','\n\t\t\t'), ''
						print '\t\tEXITCODE:\t', exitcode
				for e in serverMap[s.server.id]:
					if isinstance(e, pytwist.com.opsware.compliance.sco.SCODvcJobResult):
						if s.status == 1:
							print '\t\tSTATUS: SUCCESS', '\t\t'
						elif s.status == 2:
							print '\t\tSTATUS: WARNING', '\t\t'
						elif s.status == 3:
							print '\t\tSTATUS: FAILED', '\t\t'
						if e.error:
							print '\t\tERROR:\t', e.error.message.replace('\n','\n\t\t\t'), '\t\t'
					elif isinstance(e, pytwist.com.opsware.swmgmt.DeviceJobResult):
						print '\t\tPHASE:\t', e.phase, '\t\t'
						print '\t\t\tSTATUS:\t', e.status, '\t'
						print '\t\t\tMESSAGE:\t', e.message.defaultMsg, '\t'
						print '\t\t\tERROR:\t', e.error, '\t'
						print '\t\t\tSTARTDATE:\t', formatTime(e.startDate), '\t'
						print '\t\t\tENDDATE:\t', formatTime(e.endDate), '\t'
						if e.errorInfo:
							print '\t\t\tERROR INFO:\t',e.errorInfo.key, '\t\t'
						for f in e.warningInfos:
							print '\t\t\tWARNING INFO:\t',f.key, '\t'
					elif isinstance(e, pytwist.com.opsware.swmgmt.ScriptJobResult):
						if ref.name != 'Uninstall Software' and ref.name != 'Install Software' and ref.name != 'Reboot Servers':
							print '\t\tSCRIPT NAME:\t', e.script.name, '\t\t'
						print '\t\tSCRIPT ACTION:\t',e.action, '\t\t'
						print '\t\tSCRIPT STATUS:\t',e.status, '\t\t'
						print '\t\t\tSTARTDATE:\t', formatTime(e.startDate), '\t\t'
						print '\t\t\tENDDATE:\t', formatTime(e.endDate), '\t'
					elif isinstance(e, pytwist.com.opsware.script.ScriptJobTargetResult):
						if None == e.error:
							status = 'SUCCESS'
						else:
							status = 'FAILED'
						print '\t\tSCRIPTJOB:\t', status
					elif isinstance(e, pytwist.com.opsware.swmgmt.UnitJobResult):
						print '\t\tUNIT NAME:\t', e.unitName, '\t\t'
						print '\t\t\tUNIT ACTION:\t', e.action, '\t'
						print '\t\t\tUNIT RESULT:\t', e.result, '\t'
						print '\t\t\tUNIT STATUS:\t', e.status, '\t'
						print '\t\t\tUNIT REBOOT:\t', e.reboot, '\t'
						print '\t\t\tUNIT OUTPUT:\t', e.output, '\t'
						for i in e.messageInfos:
							print '\t\t\tUNIT ERROR:\t', i.key, '\t'
						print '\t\t\tSTARTDATE:\t', formatTime(e.startDate), '\t'
						print '\t\t\tENDDATE:\t', formatTime(e.endDate), '\t'
					else:
						raise 'TODO: element', e.__class__, dir(e)
			else:
				print '\tSERVER:\t', s.server.name, '\t\t\t'
if '__main__' == __name__:
	main(sys.argv[1])

