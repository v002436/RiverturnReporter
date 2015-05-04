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
	$day = '';
	$hour = '';
	$minute = '';
	$command = '';
	$value =~ tr/+/ /;
	$value =~ s/%(..)/pack("C", hex($1))/eg;
	$FORM{$name} = $value;
    }
    $day = $FORM{day};
	$hour = $FORM{hour};
	$minute = $FORM{minute};
	$command = "cd /var/www/cgi-bin;/var/www/cgi-bin/get_sa_data3.pl > /usr/AIR/tmp/contab.log 2>&1";
	if ("$minute" || "$hour" || "$day"){
	$cmd = "(echo '$minute $hour $day * * $command') | sort - | uniq - | sudo crontab -";
	$rslt = `$cmd 2>&1`;
	$err = $?;
	if ( "$err" < 1 ){ $print = "<p> Crontab was updated.</p>"; }else{ $print = "<p> Crontab was NOT updated!<br>Error Code:$err</p>"; }
	@out = `sudo crontab -l  | grep AIR 2>&1`;
	}else{
	@out = `sudo crontab -l  | grep AIR 2>&1`;
    $err = $?;
	}
 
	

print "Content-type:text/html\r\n\r\n";
print "$out";
foreach $key (sort(keys %ENV)) {
#print "$key = $ENV{$key}<br>\n";
if ( "$key = $ENV{$key}" =~ "HTTP_REFERER = http://sl7-easutil02.savvis.lab/openreports/reportAdmin.action" || "$key = $ENV{$key}" =~ "HTTP_REFERER = http://sl7-easutil02.savvis.lab/openreports/MultiServerImport.jsp" || "$key = $ENV{$key}" =~ "HTTP_REFERER = http://sl7-easutil02.savvis.lab/cgi-bin/ManageJobs.pl"){

print <<HTML;
<html>

<head>	
<meta charset="utf-8">
	<title>AIR - Asset Inventory Retrieval</title>

	<link rel="stylesheet" media="screen" href="/css/214.css?v=8may2013">
	<meta name="description" content="A demonstration of what can be accomplished with AIR.">

  <meta HTTP-EQUIV="Pragma" CONTENT="public">
  <meta HTTP-EQUIV="Cache-Control" CONTENT="max-age=0">
 
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
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script> 
\$(function(){
  \$("#header").load("/openreports/Banner.jsp"); 
  \$("#footer").load("/openreports/Footer.jsp"); 
});
</script> 
<div id="header"></div>
<body class="yui-skin-sam">
</head>

HTML

foreach $out (@out){
@itbl = split(/ /, $out);
print <<HTML;
<section align=center>
<div align=center>
<table  class=cron border=1>
<h2>Enter the hour, date or minute you want the retrieval brocess to run.</h2>
<form action="ManageJobs.pl">
  <tr><td>Minute:</td><td><input type="text" name="minute" value="$itbl[0]"></td></tr><br>
  <tr><td>Hour:</td><td><input type="text" name="hour" value="$itbl[1]"></td></tr><br>
  <tr><td>Day:</td><td><input type="text" name="day" value="$itbl[2]"></td></tr><br>
  <tr><td><input type="submit" value="Submit form"></td></tr>
</form>
</table>
</div>
</section>
<br><br>
<div align=center>
<table class=cronstat><tr><th font-color=red>
$print
</table></th></tr>
</div>
HTML

}

print<<HTML;

</body>
</html>

HTML
}
}


1;