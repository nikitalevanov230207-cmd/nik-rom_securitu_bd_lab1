-- подготовка
USE master;
GO

-- Полная модель восстановления - обязательна для DIFFERENTIAL
ALTER DATABASE SchoolDBb SET RECOVERY FULL;
GO

-- Проверка
SELECT name, recovery_model_desc FROM sys.databases WHERE name = 'SchoolDBb';
GO

-- Создаём папку для бэкапов
EXEC sp_configure 'show advanced options', 1; RECONFIGURE;
EXEC sp_configure 'xp_cmdshell', 1; RECONFIGURE;
GO
EXEC xp_cmdshell 'if not exist "C:\Backups" mkdir "C:\Backups"';
GO

-- Начальная полная копия (старт цепочки лога)
BACKUP DATABASE SchoolDBb
TO DISK = 'C:\Backups\SchoolDBb_Init.bak'
WITH INIT, NAME = 'Init Full', STATS = 10;
GO



-- Полная рез. копия (Full)
BACKUP DATABASE SchoolDBb
TO DISK = 'C:\Backups\SchoolDBb_Full.bak'
WITH INIT, NAME = 'Full Backup', STATS = 10;
GO


-- 20 insert в ychenik_0
USE SchoolDBb;
GO

INSERT INTO ychenik_0 (FullName, BirthDate, Gender, ClassID) VALUES
(N'Change1 Student 01','20130101','M',1),
(N'Change1 Student 02','20130102','F',1),
(N'Change1 Student 03','20130103','M',2),
(N'Change1 Student 04','20130104','F',2),
(N'Change1 Student 05','20130105','M',3),
(N'Change1 Student 06','20130106','F',3),
(N'Change1 Student 07','20130107','M',4),
(N'Change1 Student 08','20130108','F',4),
(N'Change1 Student 09','20130109','M',5),
(N'Change1 Student 10','20130110','F',5),
(N'Change1 Student 11','20130111','M',6),
(N'Change1 Student 12','20130112','F',6),
(N'Change1 Student 13','20130113','M',7),
(N'Change1 Student 14','20130114','F',7),
(N'Change1 Student 15','20130115','M',8),
(N'Change1 Student 16','20130116','F',8),
(N'Change1 Student 17','20130117','M',9),
(N'Change1 Student 18','20130118','F',9),
(N'Change1 Student 19','20130119','M',10),
(N'Change1 Student 20','20130120','F',10);
GO


-- 20 insert в zapis_v_dnev_Grades1
USE SchoolDBb;
GO

INSERT INTO zapis_v_dnev_Grades1 (Grade, StudentID, TeacherID) VALUES
(5, 1, 1), (4, 2, 1), (5, 3, 1), (3, 4, 1), (4, 5, 1),
(5, 6, 2), (4, 7, 2), (5, 8, 2), (3, 9, 2), (4, 10, 2),
(5, 11, 3), (4, 12, 3), (5, 13, 3), (3, 14, 3), (4, 15, 3),
(5, 16, 4), (4, 17, 4), (5, 18, 4), (3, 19, 4), (4, 20, 4);
GO

-- Проверка zapis_v_dnev_Grades1
SELECT COUNT(*) AS GradesCount FROM zapis_v_dnev_Grades1;
GO


-- 10 update
USE SchoolDBb;
GO

UPDATE zapis_v_dnev_Grades1 SET Grade = 5 WHERE RecordID BETWEEN 1 AND 5;
GO
UPDATE zapis_v_dnev_Grades1 SET Grade = 4 WHERE RecordID BETWEEN 6 AND 10;
GO


-- 10 delete
USE SchoolDBb;
GO

DELETE FROM ychenik_0 WHERE FullName LIKE 'Change1 Student 1%';
GO

-- Проверка
SELECT COUNT(*) AS StudentsAfterDelete FROM ychenik_0;
GO