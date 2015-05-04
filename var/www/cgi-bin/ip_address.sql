set colsep ','
set echo off
set feedback off
set linesize 1000
set pagesize 0
set sqlprompt ''
set trimspool on
set headsep off

spool myfile.csv

select system_id, ip_address, fqdn, mac_address from air.ip_addresses;

spool off
EXIT
/