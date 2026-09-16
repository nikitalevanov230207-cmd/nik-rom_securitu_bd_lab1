USE master;
SELECT database_id,name, state_desc, create_date, compatibility_level
FROM sys.databases
ORDER BY database_id