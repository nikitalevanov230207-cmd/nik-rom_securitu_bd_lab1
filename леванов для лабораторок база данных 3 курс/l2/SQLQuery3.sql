USE master;
SELECT name, type_desc, create_date, is_disabled
FROM sys.server_principals
ORDER BY name