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
    $user = $FORM{user};
    $password = $FORM{password};
    $database = $FORM{database};
    $home = $FORM{home};
    $sql = $FORM{sql};
    $out = `sudo echo > /usr/AIR/tmp/air_db_config 2<&1`;
    if ( $? == 0 ){
    	$out0 = "AIR Config file is ready to write to!";
    }else{
    	$err = $?;
    	$out0 = "AIR config file could not be written to!";
    }
    $out1 = `sudo echo user = $user >> /usr/AIR/tmp/air_db_config 2<&1`;
    if ( $? == 0 ){
    	$out10 = "User was written to AIR Config file!";
    }else{
    	$err1 = $?;
    	$out10 = "User was NOT written to AIR Config file!";
    }
    $out2 = `sudo echo password = $password >> /usr/AIR/tmp/air_db_config 2<&1`;
    if ( $? == 0 ){
    	$out20 = "Password was written to AIR Config file!";
    }else{
    	$err2 = $?;
    	$out20 = "Password was NOT written to AIR Config file!";
    }
    $out3 = `sudo echo database = $database >> /usr/AIR/tmp/air_db_config 2<&1`;
    if ( $? == 0 ){
    	$out30 = "Database Type was written to AIR Config file!";
    }else{
    	$err3 = $?;
    	$out30 = "Database Type was NOT written to AIR Config file!";
    }
    $out4 = `sudo echo sql = \"$sql\" >> /usr/AIR/tmp/air_db_config 2<&1`;
    if ( $? == 0 ){
    	$out40 = "SQL Command was written to AIR Config file!";
    }else{
    	$err4 = $?;
    	$out40 = "SQL Command was NOT written to AIR Config file!";
    }


print "Content-type:text/html\r\n\r\n";    
print <<HTML;
<html>
<head>
<title></title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script> 
$(function(){
  $("#header").load("/header.shtml"); 
  $("#footer").load("/footer.shtml"); 
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
Writing the config file...
Below is the list of data you entered!			
			
			<hr>

User: $user <br>
Password: ********** <br>
Home: $home <br>
Database Type: $database <br>
SQL Command: $sql <br>
			<hr>
$out <br>
$out0 <br>
$err <br>
$out1 <br>
$out10 <br>
$err1 <br>
$out2 <br>
$out20 <br>
$err2 <br>
$out3 <br>
$out30 <br>
$err3 <br>
$out4 <br>
$out40 <br>
$err4 <br>

		</div>
	</section>


<div id="footer"></div>
</body>
</html>

HTML
	

1;
