USE msdb;
SELECT database_name, backup_start_date,type, backup_size, is_damaged, backup_finish_date
FROM msdb.dbo.backupset