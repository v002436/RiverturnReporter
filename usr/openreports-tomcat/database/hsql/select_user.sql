--select * from report_user;

select name  from user_security us join report_user ru on ru.reportuser_id = us.user_id where role_name = 'DATASOURCE_ADMIN_ROLE';

select *  from user_security us join report_user ru on ru.reportuser_id = us.user_id;

SELECT * FROM INFORMATION_SCHEMA.SYSTEM_TABLES where table_name like 'REPORT%';

--SELECT * FROM INFORMATION_SCHEMA.SYSTEM_TABLES where table_name like '%COLUMNS%';

--SELECT * FROM INFORMATION_SCHEMA.SYSTEM_TABLES where table_name like 'USER%';

--SELECT * FROM INFORMATION_SCHEMA.SYSTEM_TABLES where table_name like '%ROLE%';

--select * from USER_GROUP_MAP;


select * from report;

update report_user set password='=?UTF-8?B?YWRtaW4=?=' where name='admin';

--SELECT * FROM INFORMATION_SCHEMA.SYSTEM_COLUMNS;
commit;