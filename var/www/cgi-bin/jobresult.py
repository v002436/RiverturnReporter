#!/opt/opsware/agent/bin/python

import os
import sys
import time

sys.path.append("/opt/opsware/agent/pylibs")

import pytwist

#from pytwist import *
from pytwist.com.opsware.script import ScriptJobOutput
from pytwist.com.opsware.job import JobRef
from pytwist.com.opsware.server import ServerRef
# Check for the command-line argument.
print len(sys.argv)
if len(sys.argv) != 3:
	print 'You must specify JobId and ServerId.'
	print "Example: " + "python get_script_output.py" + " " + "JobId" + " " + "ServerId"
	sys.exit(2)
#searchCommand = sys.argv[0]
searchJobId = sys.argv[1]
searchServerId = sys.argv[2]
#print "User parameters: "
#print "Command: "+ searchCommand
print "JobId: "+ searchJobId
print "ServerId: "+ searchServerId
# Create a TwistServer object.
ts = pytwist.twistserver.TwistServer()
# Authenticate by passing an SA username and password
try:
	ts.authenticate('jgoodman','svvs1234')
except:
	print "Authentication failed."
	sys.exit(2)
#Get the references to the services used by the script
scriptJobRef = JobRef(searchJobId)
scriptServerRef = ServerRef(searchServerId)
serverScriptService = ts.script.ServerScriptService
scriptOutput = ScriptJobOutput()
scriptOutput = serverScriptService.getServerScriptJobOutput(scriptJobRef, scriptServerRef)
print scriptOutput.getTailStdout()
#####script end#####
