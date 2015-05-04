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
    #print "$host_name";
    $out = `sudo ./get_sa_data.py $host_name 2<&1`;
    $err = $?;
	$out2 = `sudo cp /usr/AIR/tmp/server.txt /usr/AIR/tmp/sa_interfaces.txt /usr/AIR/tmp/sa_installed_software.txt /tmp 2<&1`;
    $err2 = $?;
	$out2 = `sudo chmod 777 /tmp/*.txt 2<&1`;
    $err2 = $?;

print "Content-type:text/html\r\n\r\n";
foreach $key (sort(keys %ENV)) {
if ( "$key = $ENV{$key}" =~ "openreports/SingleServerImport.jsp" ){
    print "$out";
}
}



1;
