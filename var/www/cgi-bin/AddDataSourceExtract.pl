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
	@tableName = ();
	@tableKey = ();
    foreach $pair (@pairs)
    {
	($name, $value) = split(/=/, $pair);
	$value =~ tr/+/ /;
	$value =~ s/%(..)/pack("C", hex($1))/eg;
	$FORM{$name} = $value;
	$tableName = $FORM{tableName};
	push @tableName, $tableName;
	$tableKey = $FORM{tableKey};
	push @tableKey, $tableKey;
    }
	$tableName = $FORM{tableName};
	$which = $FORM{which};
	$day = $FORM{day};
	$hour = $FORM{hour};
	$tableKey = $FORM{tableKey};
    $dataSourceId = $FORM{dataSourceId};
    `sudo java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc openreports /usr/openreports-tomcat/database/hsql/get_datasource.sql > datasources.lst`;
	@out = `sudo cat datasources.lst`;
	$err = $?;
	sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
	}
	


print "Content-type:text/html\r\n\r\n";    
print <<HTML;
<html>
<head> 
  <meta HTTP-EQUIV="Pragma" CONTENT="public"> 
  <meta HTTP-EQUIV="Cache-Control" CONTENT="max-age=0"> 
  <title>AIR</title> 
  <link rel="stylesheet" type="text/css" href="/openreports/css/yui/reset-fonts-grids.css" /> 
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
<script>
function goBack() {
    window.history.back();
}
</script>
</head> 
<body>


 

<br/>    



<div align="center"> 


	  <div class="important img-ds" id="instructions" style="width: 80%;"> 
	  	

	  	
