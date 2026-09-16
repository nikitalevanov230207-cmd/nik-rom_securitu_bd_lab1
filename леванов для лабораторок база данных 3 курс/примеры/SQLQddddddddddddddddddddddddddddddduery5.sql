ALTER ROLE Boss DROP MEMBER Alexei;
ALTER ROLE Traveler DROP MEMBER Daniil;
GO

DROP USER Alexei;
DROP USER Daniil;
GO

DROP ROLE Traveler;
DROP ROLE Boss;
GO

USE MASTER;
GO

DROP LOGIN AlexeiLogin;
DROP LOGIN DaniilLogin;
go