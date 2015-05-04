#!/usr/bin/perl
#print "Checking to see if batch process is running.\n";
if ( `ps -ef | grep spawn_luigi.py | grep -v grep | grep -v luigid` ){ print "Luigi already running, try later.\n"; exit 1;}else{ print "Luigi batch process is not running, continue...\n"; }
#print "Cleaning up old files...\n Tail the file /usr/AIR/tmp/luigi_sa_data_load.log for progress\n";
$date = `date +"%m-%d-%Y %H:%M" | sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
$last_log = `ls -l /usr/AIR/tmp | grep luigi_sa_data_load.log | awk '{ print \$6\" \"\$7\" \"\$8 }' | sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
`echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
`echo "<tr><td align=center>$last_log</td><td align=center>File Cleanup</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
`echo "insert into AIR_LOADER_LOG (LAST_RUN,THIS_RUN, STATUS, SERVER_COUNT,SERVER_COMPLETE,SERVER_FAILED,JOB_COUNT,JOB_COMPLETE,JOB_FAILED,AUDIT_COUNT,AUDIT_COMPLETE,AUDIT_FAILED) values ('$last_log','$date','File Cleanup','0','0','0','0','0','0','0','0','0'); commit;" > /usr/AIR/tmp/create_log_entry.sql`;
`java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/AIR/tmp/create_log_entry.sql`;
$last_load_id = `java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports  /usr/openreports-tomcat/database/hsql/get_last_air_load_id.sql | sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
$rm_out = `rm -rf /usr/AIR/tmp/sa_interfaces.txt /usr/AIR/tmp/all_sa_servers_by_id /usr/AIR/tmp/server.txt /usr/AIR/tmp/luigi_saserver_data_load.log /usr/AIR/tmp/luigi_sajob_data_load.log /usr/AIR/tmp/exec_all_sa_servers.txt /usr/AIR/tmp/sa_multi`;
print "Getting list of active servers in SA.\n";
$list_out = `/var/www/cgi-bin/get_sa_server_list.py 2<&1`;
if ( $? == 0 ){
	if ( $? == 0 ){
		@list = `cat /usr/AIR/tmp/all_sa_servers_by_id`;
		$server_count = `cat /usr/AIR/tmp/all_sa_servers_by_id | wc -l | sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
		`echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
		`echo "<tr><td align=center>$last_log</td><td align=center>Find Servers</td><td align=center>$server_count</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
		`echo "update AIR_LOADER_LOG set Status = 'Find Servers',SERVER_COUNT = '$server_count' where load_id = $last_load_id; commit;" > /usr/AIR/tmp/update_log_entry.sql`;
		`java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/AIR/tmp/update_log_entry.sql`;
		for $name (@list){
			chomp $name;
			print "Exporting details for $name.\n";
			$out = `echo \"/var/www/cgi-bin/get_sa_data_blank2.pl '$name' 2<&1\" >> /usr/AIR/tmp/exec_all_sa_servers.txt`;
			if ( $? == 0 ){
				#`echo "Export of server $name from SA succeeded.\n" >> /usr/AIR/tmp/luigi_sa_data_load.log`;
			}else{
				`echo "Export of all server $name from SA failed!\n" >> /usr/AIR/tmp/luigi_sa_data_load.log`;
			}
		}
		`/usr/local/bin/python /var/www/cgi-bin/spawn_luigi.py >> /usr/AIR/tmp/luigi_saserver_data_load.log 2<&1 &`;
		if ( $? == 0 ){
			print "Luigi batch process started to export device details and interface data.\n";
			$test = "true";
			while ( `ps -ef | grep spawn_luigi.py | grep -v grep | grep -v luigid` ){
				#flock($fh, LOCK_EX) or "Cannot lock file - $!\n";
				#if ( is_file_locked($gTestQueuePath) ){ $test = 0;} else { $test = 1;}
				#close $fh or "Cannot close";
				sleep 15;
				$server_processed = `ls /usr/AIR/tmp/sa_multi | wc -l| sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
				`echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
				`echo "<tr><td align=center>$last_log</td><td align=center>Extract Servers</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
				`echo "update AIR_LOADER_LOG set Status = 'Find Servers',SERVER_COUNT = '$server_count', server_complete = '$server_processed' where load_id = $last_load_id; commit;" > /usr/AIR/tmp/update_log_entry.sql`;
				`java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/AIR/tmp/update_log_entry.sql`;
				
			}
			`for i in \`find /usr/AIR/tmp/ -name server.txt\`; do cat \$i >> /usr/AIR/tmp/server.txt; done`;
			`for i in \`find /usr/AIR/tmp/ -name sa_interfaces.txt\`; do cat \$i >> /usr/AIR/tmp/sa_interfaces.txt; done`;
			`for i in \`find /usr/AIR/tmp/ -name sa_installed_software.txt\`; do cat \$i >> /usr/AIR/tmp/sa_installed_software.txt; done`;
			`echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			`echo "<tr><td align=center>$last_log</td><td align=center>Load Server Data</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			`echo "update AIR_LOADER_LOG set Status = 'Find Servers',SERVER_COUNT = '$server_count', server_complete = '$server_processed' where load_id = $last_load_id; commit;" > /usr/AIR/tmp/update_log_entry.sql`;
			`java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/AIR/tmp/update_log_entry.sql`;			
			`cp /usr/AIR/tmp/server.txt /usr/AIR/tmp/sa_interfaces.txt /usr/AIR/tmp/sa_installed_software.txt /tmp`;
			`chmod -R 755 /usr/AIR/tmp/*.txt /usr/AIR/tmp/sa_multi /tmp/*`;
			print "Importing data into AIR database.\n";
			$servero = `/var/www/cgi-bin/import_data_blank.py server.sql`;
			if ( $? == 0 ){ print "$servero\n"; }else{ print "Import of server data failed.\n"; };
			$interfaceo = `/var/www/cgi-bin/import_data_blank.py sa_interfaces.sql`;
			if ( $? == 0 ){ print "Import Complete.\n $interfaceo\n"; }else{ print "Import Complete.\n Import of interface data failed.\n"; };	
			$instswo = `/var/www/cgi-bin/import_data_blank.py sa_installed_software.sql`;
			if ( $? == 0 ){ print "Import Complete.\n $instswo\n"; }else{ print "Import Complete.\n Import of installed software data failed.\n"; };
			`echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			`echo "<tr><td align=center>$last_log</td><td align=center>Load Server Data Complete</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			`echo "update AIR_LOADER_LOG set Status = 'Find Servers',SERVER_COUNT = '$server_count', server_complete = '$server_processed' where load_id = $last_load_id; commit;" > /usr/AIR/tmp/update_log_entry.sql`;
			`java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/AIR/tmp/update_log_entry.sql`;
		}else{
			print "Luigi batch process of server data startup failed.\n";
		}
		$server_failed = $server_count - $server_processed;
		print "Getting list of jobs in SA.\n";
		`/var/www/cgi-bin/get_sa_jobs2.py 0  >> /usr/AIR/tmp/luigi_sa_data_load.log`;
		$job_count = `cat /usr/AIR/tmp/exec_sa_jobs.txt | wc -l| sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
		`echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
		`echo "<tr><td align=center>$last_log</td><td align=center>Find Jobs</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center><a href="/cgi-bin/get_air_logs.pl?log_name=luigi_saserver_data_load.log">$server_failed</a></td><td align=center>$job_count</td><td align=center>...</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
		`echo "update AIR_LOADER_LOG set Status = 'Find Servers',SERVER_COUNT = '$server_count', server_complete = '$server_processed', server_failed = '$server_failed' where load_id = $last_load_id; commit;" > /usr/AIR/tmp/update_log_entry.sql`;
		`java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/AIR/tmp/update_log_entry.sql`;
		print "Extracting job data from SA.\n";
		`/usr/local/bin/python /var/www/cgi-bin/spawn_luigi2.py >> /usr/AIR/tmp/luigi_sajob_data_load.log 2<&1 &`;
		if ( $? == 0 ){
			print "Luigi batch process started to export job details.\n";
			$test = "true";
			while ( `ps -ef | grep spawn_luigi2.py | grep -v grep | grep -v luigid` ){
				#flock($fh, LOCK_EX) or "Cannot lock file - $!\n";
				#if ( is_file_locked($gTestQueuePath) ){ $test = 0;} else { $test = 1;}
				#close $fh or "Cannot close";
				sleep 10;
				$job_processed = `ls /usr/AIR/tmp/sa_jobs | wc -l| sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
				`echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
				`echo "<tr><td align=center>$last_log</td><td align=center>Get Job Data</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center><a href="/cgi-bin/get_air_logs.pl?log_name=luigi_saserver_data_load.log">$server_failed</a></td><td align=center>$job_count</td><td align=center>$job_processed</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
				`echo "update AIR_LOADER_LOG set Status = 'Find Servers',SERVER_COUNT = '$server_count', server_complete = '$server_processed', server_failed = '$server_failed', job_count = '$job_count', job_complete = '$job_processed' where load_id = $last_load_id; commit;" > /usr/AIR/tmp/update_log_entry.sql`;
				`java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/AIR/tmp/update_log_entry.sql`;
			}
			print "Cleaning up job details.\n";
			`/var/www/cgi-bin/job_readiness.sh >> /usr/AIR/tmp/luigi_sa_data_load.log 2<&1 &`;
			sleep 10;
			print "Processing job details.\n";
			`/usr/local/bin/python /var/www/cgi-bin/spawn_luigi3.py >> /usr/AIR/tmp/luigi_sajob_data_load.log 2<&1 &`;
			if ( $? == 0 ){
			print "Luigi batch process started to prepare job data for AIR data load.\n";
			$test = "true";
			while ( `ps -ef | grep spawn_luigi3.py | grep -v grep | grep -v luigid` ){
				#flock($fh, LOCK_EX) or "Cannot lock file - $!\n";
				#if ( is_file_locked($gTestQueuePath) ){ $test = 0;} else { $test = 1;}
				#close $fh or "Cannot close";
				sleep 20;
				$job_processed = `ls /usr/AIR/tmp/sa_jobs | grep BASE | wc -l| sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
				`echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
				`echo "<tr><td align=center>$last_log</td><td align=center>Prepare Job Data</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center><a href="/cgi-bin/get_air_logs.pl?log_name=luigi_saserver_data_load.log">$server_failed</a></td><td align=center>$job_count</td><td align=center>$job_processed</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
				`echo "update AIR_LOADER_LOG set Status = 'Find Servers',SERVER_COUNT = '$server_count', server_complete = '$server_processed', server_failed = '$server_failed', job_count = '$job_count', job_complete = '$job_processed' where load_id = $last_load_id; commit;" > /usr/AIR/tmp/update_log_entry.sql`;
				`java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/AIR/tmp/update_log_entry.sql`;
			}
			sleep 20;
			print "Processing job files for load.\n";
			`rm -rf  /usr/AIR/tmp/sa_server.txt /usr/AIR/tmp/sa_comm.txt /usr/AIR/tmp/sa_jobs.txt`;
			print "Test1\n";
			`for i in \`ls /usr/AIR/tmp/sa_jobs | grep COMM\`; do cat /usr/AIR/tmp/sa_jobs/\$i >> /usr/AIR/tmp/sa_comm.txt; done`;
			print "Test2\n";
			`for i in \`ls /usr/AIR/tmp/sa_jobs | grep BASE\`; do cat /usr/AIR/tmp/sa_jobs/\$i >> /usr/AIR/tmp/sa_jobs.txt; done`;
			print "Test3\n" ;
			`for i in \`ls /usr/AIR/tmp/sa_jobs | grep SERVER\`; do cat /usr/AIR/tmp/sa_jobs/\$i | tr -d '\' >> /usr/AIR/tmp/sa_server.txt; done`;
			`rm -rf  /tmp/sa_server.txt /tmp/sa_comm.txt /tmp/sa_jobs.txt`;
			`cp /usr/AIR/tmp/sa_server.txt /usr/AIR/tmp/sa_comm.txt /usr/AIR/tmp/sa_jobs.txt /tmp`;
			`chmod -R 755 /usr/AIR/tmp/* /usr/AIR/tmp/sa_jobs/* /tmp/*`;
			print "Importing job data into AIR database.\n";
			$servero = `/var/www/cgi-bin/import_data_blank.py sa_job_server.sql`;
			if ( $? == 0 ){ print "Import Complete.\n $servero\n"; };
			$interfaceo = `/var/www/cgi-bin/import_data_blank.py sa_job_comm.sql`;
			if ( $? == 0 ){ print "Import Complete.\n $interfaceo\n"; };	
			$instswo = `/var/www/cgi-bin/import_data_blank.py sa_jobs.sql`;
			if ( $? == 0 ){ print "Import Complete.\n $instswo\n"; };
			$job_failed = $job_count - $job_processed;
			`echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			`echo "<tr><td align=center>$last_log</td><td align=center>Load Job Data Complete</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center><a href='/cgi-bin/get_air_logs.pl?log_name=luigi_saserver_data_load.log'>$server_failed</a></td><td align=center>$job_count</td><td align=center>$job_processed</td><td align=center><a href='/cgi-bin/get_air_logs.pl?log_name=luigi_sajob_data_load.log'>$job_failed<a/></td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			`echo "update AIR_LOADER_LOG set Status = 'Find Servers',SERVER_COUNT = '$server_count', server_complete = '$server_processed', server_failed = '$server_failed', job_count = '$job_count', job_complete = '$job_processed', job_failed = '$job_failed' where load_id = $last_load_id; commit;" > /usr/AIR/tmp/update_log_entry.sql`;
			`java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/AIR/tmp/update_log_entry.sql`;
			}
			print "Getting Audit data.\n";
			`/var/www/cgi-bin/get_sa_audit.py >> /usr/AIR/tmp/luigi_sajob_data_load.log 2<&1 &`;
			if ( $? == 0 ){
			$test = "true";
			while ( `ps -ef | grep get_sa_audit.py | grep -v grep` ){
			sleep 30;
			$audit_complete = `cat /usr/AIR/tmp/audit_results.txt | wc -l| sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
			$audit_count = `ls /usr/AIR/tmp/audits/ | grep AUDIT | wc -l| sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
			`echo "update AIR_LOADER_LOG set Status = 'Find Servers',SERVER_COUNT = '$server_count', server_complete = '$server_processed', server_failed = '$server_failed', job_count = '$job_count', job_complete = '$job_processed', job_failed = '$job_failed', audit_count = '$audit_count', audit_complete = '$audit_complete' where load_id = $last_load_id; commit;" > /usr/AIR/tmp/update_log_entry.sql`;
			`java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/AIR/tmp/update_log_entry.sql`;
			}
			print "Inporting Audit data\n";
			$audit_complete = `cat /usr/AIR/tmp/audit_results.txt | wc -l| sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
			$audit_count = `ls /usr/AIR/tmp/audits/ | grep AUDIT | wc -l| sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
			$audit_failed = $audit_count - $audit_complete;
			`echo "update AIR_LOADER_LOG set Status = 'Find Servers',SERVER_COUNT = '$server_count', server_complete = '$server_processed', server_failed = '$server_failed', job_count = '$job_count', job_complete = '$job_processed', job_failed = '$job_failed', audit_count = '$audit_count', audit_complete = '$audit_complete', audit_failed = '$audit_failed' where load_id = $last_load_id; commit;" > /usr/AIR/tmp/update_log_entry.sql`;
			`java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/AIR/tmp/update_log_entry.sql`;
			}
		}else{
			#print "Luigi batch process of job data startup failed.\n";
		}
	}else{
		#print "Export of all server names from SA failed!\n";
	}
}else{
	#print "Export of all server names from SA failed!\n";
}




#1 = locked 0 = not locked
#sub is_file_locked
#{
#  my $theFile;
#  my $theRC;

#  ($theFile) = "/usr/AIR/tmp/all_server.txt";
#  $theRC = open(my $HANDLE, ">>", $theFile);
#  $theRC = flock($HANDLE, LOCK_EX|LOCK_NB);
#  close($HANDLE);
#  return !$theRC;
#}



1;