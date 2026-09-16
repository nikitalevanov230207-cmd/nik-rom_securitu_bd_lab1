CREATE ROLE Traveler;
CREATE ROLE Boss;
GO

GRANT SELECT ON travel_package TO Traveler;

GRANT INSERT, UPDATE, SELECT, DELETE ON travel_package TO Boss WITH GRANT OPTION;
GRANT SELECT ON travel_agencies TO Boss WITH GRANT OPTION;
GO

REVOKE ALL ON travel_package TO Boss CASCADE

ALTER ROLE Traveler ADD MEMBER Daniil;
ALTER ROLE Boss ADD MEMBER Alexei;
GO

