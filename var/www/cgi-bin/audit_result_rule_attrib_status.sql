LOAD DATA INFILE '/tmp/audit_result_rule_attrib_status.txt'
REPLACE
INTO TABLE AIR.sa_audit_result_rule_attrib_status
FIELDS TERMINATED BY '~~'
LINES TERMINATED BY '\n';

SHOW WARNINGs;
