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
    $jobid = $FORM{jobid};
    #print "$host_name";
    @out = `sudo ./get_sa_jobs.py $jobid 2<&1`;
    $err = $?;

print <<HTML;

<html>
<head>
<title></title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script> 
\$(function(){
  \$("#header").load("http://10.12.132.169/headerp.shtml"); 
  \$("#footer").load("http://10.12.132.169/footerp.shtml"); 
});
</script> 
</head>
<body>
<div id="header"></div>


<body id="css-zen-garden">
<div class="page-wrapper">

	<section class="intro" id="zen-intro">
		<header role="banner">
			<h1>AIR - HPSA + Your Data</h1>
		</header>

		<div class="summary" id="zen-summary" role="article">
			<p>A demonstration of what can be accomplished through <abbr title="Cascading Style Sheets">HP SA integration</abbr> with Customer Asset & Inventory data.</p>
			<hr>	
<table border="1" style="width:50%">

HTML
foreach $iou (@out){
		if ( $iou =~ m/^Warning:/ ){
		}else{
			if ( $iou =~ m/[a-z0-9A-Z]/ ){
				if ( $iou =~ m/(FAILED|Failure|ERROR|Code|Details|FAILURE|STDERR:\t[a-zA-Z0-9]|EXITCODE:\t[1-9])/ ){
					$iou =~ s/\t/<td bgcolor="#FF0000"><div style="word-wrap: break-word"><FONT FACE="Geneva, Arial" SIZE=2>/g;
				}else{
					$iou =~ s/\t/<td><div style="word-wrap: break-word"><FONT FACE="Geneva, Arial" SIZE=2>/g;
				}
				#if ( $iou =~ m/^(<a-z0-9A-Z)/ ){
					print("<tr><td><p> $iou </p></td></tr>\n");
				#}
			}
		}
}


print <<EOF;

</table>
		</div>
	</section>

<div id="footer"></div>
</body>
</html>

EOF

1;