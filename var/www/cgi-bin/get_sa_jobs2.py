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
	argss = 'rm -rf /usr/AIR/tmp/all_jobs.txt'
	outt = os.system(argss)
	if outt < 1:
		print '<p>File cleanup succeeded!</p>'
		print 'EXITCODE', outt, '\n'
	else:
		print '<p>File cleanup failed!</p>'
		print 'EXITCODE', outt, '\n'
	f = pytwist.com.opsware.search.Filter()
	f.expression = 'JobInfoVO.pK CONTAINS "%s"' % jobid
	refs = ts.job.JobService.findJobRefs(f)
	file = open('/usr/AIR/tmp/all_jobs.txt', 'a')
	print>>file, refs
	file.close
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
	argss = 'rm -rf /usr/AIR/tmp/exec_sa_jobs.txt /usr/AIR/tmp/sa_jobs/*'
	outt = os.system(argss)
	if outt < 1:
		print '<p>File cleanup succeeded!</p>'
		print 'EXITCODE', outt, '\n'
	else:
		print '<p>File cleanup failed!</p>'
		print 'EXITCODE', outt, '\n'
	argss = './parse2.sh  >> /usr/AIR/tmp/exec_sa_jobs.txt'
	outt = os.system(argss)
	if outt < 1:
		print '<p>File parse succeeded!</p>'
		print 'EXITCODE', outt, '\n'
	else:
		print '<p>File parse failed!</p>'
		print 'EXITCODE', outt, '\n'
	#file = open('/usr/AIR/tmp/exec_all_jobs.txt', 'a')
	ts = initTwist()
	getJob(ts, jobid)
	#for ref in getJob(ts, jobid):
		#vo = ts.job.JobService.getJobInfoVO(ref)
		#jobid = ref.id
		#print jobid
		#args = 'sudo /var/www/cgi-bin/get_sa_jobs3.py ' + str(jobid) + ' > sa_jobs/' + str(jobid)
		#print>>file, args
		#out = os.system(args)
		#if out < 1:
		#	print '<p>Process of file %s succeeded!</p>' % (jobid)
		#	print 'EXITCODE', out, '\n'
		#else:
		#	print '<p>Process of file %s failed!</p>' % (jobid)
		#	print 'EXITCODE', out, '\n'
	#file.close

if '__main__' == __name__:
	main(sys.argv[1])


