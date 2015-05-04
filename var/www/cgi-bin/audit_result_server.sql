LOAD DATA INFILE '/tmp/audit_result_server.txt'
REPLACE
INTO TABLE AIR.sa_audit_result_server
FIELDS TERMINATED BY '~~'
LINES TERMINATED BY '\n';

SHOW WARNINGs;
