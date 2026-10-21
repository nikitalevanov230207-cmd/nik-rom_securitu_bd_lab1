CREATE LOGIN SchoolAdmin WITH PASSWORD = 'P@ssword';
CREATE USER SchoolAdmin FOR LOGIN SchoolAdmin;
ALTER ROLE AdminRole ADD MEMBER SchoolAdmin;

EXECUTE AS LOGIN = 'SchoolAdmin';
UPDATE dbo.zapis_v_dnev_Grades1 SET Grade = '1' WHERE RecordID = 1;
REVERT;         -- Don't forget!!!!!!!

SELECT * FROM dbo.Audit WHERE UserName = 'SchoolAdmin';


CREATE LOGIN Teacher1 WITH PASSWORD = '222!';
GO
CREATE LOGIN Teacher2 WITH PASSWORD = '222!';
GO
CREATE LOGIN Teacher3 WITH PASSWORD = '222!';
GO

CREATE LOGIN Parent1 WITH PASSWORD = '333!';
GO
CREATE LOGIN Parent2 WITH PASSWORD = '333!';
GO
CREATE LOGIN Parent3 WITH PASSWORD = '333!';
GO

CREATE LOGIN ClassTeacher1 WITH PASSWORD = '444!';
GO
CREATE LOGIN ClassTeacher2 WITH PASSWORD = '444!';
GO
CREATE LOGIN ClassTeacher3 WITH PASSWORD = '444!';
GO

USE SchoolDBb;
GO

CREATE USER Teacher1 FOR LOGIN Teacher1;
ALTER ROLE TeacherRole ADD MEMBER Teacher1;
GO
CREATE USER Teacher2 FOR LOGIN Teacher2;
ALTER ROLE TeacherRole ADD MEMBER Teacher2;
GO
CREATE USER Teacher3 FOR LOGIN Teacher3;
ALTER ROLE TeacherRole ADD MEMBER Teacher3;
GO

CREATE USER Parent1 FOR LOGIN Parent1;
ALTER ROLE ParentRole ADD MEMBER Parent1;
GO
CREATE USER Parent2 FOR LOGIN Parent2;
ALTER ROLE ParentRole ADD MEMBER Parent2;
GO
CREATE USER Parent3 FOR LOGIN Parent3;
ALTER ROLE ParentRole ADD MEMBER Parent3;
GO

CREATE USER ClassTeacher1 FOR LOGIN ClassTeacher1;
ALTER ROLE ClassTeacherRole ADD MEMBER ClassTeacher1;
GO
CREATE USER ClassTeacher2 FOR LOGIN ClassTeacher2;
ALTER ROLE ClassTeacherRole ADD MEMBER ClassTeacher2;
GO
CREATE USER ClassTeacher3 FOR LOGIN ClassTeacher3;
ALTER ROLE ClassTeacherRole ADD MEMBER ClassTeacher3;
GO