#!/usr/bin/perl


`sudo java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/openreports-tomcat/database/hsql/get_datasource.sql > /var/www/cgi-bin/datasources.lst`;
@out = `sudo cat /var/www/cgi-bin/datasources.lst`;
$err = $?;
$h = `date +%H`;
$h =~ s/ //g;
$h =~ s/\n//g;
$AA = `date +%A`;
$AA =~ s/ //g;
$AA =~ s/\n//g;
foreach $out (@out) {
	if ( "$out" !~ /^\DATASOURCE/ && "$out" !~ /---/ && "$out" !~ /rows/ ){
		$out =~ s/ //g;
		($ID, $NAME, $DRIVER, $URL, $USERNAME, $PASSWORD, $MAX_IDLE, $MAX_ACTIVE, $MAX_WAIT, $VALIDATION_QUERY, $JNDI) = split(/~~/, $out);
		#print "$URL\n";
		if ( $URL =~ /oracle/ ){
			$URL =~ s/jdbc:oracle:thin://g;
			$URL =~ s/@//g;
			$URL =~ s/\///g;
			$PASSWORD =~ s/\$/\\\$/g;
			($A, $B, $C) = split(/:/, $URL);
			@list = `cat /var/www/cgi-bin/datasyncqueue`;
			foreach $list (@list) {
			#print "$list";
			($TABLES,$WHICH,$DAY,$HOUR) = split(/~/, $list);
			($TABLE) = split(/ /, $TABLES);
			($IDD, $NAMEE) = split(/:/, $TABLE);
			
				if ( "$ID" =~ "$IDD" ) {
				#print "$AA~$DAY~$h~$HOUR\n";
					if ( "$DAY" =~ "$AA" || "$DAY" =~ "null" ) {
						#print "$AA~$DAY~$h~$HOUR\n";
						if ( "$HOUR" =~ "$h") {
							#print "$HOUR\n";
							print "$ID~$NAME~$NAMEE~$WHICH~$DAY~$HOUR";
							@vars = `cat /usr/AIR/tmp/schema/$ID\_$NAMEE.sql | grep \"^ \" | awk '{ print \$1"=="\$2 }'`;
							`echo "set echo off;"  > /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							`echo "set feedback off;"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							`echo "set linesize 1000;"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							`echo "set verify off;"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							#`echo "set arraysize 1;"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							#`echo "set pages 0;"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							`echo "set heading off;"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							`echo "spool /usr/AIR/tmp/schema/$ID\_$NAMEE.csv;\n\n"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							`echo "select " >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							foreach $vars (@vars) {
								($varss,$type) = split(/==/,$vars);
								$varss =~ s/USE1/USE/g;
								$comma = "";
								if ( "$varss" !~ "create" ){
									#print "$varss $type\n";
									if ( "$type" !~ "DATE" && "$type" !~ "NUMERIC" ){
										if ( "$varss" =~ "," ){$varss =~ s/,//g;$comma = "||\'~~\'||";}
										#`echo "$comma $varss" | sed 's/USE1/USE/g'   >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL;`;
										`echo "$comma case when $varss is not null then $varss else \'nul\' end"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL;`;
									}elsif ( "$type" !~ "DATE" ){
										if ( "$varss" =~ "," ){$varss =~ s/,//g;$comma = "||\'~~\'||";}
										`echo "$comma case when $varss is not null then $varss else 0 end"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL;`;
									}else{
										if ( "$varss" =~ "," ){$varss =~ s/,//g;$comma = "||\'~~\'||";}
										`echo "$comma case when $varss is not null then to_char($varss,'YYYY-MM-DD') else \'0000-00-00\' end"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL;`;
									}
								}
							}
							`echo "||\'~~\'||\'++==++\' from $NAMEE;\n\n" >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							`echo "spool off"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							`echo "EXIT"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							`echo "/"  >> /usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL`;
							#print "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:LD_LIBRARY_PATH:/usr/instantclient_11.1.0.6/lib/; export PATH=\$PATH:/usr/instantclient_11.1.0.6/bin/; sqlplus -S $USERNAME\/$PASSWORD\@\/\/$A:$B/$C \@/usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL";
							$err = `export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:LD_LIBRARY_PATH:/usr/instantclient_11.1.0.6/lib/; export PATH=\$PATH:/usr/instantclient_11.1.0.6/bin/; sqlplus -S $USERNAME\/$PASSWORD\@\/\/$A:$B/$C \@/usr/AIR/tmp/schema/$NAMEE\_SELECT.SQL 2<&1`;
							if ( "$?" eq "0" && "$err" !~ "ERROR" ){
							`cat /var/www/cgi-bin/mysql_import_template.sql | sed 's/REPLACEME/$ID\_$NAMEE/g' > /usr/AIR/tmp/schema/$ID\_$NAMEE\_IMP.sql`;
							`cat /usr/AIR/tmp/schema/$ID\_$NAMEE.csv | tr '\n' ' ' | sed 's/++= =++/++==++/g' | sed 's/~ ~/~~/g' | sed 's/ /~=~/g' | sed 's/++==++/\\n/g' | sed 's/~=~~=~//g' | sed 's/~=~/ /g' | sed 's/^ //g' | sed 's/~~\$//g' > /usr/AIR/tmp/schema/$ID\_$NAMEE.CSV`;
							$errr = `/var/www/cgi-bin/import_data_blank.py /usr/AIR/tmp/schema/$ID\_$NAMEE\_IMP.sql 2<&1`;
							if ( "$?" eq "0" && "$errr" !~ "failed!" ){
							print "Import of $NAMEE succeeded\n"
							}else{
							print "$NAMEE failed to export\n$errr\n"
							}
							}else{
							print "$NAMEE failed to import\n$err\n"
							}
						}
					}
				}
			}
		}
	}
}