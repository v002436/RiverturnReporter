set colsep ','
set echo off
set feedback off
set pagesize 0
set sqlprompt ''
set trimspool on
set headsep off
set heading off
set verify off
set linesize 132

spool myfile.csv

define schema=TRUTH
define table=UNITS
define CR=chr(10)
define TAB=chr(9)
col x noprint
col y noprint

select  tc.table_name y,
        column_id x,
        decode(column_id,1,'    ','   ,')||
        rtrim(column_name)|| &TAB || &TAB ||
        rtrim(data_type) ||
        rtrim(decode(data_type,'DATE',null,'LONG',null,
               'NUMBER',decode(to_char(data_precision),null,null,'('),
               '(')) ||
        rtrim(decode(data_type,
               'DATE',null,
               'CHAR',data_length,
               'VARCHAR2',data_length,
               'NUMBER',decode(to_char(data_precision),null,null,
                 to_char(data_precision) || ',' || to_char(data_scale)),
               'LONG',null,
               '******ERROR')) ||
        rtrim(decode(data_type,'DATE',null,'LONG',null,
               'NUMBER',decode(to_char(data_precision),null,null,')'),
               ')')) || &TAB || &TAB ||
        rtrim(decode(nullable,'N','NOT NULL',null))
from    dba_tab_columns tc,
        dba_objects o
where   o.owner = tc.owner
and     o.object_name = tc.table_name
and     o.object_type = 'TABLE'
and     o.owner = upper('&schema')
and     tc.table_name = upper('&table')
order by 1,2;



spool off
EXIT
/