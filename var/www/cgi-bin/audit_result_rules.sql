LOAD DATA INFILE '/tmp/audit_result_rules.txt'
REPLACE
INTO TABLE AIR.sa_audit_result_rules
FIELDS TERMINATED BY '~~'
LINES TERMINATED BY '\n';

SHOW WARNINGs;
