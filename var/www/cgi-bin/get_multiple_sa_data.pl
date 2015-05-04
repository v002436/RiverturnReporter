#!/usr/bin/perl

local ($buffer, @pairs, $pair, $name, $value, %FORM);
# Read in text
$ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
if ($ENV{'REQUEST_METHOD'} eq "POST")
{
	read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
}else {
$buffer = $ENV{'QUERY_STRING'};
}
# Split information into name/value pairs
@pairs = split(/&/, $buffer);
foreach $pair (@pairs)
{
($name, $value) = split(/=/, $pair);
$value =~ tr/+/ /;
$value =~ s/%(..)/pack("C", hex($1))/eg;
$FORM{$name} = $value;
}
$clear = $FORM{clear};
$date = `date +"%m-%d-%Y %H:%M"`;
if ( $clear == 1 ){ 
if ( ! `sudo ps -ef | grep get_sa_data3.pl | grep -v grep` ){
	$outu = "Clear flag used, running new process laod.\n";
	@out = `nohup sudo ./exec_multi_data_load.sh`; 
	$err = $?;
	}

}else{
	$last_log = `sudo ls -l /usr/AIR/tmp | grep get_multiple_sa_data.log | awk '{ print \$6\" \"\$7\" \"\$8 }'`;
}

if ( $err == 0 ){ $outu = "<div id=h2><section class=intro id=zen-intro align=center><div class=summary id=zen-summary role=article>AIR Data Load Progress:<br>Right Now: $date</div></section></div>"; };

