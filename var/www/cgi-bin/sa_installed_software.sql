LOAD DATA INFILE '/tmp/sa_installed_software.txt'
REPLACE
INTO TABLE AIR.sa_installed_software
FIELDS TERMINATED BY '~~'
LINES TERMINATED BY '\n';

SHOW WARNINGs;
