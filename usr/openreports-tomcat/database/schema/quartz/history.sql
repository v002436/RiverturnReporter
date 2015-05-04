 CREATE TABLE qrtz_scheduler_history (
   host_ip VARCHAR(15) NOT NULL,
   host_name VARCHAR(256) NOT NULL,
   scheduler_name VARCHAR(256) NOT NULL,
   event_type VARCHAR(128) NOT NULL,
   event_name VARCHAR(128) NOT NULL,
   event_time TIMESTAMP NOT NULL,
   info1 VARCHAR(256) NULL,
   info2 VARCHAR(256) NULL,
   info3 VARCHAR(256) NULL,
   info4 VARCHAR(256) NULL,
   info5 VARCHAR(256) NULL,
   INDEX(host_ip, host_name, event_type,event_name,event_time)
 );

commit;
