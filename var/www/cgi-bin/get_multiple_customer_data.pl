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
    $host_name = $FORM{host_name};
    @out = `sudo ./get_customer_server_list.py 2<&1`;
    $err = $?;

print "Content-type:text/html\r\n\r\n";    
print <<HTML;
<html>
<head>
<title></title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script> 
$(function(){
  $("#header").load("/header.shtml"); 
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
			<h3>Sample Customer data to ensure this is the correct record:</h3>
			<hr>
<link rel="stylesheet" type="text/css" href="http://www.w3schools.com/stdtheme.css">
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
HTML

foreach (@out) {
    print("<p> $_ </p>\n");
}

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
	

1;
