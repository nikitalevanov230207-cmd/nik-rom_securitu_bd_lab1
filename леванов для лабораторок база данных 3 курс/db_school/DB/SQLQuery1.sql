CREATE DATABASE school
ON PRIMARY (
    NAME = 'raspis_yr_data',
    FILENAME = 'C:\Users\Student\Desktop\db_school\DATA\server1\yrData.mdf',
    SIZE = 120 KB,
    MAXSIZE = 600 KB,
    FILEGROWTH = 5 KB
),(
 NAME = 'ocenki_data',
    FILENAME = 'C:\Users\Student\Desktop\db_school\DATA\server1\ocData.mdf',
    SIZE = 120 KB,
    MAXSIZE = 600 KB,
    FILEGROWTH = 5 KB
),



FILEGROUP FG_Grades (
    NAME = 'jornal',
    FILENAME = 'C:\Users\Student\Desktop\db_school\DATA\server1\failGR1\jornal.ndf',
    SIZE = 3MB,
    MAXSIZE = 20MB,
    FILEGROWTH = 2MB
)
LOG ON (
    NAME = 'MyDB_Log',
    FILENAME = 'C:\SQLData\MyDB.ldf',
    SIZE = 2MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 2MB
);