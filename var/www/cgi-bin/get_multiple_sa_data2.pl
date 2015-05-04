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

if ( $clear == 1 ){ 
if ( ! `sudo ps -ef | grep get_sa_data2.pl | grep -v grep` ){
	$outu = "Clear flag used, running new process laod.\n";
	@out = `nohup sudo ./exec_multi_data_load.sh`; 
	$err = $?;
	}

}else{
	$last_log = `sudo ls -l /usr/AIR/tmp | grep get_multiple_sa_data.log | awk '{ print \$6\" \"\$7\" \"\$8 }'`;
}
if ( $err == 0 ){ $outu = "Checking the SA batch load process.\n"; };

print "Content-type:text/html\r\n\r\n";    

print <<HTML;

<!DOCTYPE html>

<html>


<head>	
<meta charset="utf-8">
	<title>AIR - Asset Inventory Retrieval</title>
		<link rel="stylesheet" type="text/css" href="http://www.w3schools.com/stdtheme.css">
	<link rel="stylesheet" media="screen" href="/css/214.css?v=8may2013">
	<meta name="description" content="A demonstration of what can be accomplished with AIR.">

  <meta HTTP-EQUIV="Pragma" CONTENT="public">
  <meta HTTP-EQUIV="Cache-Control" CONTENT="max-age=0">
  <META HTTP-EQUIV="refresh" CONTENT="15">
 
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
  \$("#header").load("/header.shtml"); 
  \$("#footer").load("/footer.shtml"); 
});
</script> 

        

<body class="yui-skin-sam">


	<section class="intro" id="zen-intro">
		<header role="banner">
			<h1>AIR - Asset Inventory Retrieval</h1>
		</header>
	</section>
</head>

<div id="header"></div>

	<section class="intro" id="zen-intro">

		<div class="summary" id="zen-summary" role="article">
			<hr>
			<p> AIR enables you to import all SA server records from SA.<p>
			<p> AIR will create an export plan that maps all of the existing SA server records, their details including all Hardware and Software information.</p>
			<p> AIR will also create an export plan for the Job details from SA, related to each identified SA Server.</p>
			<p> AIR will queue up the import of data for each SA server identified and process the data until it is complete.</p>
			<hr>
		</div>
	</section>


<style>
.htmltut_table, .htmltut_table th, .htmltut_table td
{
border:1px solid black;
}
.htmltut_table1, .htmltut_table1 th, .htmltut_table1 td
{
border:1px solid black;
}
.htmltut_table1 th, .htmltut_table1 td
{
padding:5px;
}
</style>
	<section class="intro" id="zen-intro" align="center">

		<div class="summary" id="zen-summary" role="article">


HTML

sleep 2;
if ( $err ){
    	print("<p> $err </p>\n");

print <<HTML;

	</table>
	<tr>
	<td>
			<hr>

	</td>
	<tr>
		</div>
	</section>


	<div id="footer"></div>
	</body>
	</html>

HTML

}elsif ( $outu ){


	print("<p> $outu </p>\n");
if ( ! `sudo ps -ef | grep get_sa_data2.pl | grep -v grep` ){
	$last_log = `sudo ls -l /usr/AIR/tmp | grep get_multiple_sa_data.log | awk '{ print \$6\" \"\$7\" \"\$8 }'`;
	print("<p> Batch load complete, last run $last_log </p>\n");
	#print("<p> If this is not the right date pass a clear=1 in the url to start a new batch load </p>\n");
	@ou = `sudo cat /usr/AIR/tmp/get_multiple_sa_data.log | grep Complete`;
	foreach $iou (@ou){
		if ( $iou =~ m/^Warning:/ ){
		}else{
			print("<p> $iou </p>\n");
		}
	}
}else{
	@ou = `sudo cat /usr/AIR/tmp/get_multiple_sa_data.log`;
	foreach $iou (@ou){
		if ( $iou =~ m/^Warning:/ ){
		}else{
			print("<p> $iou </p>\n");
		}
	}
	#print("<p> The screen will refresh until the job is complete </p>\n");
}

print <<HTML;
<hr>
		</div>
	</section>

<!-- <iframe src="http://localhost:8082/static/visualiser/index3.html" width="100%" scrolling="yes"></iframe> -->
<div id="jquery-script-menu">
<div class="jquery-script-center">
</div>
<div class="jquery-script-clear"></div>
</div>
<div>
<iframe src="http://localhost:8082/static/visualiser/index3.html" width="100%" height="80%" scrolling="yes"></iframe>
</div>
<p id="callback"> </p>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script type="application/javascript" src="http://www.jqueryscript.net/demo/jQuery-Plugin-For-Auto-Resizing-iFrame-iFrame-Resizer/js/jquery.iframeResizer.min.js"></script> 
<script type="application/javascript">

			\$('iframe').iFrameSizer({
				log: true,
				contentWindowBodyMargin:8,
				doHeight:true,
				doWidth:false,
				interval:250,
				callback:function(messageData){
					\$('p#callback').html('<b>Frame ID:</b> ' + messageData.iframe.id + 
										' <b>Height:</b> ' + messageData.height + 
										' <b>Width:</b> ' + messageData.width);
				}
			});

		</script>
        
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

<div id="footer"></div>

</body>
</html>
HTML
	
};


	

1;