HTML
if ( ! "$dataSourceId" && ! "$tableName" && ! "$tableKey" && ! "$which" ){

print <<HTML;
		  	1. Select DataSource:
	   	
	   	 	

	  </div> 
  <form action="/cgi-bin/AddDataSourceExtract.pl" name="dsForm" class="dialog-form" style="width: 85%;">	 

 
  <table class="dialog"> 	 
        </tr>   
        <tr class="a"> 
          <td class="boldText" width="20%">DataSource</td> 
		  	<td> 
				<img  id="url" src="/openreports/images/help.gif" title="Select the datasource you will use to extract data from.">                      
			</td>
          <td> 
          	<select name="dataSourceId" id="datasourceSelect">
				<option value="-1"> -- None -- </option>
				
HTML

foreach $out (@out) {
	if ( "$out" !~ /^\DATASOURCE/ && "$out" !~ /---/ && "$out" !~ /rows/ ){
		($ID, $NAME, $DRIVER, $URL, $USERNAME, $PASSWORD, $MAX_IDLE, $MAX_ACTIVE, $MAX_WAIT, $VALIDATION_QUERY, $JNDI) = split(/~~/, $out);
		print("<option value=$ID>$NAME</option>");
	}
}

print <<HTML;
			</select>   
          </td> 
        </tr>         
    </table>  
	
	<input class="standardButton" type="submit" name="submitOk" value="Next">
<br><br>	
	<div class="button-bar" id="buttons" >
<br><br><br>
	<div align=center>Current Sync Schedules
  <table class="dialog"> 	   
        <tr class="a"> 
          <th class="boldText" width="20%">Data Source ID</th> 
          <th class="boldText" width="20%">Table Name</th> 
		  <th class="boldText" width="20%">Schedule Type</th> 
		  <th class="boldText" width="20%">Schedule Timeframe</th> 
		  <th class="boldText" width="20%">Schedule Hour</th> 
HTML
@list = `cat datasyncqueue`;
foreach $list (@list) {
($TABLES,$WHICH,$DAY,$HOUR) = split(/~/, $list);
($TABLE) = split(/ /, $TABLES);
($ID, $NAME) = split(/:/, $TABLE);
print "<tr><td>$ID</td><td>$NAME</td><td>$WHICH</td><td>$DAY</td><td>$HOUR</td></tr>";
}

		  
print <<HTML;
	</table>
	</div>
    



			

		</div>
HTML
}elsif ( "$dataSourceId" && ! "$tableKey" && ! "$which" ){
print <<HTML;
		  	2. Select Tables:
	   	
	   	 	

	  </div> 
<form action="/cgi-bin/AddDataSourceExtract.pl" method="get">
<table width=40% class="displayTag"> 
<tr> 
<th class="sortable">  
<a>Table Name</a></th> 
</tr>
HTML

foreach $out (@out) {
$out =~ s/ //g;
	if ( "$out" !~ /^\DATASOURCE/ && "$out" !~ /---/ && "$out" !~ /rows/ ){
		($ID, $NAME, $DRIVER, $URL, $USERNAME, $PASSWORD, $MAX_IDLE, $MAX_ACTIVE, $MAX_WAIT, $VALIDATION_QUERY, $JNDI) = split(/~~/, $out);
		if ( $dataSourceId eq $ID ){
			if ( $URL =~ /oracle/ ){
				$URL =~ s/jdbc:oracle:thin://g;
				$URL =~ s/@//g;
				$URL =~ s/\///g;
				$PASSWORD=~ s/\$/\\\$/g;
				($A, $B, $C) = split(/:/, $URL);
				@tbl = `export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:LD_LIBRARY_PATH:/usr/instantclient_11.1.0.6/lib/; export PATH=\$PATH:/usr/instantclient_11.1.0.6/bin/; sqlplus $USERNAME\/$PASSWORD\@\/\/$A:$B/$C \@get_tables.sql`;
				$alter = 0;
				foreach $tbl (@tbl) {
					( $E, $F ) = split(/~~/, $tbl);
					if ( $C eq $E){
						if ($alter%2) {$class = "odd";}else{$class = "even";}
						print "<tr class=$class><td><input type=checkbox name=tableName value=$ID:$F> $F</td></tr>";
						$alter = $alter +1;
					}
				}
			}
		}
	}
}
print <<HTML;
</table>
  <input type="submit" value="Next">
</form>
<br>
<button onclick="goBack()">Go Back</button>


HTML

}elsif ( "$tableName" && ! "$which" ){
print <<HTML;
		  	3. Select Primary Key:
	   	
	   	 	

	  </div> 
<form action="/cgi-bin/AddDataSourceExtract.pl" method="get">
<table width=40% class="displayTag"> 
<tr> 
<th class="sortable">  
<a>Column Name</a></th> 
<th class="sortable">  
<a>Column Type</a></th> 
<th class="sortable">  
<a>Default Value</a></th> 
</tr>

HTML

foreach $tableName (@tableName) {
	($dataSourceId, $tablesel) = split(/:/, $tableName);
	foreach $out (@out) {
	$out =~ s/ //g;
	($ID, $NAME, $DRIVER, $URL, $USERNAME, $PASSWORD, $MAX_IDLE, $MAX_ACTIVE, $MAX_WAIT, $VALIDATION_QUERY, $JNDI) = split(/~~/, $out);
		if ( $dataSourceId eq $ID ){
			if ( $URL =~ /oracle/ ){
				$URL =~ s/jdbc:oracle:thin://g;
				$URL =~ s/@//g;
				$URL =~ s/\///g;
				$PASSWORD =~ s/\$/\\\$/g;
				($A, $B, $C) = split(/:/, $URL);
				$create = "AIR."."$dataSourceId"."_"."$tablesel";
				$createe = "$dataSourceId"."_"."$tablesel";
				$alter = 0;
				`cat get_table_schema.sql | sed 's/REPLACESCHEMA/$C/g' | sed 's/REPLACETABLE/$tablesel/g' > get_table_schema_run.sql; chmod 777 get_table_schema_run.sql;`;
				@tbl = `export LD_LIBRARY_PATH=\$LD_LIBRARY_PAYH:LD_LIBRARY_PATH:/usr/instantclient_11.1.0.6/lib/; export PATH=\$PATH:/usr/instantclient_11.1.0.6/bin/; sqlplus -S $USERNAME\/$PASSWORD\@\/\/$A:$B/$C \@get_table_schema_run.sql | sed 's/,//g' | sed 's/^\s\s\s//' | sed 's/\t/~/g' | grep "NOT NULL"`;
				#`cat get_table_schema.sql | sed 's/REPLACESCHEMA/$C/g' | sed 's/REPLACETABLE/$tablesel/g' > get_table_schema_run.sql; chmod 777 get_table_schema_run.sql;`;
				#print "export LD_LIBRARY_PATH=\$LD_LIBRARY_PAYH:LD_LIBRARY_PATH:/usr/instantclient_11.1.0.6/lib/; export PATH=\$PATH:/usr/instantclient_11.1.0.6/bin/; sqlplus $USERNAME\/$PASSWORD\@\/\/$A:$B/$C \@get_table_schema_run.sql <br>";
				`chmod -R 777 /usr/AIR/tmp/schema/*`;
				`mysql -uroot -pR00tw0rd! --database=AIR --execute=\"select table_name from information_schema.tables;\" | grep -iw $createe`;
				$drop = "";
				if ( $? eq 0){$drop = "drop table $create;"}
				`sudo echo "$drop create table AIR."$dataSourceId"_"$tablesel" ("  > /usr/AIR/tmp/schema/$createe.sql`;
				`export LD_LIBRARY_PATH=\$LD_LIBRARY_PAYH:LD_LIBRARY_PATH:/usr/instantclient_11.1.0.6/lib/; export PATH=\$PATH:/usr/instantclient_11.1.0.6/bin/; sqlplus -S $USERNAME\/$PASSWORD\@\/\/$A:$B/$C \@get_table_schema_run.sql | sed 's/VARCHAR2/VARCHAR/g' | sed 's/VARCHAR(4000)/TEXT(4000)/g' | sed 's/NUMBER/NUMERIC/g' | sed 's/NOT NULL//g' | sed 's/USE/USE1/g' >> /usr/AIR/tmp/schema/$createe.sql; sudo chmod 777 /usr/AIR/tmp/schema/$createe.sql`;
				`sudo echo ");"  >> /usr/AIR/tmp/schema/$createe.sql`;
				$errr = `mysql -uroot -pR00tw0rd! --local-infile=1 </usr/AIR/tmp/schema/$createe.sql 2<&1`;
				#print "<p>mysql -uroot -pR00tw0rd! --local-infile=1 $createe.sql ";
				if ( $? eq 0){$errrr = "- Created in the AIR schema";}else{$errrr = "- Failed to create table in AIR schema - $errr";}
				$errr =~ s/Warning: Using a password on the command line interface can be insecure.//g;
				print "<tr><td></td><td></td><td></td></tr><tr><td>$createe $errrr</td><td></td><td></td></tr>";
				foreach $tbl (@tbl){
					($key, $value, $valuee) = split(/~~/, $tbl);
					$key =~ s/ //g;
					if ($alter%2) {$class = "odd";}else{$class = "even";}
					print "<tr class=$class><td><input type=checkbox name=tableKey value=$tablesel:$key > $key</td><td> $value</td><td> $valuee</td></tr>";
					$alter = $alter +1;
				}
				print "<input type=hidden name=dataSourceId value=$dataSourceId>";
			}
		}
	}
}

print <<HTML;
</table>
  <input type="submit" value="Next">
</form>
<br>
<button onclick="goBack()">Go Back</button>

HTML

}elsif ( "$tableKey" ){


print <<HTML;
		  	4. Select Replication Schedule:
	   	
	   	 	

	  </div> 
<br><br>
<table width=40% class="displayTag"> 
<tr>  
<th class="sortable">  
<a>Data Source ID</a></th>
<th class="sortable">  
<a>Table Name</a></th> 
<th class="sortable">  
<a>Primary Key</a></th> 
<th class="sortable">  
<a>Status</a></th> 
</tr>

HTML
	$alter = 0;
	my @filtered= uniq(@tableKey);
	`sudo rm -rf /usr/AIR/tmp/schema/t`;
	foreach $tableKey (@filtered) {
		($tablesell, $tablekeyy) = split(/:/, $tableKey);
		`echo $tablesell,$tablekeyy >> /usr/AIR/tmp/schema/t`;
	}
	@filteredd = `awk -F, '{if(a[\$1])a[\$1]=a[\$1]":"\$2; else a[\$1]=\$2;}END{for (i in a)print i, a[i];}' OFS=, /usr/AIR/tmp/schema/t`;
	`chmod 777 /usr/AIR/tmp/schema/*`;
	`sudo rm -rf insert_dataloader.sql`;
	foreach $tableKey (@filteredd) {
		($tablesell, $tablekeyy) = split(/,/, $tableKey);
		$tablekeyy =~ s/:/,/;
		$create = "AIR."."$dataSourceId"."_"."$tablesell";
		$createe = "$dataSourceId"."_"."$tablesell";
		`mysql -uroot -pR00tw0rd! --database=AIR --execute=\"ALTER TABLE $create DROP PRIMARY KEY;\" | grep -i $createe`;
		`echo "ALTER TABLE $create ADD PRIMARY KEY ($tablekeyy);"  > /usr/AIR/tmp/schema/$createe\_ALT.sql`;
		`chmod 777 /usr/AIR/tmp/schema/*`;
		$errr = `mysql -uroot -pR00tw0rd! --local-infile=1 </usr/AIR/tmp/schema/$createe\_ALT.sql 2<&1`;
		$errr =~ s/Warning: Using a password on the command line interface can be insecure.//g;
		if ( $? eq 0){$errrr = "Updated $create with Primary Key";}else{$errrr = "Failed to update table $tablesell - $errr";}
		if ($alter%2) {$class = "odd";}else{$class = "even";}
		`echo "insert into AIR_DATALOADER(datasourceid,table) values ('$datasourceId','$tablesell');" >> insert_dataloader.sql`;
		print "<tr class=$class><td> $dataSourceId</td><td> $tablesell</td><td> $tablekeyy</td><td> $errrr</td></tr>";
		$alter = $alter +1;
	}
	`java -jar /usr/openreports-tomcat/database/hsql/hsqldb-1.7.3.jar --rcfile /root/sqltool.rc insert_dataloader.sql`;
print <<HTML;

</table>
<br><br>
<form action="/cgi-bin/AddDataSourceExtract.pl" method="get">
<table width=40% class="displayTag"> 
<tr> 
<th class="sortable">  
<a>Cron Type</a></th> 
<th class="sortable">  
<a>Day of Week (Only used for weekly schedules)</a></th> 
<th class="sortable">  
<a>Hour of Day (Timezone based on AIR APP server)</a></th> 
</tr>
<tr class=even><td><select name="which">
<option value="Daily">Daily</option>
<option value="Weekly">Weekly</option>
</select></td>
<td><select name="day">
<option value="null"></option>
<option value="Sunday">Sunday</option>
<option value="Monday">Monday</option>
<option value="Tuesday">Tuesday</option>
<option value="Wednesday">Wednesday</option>
<option value="Thursday">Thursday</option>
<option value="Friday">Friday</option>
<option value="Saturday">Saturday</option>
</select></td>
<td><select name="hour">
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
</select></td></tr>
</table>

HTML

foreach $tableKey (@filteredd) {
		($tablesell, $tablekeyy) = split(/,/, $tableKey);
		print "<input type=hidden name=tableName value=$dataSourceId:$tablesell>";
}

print <<HTML;

  <input type="submit" value="Next">
</form>
<br>
<button onclick="goBack()">Go Back</button>

HTML
	
}else{

print <<HTML;
		  	5. Data Replication Source Review:
	   	
</table>
<br><br>
<form action="/cgi-bin/AddDataSourceExtract.pl" method="get">
<table width=40% class="displayTag"> 
<tr> <th class="sortable">  
<a>DataSourceID</a></th> 
<th class="sortable">  
<a>Cron Type</a></th> 
<th class="sortable">  
<a>Day of Week</a></th> 
<th class="sortable">  
<a>Hour of Day</a></th> 
<th class="sortable">  
<a>Status</a></th> 
</tr>
HTML
foreach $tableN (@tableName) {
($tableselll) = split(/ /, $tableN);
$tableN =~ s/ //g;
if ( "$tableN" ) {
$staterr = `sudo echo $tableN~$which~$day~$hour >> datasyncqueue`;
if ( $? eq 0 ){$status = "Success, Queue was updated";}else{$status = "Failed, $staterr";}
print <<HTML;
<tr class=even>
<td>	   	 	
$tableN
</td>
<td>	   	 	
$which 
</td>
<td>
$day 
</td>
<td>
$hour
</td>
<td>
$status
</td>
</tr>

HTML
}
}
print <<HTML;
</table>
HTML
}
print <<HTML;
	

   <input type="hidden" name="id" value="0">

   <input type="hidden" name="command" value="add">  

     

  </form>

  <br> 
  <br><br>

  <div class="error"></div>  
  

</div>
<br> 
<br> 
<br> 
<br> 

</body>
</html>
HTML
	

1;
