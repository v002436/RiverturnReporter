create table data_retrieval
(datasourceid INTEGER PRIMARY KEY, 
tablename VARCHAR(20) COLLATE "English",
column VARCHAR(20),
columntype VARCHAR(20),
which VARCHAR(20),
day VARCHAR(20),
hour VARCHAR(20)
)
