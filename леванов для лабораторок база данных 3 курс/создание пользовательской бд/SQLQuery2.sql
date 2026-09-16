USE master;
ALTER DATABASE My_Database
SET READ_WRITE;

USE My_Database;
CREATE TABLE super_table (
	id INT
);
INSERT INTO super_table (id)
VALUES (1)

SELECT * FROM super_table