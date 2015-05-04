#!/usr/bin/perl
	`sudo echo > process.html`;
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
	foreach $pair (@pairs){
	($name, $value) = split(/=/, $pair);
	$value =~ tr/+/ /;
	$value =~ s/%(..)/pack("C", hex($1))/eg;
	$FORM{$name} = $value;
	$file = $FORM{file};
	@out = `sudo ./import_data.py $file 2<&1`;
	$err = $?;
	foreach $out (@out){
		if ($out =~ m/Warning: Using a password/){
		}else{
			`sudo echo "$out" >> process.html`;
		}
	}
		#`sudo echo "<hr>" >> process.html`;
	}
	`sudo echo "</table>"  >> process.html`;
print <<HTML;

<!DOCTYPE html>

<html>


<head>	
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color:hunter;
}
table#t01 th	{
    background-color: #134347;
    color: white;
}
</style>
<meta charset="utf-8">
	<title>AIR - Asset Inventory Retrieval</title>
	<link rel="stylesheet" media="screen" href="/css/214.css?v=8may2013">
	<meta name="description" content="A demonstration of what can be accomplished with AIR.">

  <meta HTTP-EQUIV="Pragma" CONTENT="public">
  <meta HTTP-EQUIV="Cache-Control" CONTENT="max-age=0">
 
  <link href="/css/openreports.css" rel="stylesheet" type="text/css">
  <!-- YUI Dependencies -->
  <script type="text/javascript" src="/js/yui/yahoo-min.js"></script>
  <script type="text/javascript" src="/js/yui/dom-min.js"></script>
  <script type="text/javascript" src="/js/yui/event-min.js"></script>
  <script type="text/javascript" src="/js/yui/animation-min.js"></script>
  <script type="text/javascript" src="/js/yui/dragdrop-min.js"></script>
  <script type="text/javascript" src="/js/yui/connection-min.js"></script>
  <script type="text/javascript" src="/js/yui/container-min.js"></script>
  <script type="text/javascript" src="/js/yui/element-beta-min.js"></script>
  <script type="text/javascript" src="/js/yui/tabview-min.js"></script>
  <script type="text/javascript" src="/js/yui/button-beta-min.js"></script> 
  <link rel="stylesheet" type="text/css" href="/css/yui/container.css" />
  <link rel="stylesheet" type="text/css" href="/css/yui/tabview.css">
  <link rel="stylesheet" type="text/css" href="/css/yui/button.css">    
  <!-- End YUI Dependencies -->
  <script type="text/javascript" src="/js/highlight.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script> 
\$(function(){
  \$("#header").load("/openreports/Banner.jsp"); 
  \$("#footer").load("/openreports/Footer.jsp"); 
});
</script> 

<body class="yui-skin-sam">


	<section class="intro" id="zen-intro">

</head>

<div id="header"></div>

	<section class="intro" id="zen-intro">

		<div class="summary" id="zen-summary" role="article">
			<hr>
			<p> AIR enables you to import a single server into the database from SA.<p>
			<p> AIR has three data files to import SA Server detail records, the data file to load and their status is shown below.</p>
			<hr>
		</div>
	</section>

	<section class="intro" id="zen-intro" align="center">

		<div class="summary" id="zen-summary" role="article" align=center>
<table id="t01" align="center">
<tr><th><font face="Georgia" size="2">File to process</font></th><th><font face="Georgia" size="2">Status</font></th></tr>

HTML
$o = `sudo cat process.html`;
print $o;

print <<HTML;

</div>
	</section>
	<br>
	<hr>


<div id="footer"></div>
</body>
</html>

HTML

	

1;