print "Content-type:text/html\r\n\r\n";    
foreach $key (sort(keys %ENV)) {
#print "$key = $ENV{$key}<br>\n";
if ( "$key = $ENV{$key}" =~ "HTTP_REFERER = http://sl7-easutil02.savvis.lab/openreports/SingleServerImport.jsp" || "$key = $ENV{$key}" =~ "HTTP_REFERER = http://sl7-easutil02.savvis.lab/openreports/MultiServerImport.jsp" || "$key = $ENV{$key}" =~ "HTTP_REFERER = http://sl7-easutil02.savvis.lab/cgi-bin/get_multiple_sa_data.pl"){
    print "$out";

print <<HTML;

<!DOCTYPE html>
<html>
<head>
  <meta HTTP-EQUIV="Pragma" CONTENT="public">
  <meta HTTP-EQUIV="Cache-Control" CONTENT="max-age=0">
  <title>AIR</title>
  <link rel="stylesheet" type="text/css" href="/openreports/css/yui/reset-fonts-grids.css" />
  <link href="/openreports/css/openreports.css" rel="stylesheet" type="text/css">
  <!-- YUI Dependencies -->
  <script type="text/javascript" src="/openreports/js/yui/yahoo-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/dom-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/event-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/animation-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/dragdrop-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/connection-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/container-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/element-beta-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/tabview-min.js"></script>
  <script type="text/javascript" src="/openreports/js/yui/button-beta-min.js"></script> 
  <link rel="stylesheet" type="text/css" href="/openreports/css/yui/container.css" />
  <link rel="stylesheet" type="text/css" href="/openreports/css/yui/tabview.css">
  <link rel="stylesheet" type="text/css" href="/openreports/css/yui/button.css">    
  <!-- End YUI Dependencies -->
  <script type="text/javascript" src="/openreports/js/highlight.js"></script>
  <META HTTP-EQUIV="refresh" CONTENT="15">
</head>

<body class="yui-skin-sam">
<br/>


	<div align="center">  
  		<div class="important img-queryreport" id="instructions">AIR Retrieval Dashboard</div>  
	</div>


<div align="center">   
    
    
  
  
  
  
  
  <span class="pagebanner">4 items found, displaying all items.</span><span class="pagelinks"><strong>1</strong></span>
<table class="displayTag">
<thead>

HTML

sleep 2;
if ( $err ){
    	print("<p> $err </p>\n");



}elsif ( $outu ){


	print("<p> $outu </p>\n");
if ( ! `sudo ps -ef | grep get_sa_data3.pl | grep -v grep` ){
	$last_log = `sudo ls -l /usr/AIR/tmp | grep get_multiple_sa_data.log | awk '{ print \$6\" \"\$7\" \"\$8 }'`;
	#print("<p> Batch load complete, last run $last_log </p>\n");
	#print("<p> If this is not the right date pass a clear=1 in the url to start a new batch load </p>\n");
#	@ou = `sudo cat /usr/AIR/tmp/luigi_sa_data_load.rslt`;
#	foreach $iou (@ou){
#		#if ( $iou =~ m/^Warning:/ ){
		#}else{
#			print("$iou\n");
		#}
#	}


	@tbl = `sudo java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/openreports-tomcat/database/hsql/air_loader_log.sql`;
	foreach $itbl (@tbl){
		@ltbl = split(/~~/, $itbl);
		if ( $ltbl[0] =~ /rows/ ){
		}else{
		if ( $ltbl[0] =~ /^\w/ ){
			print "<tr><td>$ltbl[0]</td><td>$ltbl[1]</td><td>$ltbl[2]</td><td>$ltbl[3]</td><td>$ltbl[4]</td><td>$ltbl[5]</td><td><a href=/cgi-bin/get_air_logs.pl?log_name=luigi_saserver_data_load.log>$ltbl[6]</td><td>$ltbl[7]</td><td>$ltbl[8]</td><td><a href=/cgi-bin/get_air_logs.pl?log_name=luigi_sajob_data_load.log>$ltbl[9]</td><td>$ltbl[10]</td><td>$ltbl[11]</td><td>$ltbl[12]</td></tr>\n";
		}
		}
	}
	
print <<HTML;
</table>
</div>
</section>
<div align=center>

HTML

#	@ou = `sudo cat /usr/AIR/tmp/luigi_sa_data_load.rslta`;
#	foreach $iou (@ou){
#		#if ( $iou =~ m/^Warning:/ ){
#		#}else{
#			print("$iou\n");
		#}
#	}
}else{
print <<HTML;
<section align=center>
<div align=center>
<div align=center>
<table border=1 align=center>
<tr><th>LOAD_ID</th><th>LAST_RUN</th><th>THIS_RUN</th><th>STATUS</th><th>SERVER_COUNT</th><th>SERVER_COMPLETE</th><th>SERVER_FAILED</th><th>JOB_COUNT</th><th>JOB_COMPLETE</th><th>JOB_FAILED</th><th>AUDIT_COUNT</th><th>AUDIT_COMPLETE</th><th>AUDIT_FAILED</th></tr>
HTML

	@tbl = `sudo java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/openreports-tomcat/database/hsql/air_loader_log.sql`;
	foreach $itbl (@tbl){
		@ltbl = split(/~~/, $itbl);
		if ( $ltbl[0] =~ /rows/ ){
		}else{
		if ( $ltbl[0] =~ /^\w/ ){
			print "<tr><td>$ltbl[0]</td><td>$ltbl[1]</td><td>$ltbl[2]</td><td>$ltbl[3]</td><td>$ltbl[4]</td><td>$ltbl[5]</td><td><a href=/cgi-bin/get_air_logs.pl?log_name=luigi_saserver_data_load.log>$ltbl[6]</td><td>$ltbl[7]</td><td>$ltbl[8]</td><td><a href=/cgi-bin/get_air_logs.pl?log_name=luigi_sajob_data_load.log>$ltbl[9]</td><td>$ltbl[10]</td><td>$ltbl[11]</td><td>$ltbl[12]</td></tr>\n";
		}
		}
	}
}
print <<HTML;
</table>
</div>
</section>
<div align=center>
</body>
</html>
HTML
	
};
}
}

	

1;
