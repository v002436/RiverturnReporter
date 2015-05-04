LOAD DATA INFILE '/tmp/audit_result_source.txt'
REPLACE
INTO TABLE AIR.sa_audit_result_source
FIELDS TERMINATED BY '~~'
LINES TERMINATED BY '\n';

SHOW WARNINGs;
