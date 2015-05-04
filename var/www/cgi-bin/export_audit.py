#!/opt/opsware/agent/bin/python

import sys
import os
import time
import datetime
import re

now = datetime.datetime.now()
sys.path.insert(0, '/opt/opsware/agent/pylibs')

from pytwist import *
from pytwist.com.opsware.compliance.sco import AuditResultRef

def main():
    if len(sys.argv) < 2:
        print 'usage: %s <Audit result id>' % sys.argv[0]
        sys.exit(1)
    
    global serverid
    global servername
    global ruleid
    global auditid
    global year
    ruleid = ''
    serverid = ''
    servername = ''
    year = ''
    auditid = ''

    
    auditrefid = sys.argv[1]
    #print auditrefid
    ts = twistserver.TwistServer()
    ts.authenticate("jgoodman","svvs1234")

    client = streamable.StreamableClient(ts)
    ref = AuditResultRef(auditrefid)
    refs = ref
    args = 'sudo rm -rf /usr/AIR/tmp/audits/*'
    out = os.system(args)
    client.exportToFile(ref, '/usr/AIR/tmp/audits/' + auditrefid)

    #stream = client.exportStreamable(refs)

    #fd = open('/usr/AIR/tmp/audits/' + auditrefid, 'a')
    #while 1:
      # blob = stream.input_file.read()
       #if not blob:
  	  #break;
       #print>>f, blob.replace('\n','').replace('\W','').replace(' ','_').replace('"AuditResult":','\n~~"AuditResult":').replace('"Target":','\n~~"TargetResults":').replace('"Results":','\n~~"Results":').replace('"Rule":','\n~~"Rule":').replace(',"Source":','\n~~"Source":')
  
    fd = open('/usr/AIR/tmp/audits/' + auditrefid, 'r')
    fa = open('/usr/AIR/tmp/audits/' + auditrefid + '.AUDIT', 'a')
    fs = open('/usr/AIR/tmp/audits/' + auditrefid + '.SOURCE', 'a')
    ft = open('/usr/AIR/tmp/audits/' + auditrefid + '.SERVER', 'a')
    fr = open('/usr/AIR/tmp/audits/' + auditrefid + '.RULE', 'a')
    fra = open('/usr/AIR/tmp/audits/' + auditrefid + '.RULEATTR', 'a')
    frs = open('/usr/AIR/tmp/audits/' + auditrefid + '.RULESTAT', 'a')	
    frss = open('/usr/AIR/tmp/audits/' + auditrefid + '.RULESCRIPT', 'a')		
    for line in fd:
      list = line.replace('","','"~~"').replace('\n','').replace('\W','').replace(' ','_').replace('"AuditResult":','\n').replace('"Target":','\n').replace('"Results":','\n').replace('"Rule":','\n"Rule":').replace('"Status":','\n"Status":').replace('"Source":','\nSource').replace('"key":','\n"key":').replace('}','').replace('{','').replace('[','').replace(']','').replace('"Server":"ID"','"ServerID":').replace('"Rule":"ID":','"RuleID":').replace('"','').replace('RuleDetails:','').replace('Mon_', '').replace('Tue_', '').replace('Wed_', '').replace('Thu_', '').replace('Fri_', '').replace('Sat_', '').replace('Sun_', '').replace('Jan_', '!!!01-').replace('Feb_', '!!!02-').replace('Mar_', '!!!03-').replace('Apr_', '!!!04-').replace('May_', '!!!05-').replace('Jun_', '!!!06-').replace('Jul_', '!!!07-').replace('Aug_', '!!!08-').replace('Sep_', '!!!09-').replace('Oct_', '!!!10-').replace('Nov_', '!!!11-').replace('Dec_', '!!!12-').replace('SourceServerID', 'SourceID')
      list = list.split('\n')
      for li in list:
        li = re.sub(r'~~$', '', li)
        print li
        if li.startswith('R') or li.startswith('A') or li.startswith('S') or li.startswith('c') or li.startswith('k'):
          if 'AuditID' in li:
            lo = li.split('~~')
            auditid = lo[2]
            auditid = auditid.replace('ID:','')
            #print auditid
            year = lo[1]
            year = re.sub(r'date:!!!\d\d-\d\d_\d\d:\d\d:\d\d_UTC_', '', year) + '-'
            li = li.replace('_',':',1)
            #print year
            li = re.sub(r'_UTC_20\d\d', '', li)
            #print li.replace('createdBy:','').replace('date:','').replace(',TargetResults:','').replace('~~TargetResults:','').replace('AuditID:','').replace('ID:','').replace('DisplayName:','').replace('TotalDifferences:','').replace('!!!', year) + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
            print>>fa, li.replace('createdBy:','').replace('date:','').replace(',TargetResults:','').replace('~~TargetResults:','').replace('AuditID:','').replace('ID:','').replace('DisplayName:','').replace('TotalDifferences:','').replace('!!!', year) + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
          if 'Snapshot:ID' in li:
            li = re.sub(r'_UTC_20\d\d"', '', li)
            #print auditid + '~~' + li.replace('Snapshot:ID:','').replace('Name:','').replace('~~TargetResults:','~~').replace('TargetResults:','~~').replace('!!!', year) + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
            print>>fs, auditid + '~~' + li.replace('Snapshot:ID:','').replace('Name:','').replace('~~TargetResults:','~~').replace(',TargetResults:','~~').replace('!!!', year) + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
          if 'ServerID' in li:
            #print li
            lo = li.split('~~')
            serverid = lo[0]
            serverid = serverid.replace('ServerID::','')
            servername = lo[1]
            servername = re.sub(r',TargetStatus:\w+', '', servername)
            servername = servername.replace('Name:','')
            servername = servername.replace(',TargetResults:','')
            #print serverid, servername
            li = re.sub(r'_UTC_20\d\d"', '', li)
            #print auditid + '~~' + li.replace('ServerID::','').replace(',TargetResults:','').replace('Name:','').replace(',TargetStatus:','~~').replace('Rules:run:','').replace('passed:','').replace('failed:','').replace(',TotalDifferences:','~~').replace('!!!', year) + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
            print>>ft, auditid + '~~' + li.replace('ServerID::','').replace(',TargetResults:','').replace('Name:','').replace(',TargetStatus:','~~').replace('Rules:run:','').replace('passed:','').replace('failed:','').replace(',TotalDifferences:','~~').replace('!!!', year) + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
          if 'RuleID:' and 'referenceID:' in li:
            #print li
            lo = li.split('~~')
            ruleid = lo[0]
            ruleid = ruleid.replace('RuleID:','')
            #print ruleid
            li = re.sub(r'_UTC_20\d\d"', '', li)
            #print auditid + '~~' + serverid + '~~' + servername + '~~' + li.replace('RuleID:','').replace('referenceID:','').replace('type:','').replace('Description:','').replace('!!!', year) + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
            print>>fr, auditid + '~~' + serverid + '~~' + servername + '~~' + li.replace('RuleID:','').replace('referenceID:','').replace('type:','').replace('Description:','').replace('!!!', year) + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
          if li.startswith('key:'):
            #print li
            le = li.split('key:')
            li = re.sub(r'_UTC_20\d\d"', '', li)
            #print auditid + '~~' + serverid + '~~' + servername + '~~' + ruleid + '~~' + li.replace('key:','').replace('~~value:','~~').replace('!!!', year) + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
            print>>fra, auditid + '~~' + serverid + '~~' + servername + '~~' + ruleid + '~~' + li.replace('key:','').replace('~~value:','~~').replace('!!!', year) + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")       
          if 'Status' and 'OnlyOnSource' in li:
            #le = li.split('~~')
            #print li
            li = re.sub(r'_UTC_20\d\d"', '', li)
            #print auditid + '~~' + serverid + '~~' + servername + '~~' + ruleid + '~~' + li.replace('Status:','').replace('ResultDetails:OnlyOnSource:','').replace(',OnlyOnTarget:','~~').replace(',OnBothButDifferent:','~~').replace('!!!', year).replace(',','') + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
            print>>frs, auditid + '~~' + serverid + '~~' + servername + '~~' + ruleid + '~~' + li.replace('Status:','').replace('ResultDetails:OnlyOnSource:','').replace(',OnlyOnTarget:','~~').replace(',OnBothButDifferent:','~~').replace('!!!', year).replace(',','') + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
          if 'Status' and 'ResultDetails:DisplayName' in li:
            #le = li.split('~~')
            #print li
            li = re.sub(r'_UTC_20\d\d"', '', li)
            #print auditid + '~~' + serverid + '~~' + servername + '~~' + ruleid + '~~' + li.replace('!!!', year).replace('Status:','').replace('ResultDetails:DisplayName:','').replace('PolicyValue:','').replace('Operator:','').replace('ActualValue:','').replace('ScriptOutput:stdout:','').replace('stderr:','~~') + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
            print>>frss, auditid + '~~' + serverid + '~~' + servername + '~~' + ruleid + '~~' + li.replace('!!!', year).replace('Status:','').replace('ResultDetails:DisplayName:','').replace('PolicyValue:','').replace('Operator:','').replace('ActualValue:','').replace('ScriptOutput:stdout:','').replace('stderr:','~~') + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S") + '~~' + now.strftime("%Y-%m-%d:%H:%M:%S")
			
			
if __name__ == '__main__':
    main()	

	