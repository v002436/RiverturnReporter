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
    $dashboard = $FORM{dashboard};
    #print "$host_name";
	print "Content-type:text/html\r\n\r\n";
	#print "$out";
	if ( $dashboard =~ m/OS/ ){
	@out = `sudo ./get_air_data.py "select $dashboard, totals from (select left($dashboard, 30) as $dashboard, count(0) as totals from server s group by $dashboard order by $dashboard) t group by totals order by totals desc"`;
	}elsif( $dashboard =~ m/^Job/ ){
	@out = `sudo ./get_air_data.py "select $dashboard, totals from (select $dashboard, count(0) as totals from sa_jobs s group by $dashboard order by $dashboard) t group by totals order by totals desc"`;
	print ("<!-- select $dashboard, totals from (select $dashboard, count(0) as totals from sa_jobs s group by $dashboard order by $dashboard) t group by totals order by totals desc -->");
	}elsif( $dashboard =~ m/^ROI/ ){
	@iuu = split(/_/, $dashboard);
		if ( $iuu[3] =~ m/Date/ ){
			@out = `sudo ./get_air_data.py "select left(job_base_enddate, 10) job_enddate, count(job_id) totals from sa_jobs where job_base_enddate != 'null' and job_base_enddate != '0000-00-00 00:00:00' and job_base_enddate >= CURDATE() - INTERVAL 8 DAY group by left(job_base_enddate, 10) order by left(job_base_enddate, 10)"`;
		}elsif ( $iuu[3] =~ m/Hour/ ){
			@out = `sudo ./get_air_data.py "select left(job_base_enddate, 13) job_enddate, count(job_id) totals from sa_jobs where job_base_enddate != 'null' and job_base_enddate != '0000-00-00 00:00:00' and job_base_enddate >= CURDATE() - INTERVAL 1 DAY group by left(job_base_enddate, 13) order by left(job_base_enddate, 13)"`;
		}
	}else{
    @out = `sudo ./get_air_data.py "select $dashboard, totals from (select $dashboard, count(0) as totals from server group by $dashboard order by $dashboard) t group by totals order by totals desc"`;
	}
    $err = $?;
	




print <<HTML;
<html lang="en">
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

	<link rel="stylesheet" media="screen" href="/css/214.css">
	<link rel="stylesheet" media="screen" href="/css/openreports.css">
	<meta name="description" content="A demonstration of what can be accomplished with AIR.">

  <meta HTTP-EQUIV="Pragma" CONTENT="public">
  <meta HTTP-EQUIV="Cache-Control" CONTENT="max-age=0">
 
  <link href="css/openreports.css" rel="stylesheet" type="text/css">
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


<body class="yui-skin-sam">

HTML

if( $dashboard =~ m/^ROI/ ){
print <<HTML;

   <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['$dashboard', 'TOTALS'],

HTML

		foreach $iou (@out){
		$iou =~ s/\(//g;
		$iou =~ s/\)//g;
		if ( $iou =~ m/None/ ){@iouu = split(/, /, $iou);}else{@iouu = split(/', /, $iou);}
		$iouu[0] =~ s/'//g;
		$iouu[0] =~ s/\n//g;
		$iouuuu = $iouu[0];
		if ( $dashboard =~ m/OS/ ){
		@iouuu = @iouu[0]; 
		$iouuuu = "$iouuu[0] $iouuu[1]";
		}
		$iouu[1] =~ s/\n//g;
		$iouu[1] =~ s/L//g;
		print("\['$iouu[0]', $iouu[1]\],\n");
	}
          

print <<HTML;
]);

        var options = {
          title: '$dashboard',
          vAxis: {title: 'Date',  titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

        chart.draw(data, options);
      }
    </script>

HTML
}else{	
print <<HTML;

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
		['$dashboards', 'Totals'],

HTML

		foreach $iou (@out){
		$iou =~ s/\(//g;
		$iou =~ s/\)//g;
		if ( $iou =~ m/None/ ){@iouu = split(/, /, $iou);}else{@iouu = split(/', /, $iou);}
		$iouu[0] =~ s/'//g;
		$iouu[0] =~ s/\n//g;
		$iouuuu = $iouu[0];
		if ( $dashboard =~ m/OS/ ){
		@iouuu = @iouu[0]; 
		$iouuuu = "$iouuu[0] $iouuu[1]";
		}
		$iouu[1] =~ s/\n//g;
		$iouu[1] =~ s/L//g;
		print("\['$iouu[0]', $iouu[1]\],\n");
	}
          

print <<HTML;
        ]);

        var options = {
          title: '$dashboard',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
</script>

HTML
}

print <<HTML;


</head>
		<div class="summary" id="zen-summary" role="article">
			<p> Dashboard results for $dashboard</p>
			<select size="1" name="jumpit" onchange="document.location.href=this.value"> 
<option selected value="">Make a Selection</option>
<option value="get_air_data.pl?dashboard=OpswareAgentVersion">Agent Version</option>
<option value="get_air_data.pl?dashboard=Customer">Customer</option>
<option value="get_air_data.pl?dashboard=Facility">Facility</option>
<option value="get_air_data.pl?dashboard=Job_Base_Status">Job Status</option>
<option value="get_air_data.pl?dashboard=Job_Base_Ticket">Job Ticket</option>
<option value="get_air_data.pl?dashboard=Job_Base_Type">Job Type</option>
<option value="get_air_data.pl?dashboard=Job_Base_User">Job User</option>
<option value="get_air_data.pl?dashboard=OpswareLifeCycle">Life Cycle</option>
<option value="get_air_data.pl?dashboard=Manufacturer">Manufacturer</option>
<option value="get_air_data.pl?dashboard=Model">Model</option>
<option value="get_air_data.pl?dashboard=OS">OS</option>
<option value="get_air_data.pl?dashboard=ROI_Jobs_By_Date">ROI Jobs By Date (Last 7 Days)</option>
<option value="get_air_data.pl?dashboard=ROI_Jobs_By_Hour">ROI Jobs By Hour (Hour by Current Day)</option>
<option value="get_air_data.pl?dashboard=OpswareStage">Stage</option>
<option value="get_air_data.pl?dashboard=OpswareUse">Use</option>
</select> 
</div>
	</section>
<hr>

HTML
if( $dashboard =~ m/^ROI/ ){

print <<HTML;

<div align="center"><div id="chart_div" style="width: 900px; height: 500px;"></div></div>

HTML

}else{
print <<HTML;

<div align="center"><div id="piechart_3d" style="width: 1000px; height: 500px;"></div></div>

HTML

}

print <<HTML;

<section class="intro" id="zen-intro" align="center">
<div class="summary" id="zen-summary" role="article" align="center">
<table id="t01">
<tr><th align="left"><font face="Georgia" size="2">$dashboard</font></th><th align="left"><font face="Georgia" size="2">Totals</font></th></tr>

HTML


	foreach $iou (@out){
		$iou =~ s/\(//g;
		$iou =~ s/\)//g;
		if ( $iou =~ m/None/ ){@iouu = split(/, /, $iou);}else{@iouu = split(/', /, $iou);}
		$iouu[0] =~ s/'//g;
		$iouu[1] =~ s/L//g;
		print("<tr><td><font face='Georgia' size='2'>$iouu[0]</font></td><td><font face='Georgia' size='2'>$iouu[1]</font></td></tr>");
	}

print <<HTML;

</table>
		</div>
	</section>



</body>
</html>

HTML



1;