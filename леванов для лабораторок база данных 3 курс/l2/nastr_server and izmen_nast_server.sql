USE master;
SELECT name, value, value_in_use
FROM sys.configurations

--настройки которые менялись ниже
WHERE value <> value_in_use