LOAD DATA INFILE '/tmp/server.txt'
REPLACE
INTO TABLE AIR.server
FIELDS TERMINATED BY '~~'
LINES TERMINATED BY '\n';

SHOW WARNINGs;