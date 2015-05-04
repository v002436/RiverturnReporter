LOAD DATA INFILE '/tmp/audit_result_rule_attrib_script.txt'
REPLACE
INTO TABLE AIR.sa_audit_result_rule_attrib_script
FIELDS TERMINATED BY '~~'
LINES TERMINATED BY '\n';

SHOW WARNINGs;
