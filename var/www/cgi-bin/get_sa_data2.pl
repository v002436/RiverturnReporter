#!/usr/bin/perl
#print "Checking to see if batch process is running.\n";
if ( `ps -ef | grep spawn_luigi.py | grep -v grep | grep -v luigid` ){ print "Luigi already running, try later.\n"; exit 1;}else{ print "Luigi batch process is not running, continue...\n"; }
#print "Cleaning up old files...\n Tail the file /usr/AIR/tmp/luigi_sa_data_load.log for progress\n";
$last_log = `sudo ls -l /usr/AIR/tmp | grep get_multiple_sa_data.log | awk '{ print \$6\" \"\$7\" \"\$8 }'`;
`sudo echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
`sudo echo "<tr><td align=center>$last_log</td><td align=center>File Cleanup</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
$rm_out = `rm -rf /usr/AIR/tmp/sa_interfaces.txt /usr/AIR/tmp/all_sa_servers_by_id /usr/AIR/tmp/server.txt /usr/AIR/tmp/luigi_saserver_data_load.log /usr/AIR/tmp/luigi_sajob_data_load.log /usr/AIR/tmp/exec_all_sa_servers.txt /usr/AIR/tmp/sa_multi`;
#print "Getting list of active servers in SA.\n";
$list_out = `sudo ./get_sa_server_list.py 2<&1`;
if ( $? == 0 ){
	if ( $? == 0 ){
		@list = `sudo cat /usr/AIR/tmp/all_sa_servers_by_id`;
		$server_count = `sudo cat /usr/AIR/tmp/all_sa_servers_by_id | wc -l | sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
		`sudo echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
		`sudo echo "<tr><td align=center>$last_log</td><td align=center>Find Servers</td><td align=center>$server_count</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;

		for $name (@list){
			chomp $name;
			#print "Exporting details for $name.\n";
			$out = `echo \"sudo /var/www/cgi-bin/get_sa_data_blank2.pl '$name' 2<&1\" >> /usr/AIR/tmp/exec_all_sa_servers.txt`;
			if ( $? == 0 ){
				#`echo "Export of server $name from SA succeeded.\n" >> /usr/AIR/tmp/luigi_sa_data_load.log`;
			}else{
				`echo "Export of all server $name from SA failed!\n" >> /usr/AIR/tmp/luigi_sa_data_load.log`;
			}
		}
		`sudo /usr/local/bin/python ./spawn_luigi.py >> /usr/AIR/tmp/luigi_saserver_data_load.log 2<&1 &`;
		if ( $? == 0 ){
			#print "Luigi batch process started to export device details and interface data.\n";
			$test = "true";
			while ( `ps -ef | grep spawn_luigi.py | grep -v grep | grep -v luigid` ){
				#flock($fh, LOCK_EX) or "Cannot lock file - $!\n";
				#if ( is_file_locked($gTestQueuePath) ){ $test = 0;} else { $test = 1;}
				#close $fh or "Cannot close";
				sleep 10;
				$server_processed = `sudo ls /usr/AIR/tmp/sa_multi | wc -l| sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
				`sudo echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
				`sudo echo "<tr><td align=center>$last_log</td><td align=center>Extract Servers</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
				
			}
			`for i in \`find /usr/AIR/tmp/ -name server.txt\`; do cat \$i >> /usr/AIR/tmp/server.txt; done`;
			`for i in \`find /usr/AIR/tmp/ -name sa_interfaces.txt\`; do cat \$i >> /usr/AIR/tmp/sa_interfaces.txt; done`;
			`for i in \`find /usr/AIR/tmp/ -name sa_installed_software.txt\`; do cat \$i >> /usr/AIR/tmp/sa_installed_software.txt; done`;
			`sudo echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			`sudo echo "<tr><td align=center>$last_log</td><td align=center>Load Server Data</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			`sudo cp /usr/AIR/tmp/server.txt /usr/AIR/tmp/sa_interfaces.txt /usr/AIR/tmp/sa_installed_software.txt /tmp`;
			`sudo chmod -R 755 /usr/AIR/tmp/*.txt /usr/AIR/tmp/sa_multi /tmp/*`;
			#print "Importing data insto AIR database.\n";
			$servero = `./import_data_blank.py server.sql`;
			if ( $? == 0 ){ print "$servero\n"; }else{ print "Import of server data failed.\n"; };
			$interfaceo = `./import_data_blank.py sa_interfaces.sql`;
			if ( $? == 0 ){ print "Import Complete.\n $interfaceo\n"; }else{ print "Import Complete.\n Import of interface data failed.\n"; };	
			$instswo = `./import_data_blank.py sa_installed_software.sql`;
			if ( $? == 0 ){ print "Import Complete.\n $instswo\n"; }else{ print "Import Complete.\n Import of installed software data failed.\n"; };
			`sudo echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			`sudo echo "<tr><td align=center>$last_log</td><td align=center>Load Server Data Complete</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center>...</td><td align=center>...</td><td align=center>...</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
		}else{
			print "Luigi batch process of server data startup failed.\n";
		}
		$server_failed = $server_count - $server_processed;
		#print "Getting list of jobs in SA.\n";
		`sudo ./get_sa_jobs2.py 0  >> /usr/AIR/tmp/luigi_sa_data_load.log`;
		$job_count = `sudo cat /usr/AIR/tmp/exec_sa_jobs.txt | wc -l| sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
		`sudo echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
		`sudo echo "<tr><td align=center>$last_log</td><td align=center>Find Jobs</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center><a href="/cgi-bin/get_air_logs.pl?log_name=luigi_saserver_data_load.log">$server_failed</a></td><td align=center>$job_count</td><td align=center>...</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
		#print "Extracting job data from SA.\n";
		`sudo /usr/local/bin/python ./spawn_luigi2.py >> /usr/AIR/tmp/luigi_sajob_data_load.log 2<&1 &`;
		if ( $? == 0 ){
			#print "Luigi batch process started to export job details.\n";
			$test = "true";
			while ( `ps -ef | grep spawn_luigi2.py | grep -v grep | grep -v luigid` ){
				#flock($fh, LOCK_EX) or "Cannot lock file - $!\n";
				#if ( is_file_locked($gTestQueuePath) ){ $test = 0;} else { $test = 1;}
				#close $fh or "Cannot close";
				sleep 10;
				$job_processed = `sudo ls /usr/AIR/tmp/sa_jobs | wc -l| sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
				`sudo echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
				`sudo echo "<tr><td align=center>$last_log</td><td align=center>Get Job Data</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center><a href="/cgi-bin/get_air_logs.pl?log_name=luigi_saserver_data_load.log">$server_failed</a></td><td align=center>$job_count</td><td align=center>$job_processed</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			}
			#print "Cleaning up job details.\n";
			`sudo ./job_readiness.sh >> /usr/AIR/tmp/luigi_sa_data_load.log 2<&1 &`;
			#print "Processing job details.\n";
			`sudo /usr/local/bin/python ./spawn_luigi3.py >> /usr/AIR/tmp/luigi_sajob_data_load.log 2<&1 &`;
			if ( $? == 0 ){
			#print "Luigi batch process started to prepare job data for AIR data load.\n";
			$test = "true";
			while ( `ps -ef | grep spawn_luigi3.py | grep -v grep | grep -v luigid` ){
				#flock($fh, LOCK_EX) or "Cannot lock file - $!\n";
				#if ( is_file_locked($gTestQueuePath) ){ $test = 0;} else { $test = 1;}
				#close $fh or "Cannot close";
				sleep 20;
				$job_processed = `sudo ls /usr/AIR/tmp/sa_jobs | grep .BASE | wc -l| sed 's/ *\$//g' | tr -d '\n' | tr -d '\t'`;
				`sudo echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
				`sudo echo "<tr><td align=center>$last_log</td><td align=center>Prepare Job Data</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center><a href="/cgi-bin/get_air_logs.pl?log_name=luigi_saserver_data_load.log">$server_failed</a></td><td align=center>$job_count</td><td align=center>$job_processed</td><td align=center>...</td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			}
			`sudo rm -rf  /usr/AIR/tmp/sa_server.txt /usr/AIR/tmp/sa_comm.txt /usr/AIR/tmp/sa_jobs.txt`;
			`for i in \`ls /usr/AIR/tmp/sa_jobs | grep .COMM\`; do cat /usr/AIR/tmp/sa_jobs/$i >> /usr/AIR/tmp/sa_comm.txt; done`;
			`for i in \`ls /usr/AIR/tmp/sa_jobs | grep .BASE\`; do cat /usr/AIR/tmp/sa_jobs/$i >> /usr/AIR/tmp/sa_jobs.txt; done`;
			`for i in \`ls /usr/AIR/tmp/sa_jobs | grep .SERVER\`; do cat /usr/AIR/tmp/sa_jobs/$i >> /usr/AIR/tmp/sa_server.txt; done`;
			`sudo rm -rf  /tmp/sa_server.txt /tmp/sa_comm.txt /tmp/sa_jobs.txt`;
			`sudo cp /usr/AIR/tmp/sa_server.txt /usr/AIR/tmp/sa_comm.txt /usr/AIR/tmp/sa_jobs.txt /tmp`;
			`sudo chmod -R 755 /usr/AIR/tmp/*.txt /usr/AIR/tmp/sa_jobs/* /tmp/*`;
			#print "Importing job data into AIR database.\n";
			$servero = `./import_data_blank.py sa_job_server.sql`;
			if ( $? == 0 ){ print "Import Complete.\n $servero\n"; };
			$interfaceo = `./import_data_blank.py sa_job_comm.sql`;
			if ( $? == 0 ){ print "Import Complete.\n $interfaceo\n"; };	
			$instswo = `./import_data_blank.py sa_jobs.sql`;
			if ( $? == 0 ){ print "Import Complete.\n $instswo\n"; };
			$job_failed = $job_count - $job_processed;
			`sudo echo "<table border=1><tr><th>Last Run</th><th>Step</th><th>Servers to Process</th><th>Servers Processed</th><th>Servers Failed</th><th>Jobs to Process</th><th>Jobs Processed</th><th>Jobs Failed</th></tr>" > /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			`sudo echo "<tr><td align=center>$last_log</td><td align=center>Load Job Data Complete</td><td align=center>$server_count</td><td align=center>$server_processed</td><td align=center><a href='/cgi-bin/get_air_logs.pl?log_name=luigi_saserver_data_load.log'>$server_failed</a></td><td align=center>$job_count</td><td align=center>$job_processed</td><td align=center><a href='/cgi-bin/get_air_logs.pl?log_name=luigi_sajob_data_load.log'>$job_failed<a/></td></tr></table>" >> /usr/AIR/tmp/luigi_sa_data_load.rslt`;
			}
			`sudo /var/www/cgi-bin/get_sa_audit.py 0 >> /usr/AIR/tmp/luigi_sajob_data_load.log 2<&1 &`;
			if ( $? == 0 ){
			$test = "true";
			while ( `ps -ef | grep get_sa_audit.py | grep -v grep` ){
				sleep 30;
			}
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