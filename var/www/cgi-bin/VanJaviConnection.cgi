#!/usr/bin/perl

use strict;
use warnings;

use XML::Simple;
print "Content-Type: text/html\n\n";

my $ooStage = "10.12.132.224";
my $resXml = "./hpoo-conn.xml";

my $javaOP;
my $javaRetCode;

	my $flowInvoke = "java -jar ./ooTools/JRSFlowInvoke.jar https://$ooStage:8443/PAS/services/rest/run/236f0d77-b79d-40e3-a06b-107e53d29594 -u sbalacha -p svvs123! > $resXml";
	
	$javaOP = qx/$flowInvoke 2>&1/;
	$javaRetCode = $?;
	#$javaRetCode = 0;
	
	print "<html> <head>\n";
	print "<title>Vanjavi Reset Connectionpool </title>";
	print "</head>\n";
	print "<body>\n";
	
	my $xml = new XML::Simple;
	my $resval = undef;
	my $respval = undef;
	
	if ($javaRetCode == 0 and -f $resXml)
	{
		my $xsdata = $xml->XMLin("$resXml");
		
		$resval = $xsdata->{'runReturn'}{'item'}{'flowResult'}{'value'};
		$respval = $xsdata->{'runReturn'}{'item'}{'flowResponse'}{'value'};
		
		my @action = split (";", $resval); 
		my @actUrl = split("=", $action[0]);
		my @errMsg = split("=", $action[1]);
		my @respMsg = split("=", $action[2]);
		
		if ($respval =~ m/success/i)
		{
			print "<h5> $respMsg[1] <h5><BR>\n";
		}
		elsif ($respval =~ m/failure/i)
		{
			print "<h5>\"VANJAVI ResetConnectionPool\" Operation failed. This could be due to one of the following reason<BR>\n
							Web Service Error:<BR>\n
							$errMsg[1]<BR>\n
		
							Backend Application Error<BR>\n
							$respMsg[1]<BR>\n
		
							Please refer $actUrl[1] for further action. <h5><BR>\n";
		}
		
		#unlink($resXml);
	}
	print "</body>\n";
	print "</html>\n";
