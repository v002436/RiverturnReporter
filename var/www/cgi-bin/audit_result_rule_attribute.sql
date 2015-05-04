LOAD DATA INFILE '/tmp/audit_result_rule_attribute.txt'
REPLACE
INTO TABLE AIR.sa_audit_result_rule_attribute
FIELDS TERMINATED BY '~~'
LINES TERMINATED BY '\n';

SHOW WARNINGs;
