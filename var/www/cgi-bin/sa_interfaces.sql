LOAD DATA INFILE '/tmp/sa_interfaces.txt'
REPLACE
INTO TABLE AIR.sa_interfaces
FIELDS TERMINATED BY '~~'
LINES TERMINATED BY '\n';

SHOW WARNINGs;
