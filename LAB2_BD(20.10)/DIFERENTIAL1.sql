USE master;
GO

BACKUP DATABASE SchoolDBb
TO DISK = 'C:\Backups\differential\SchoolDBb_Diff1.bak'
WITH DIFFERENTIAL, INIT, NAME = 'Differential 1';



