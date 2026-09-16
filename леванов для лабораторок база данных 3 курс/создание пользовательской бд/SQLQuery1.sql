CREATE DATABASE My_Database
ON (
	NAME = 'My_Data',
		FILENAME = 'C:\DATA\SERV1\data.mdf',
		SIZE = 48MB, MAXSIZE = 1GB, FILEGROWTH = 10%
)

LOG ON (
	NAME = 'My_Log', FILENAME = 'C:\DATA\SERV2\data.ldf'
	, SIZE = 28MB , MAXSIZE = UNLIMITED, FILEGROWTH = 48MB

);
--рюй мюдн охяюрэ мю кюанпюрнпмшу
-- гмюйнлхляъ я хмярпсйжхеи SET дкъ хглемемхъ оюпюлерпнб ад