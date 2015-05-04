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
\$(function(){
  \$("#header").load("/header.shtml"); 
  \$("#footer").load("/footer.shtml"); 
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
			<FORM action="/cgi-bin/set_customer_db_configo.pl" method="POST">
			Database Type:
				<select name="database">
					<option value="oracle" selected>Oracle</option>
					<option value="mysql">MySQL</option>
				</select><br>
				Database Username: <input type="text" value="AIR" name="user"><br>
				Database Password: <input type="password" value="jennyl01" name="password"><br>
				Database Home Path: <input type="text" value="ORACLE_HOME=/opt/opsware/oracle_instantclient/instantclient_11.2.0.3;" name="home"><br>
				Database SQL to get Asset ID, Asset Name:<br>
				<textarea name=sql rows="10" cols="30">select system_id,system_name from assets;</textarea>
			<input type="submit" value="Submit"></FORM>
			<hr>
		</div>
	</section>


<div id="footer"></div>
</body>
</html>
HTML
	

1;
