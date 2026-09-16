DROP DATABASE Blohin_Smolesci
CREATE DATABASE Blohin_Smolesci
USE Blohin_Smolesci;


CREATE TABLE contrues (
id_contrue INT PRIMARY KEY IDENTITY(1,1)
, contrue_name VARCHAR(100) NOT NULL CHECK (contrue_name NOT LIKE '%[0-9_!@#$%^&*-=+`~\|/?¹]%')
, cost_of_the_vise MONEY NULL
);

CREATE TABLE route_in_contrue (
id_route_in_contrue INT PRIMARY KEY IDENTITY(1,1)
, id_contrue INT NOT NULL
, name_routes_contrue VARCHAR(1000) NOT NULL CHECK (name_routes_contrue NOT LIKE '%[0-9]%')
, route_duration INT NOT NULL CHECK (route_duration > 0)
, cost_of_the_route MONEY NOT NULL 
, number_of_sold_trips INT NOT NULL CHECK (number_of_sold_trips NOT LIKE'%[^0-9]%')
, FOREIGN KEY (id_contrue) REFERENCES contrues(id_contrue)
);

CREATE TABLE travel_catalog (
id_catalog INT PRIMARY KEY IDENTITY(1,1)
, theme VARCHAR(100) NOT NULL
);

CREATE TABLE route_catalog (
id_route_catalog INT PRIMARY KEY IDENTITY(1,1)
, id_route_in_contrue INT NOT NULL
, id_catalog INT NOT NULL
, FOREIGN KEY (id_route_in_contrue) REFERENCES route_in_contrue(id_route_in_contrue)
, FOREIGN KEY (id_catalog) REFERENCES travel_catalog(id_catalog)
);

CREATE TABLE travel_agencies (
id_travel_agencie INT PRIMARY KEY IDENTITY(1,1)
, id_route_catalog INT NOT NULL
, nomber_iphone VARCHAR(12) NOT NULL CHECK (nomber_iphone LIKE '+7%' AND nomber_iphone NOT LIKE'%[^0-9+]%')
, name_comparishon VARCHAR(100) NOT NULL
, FOREIGN KEY (id_route_catalog) REFERENCES route_catalog(id_route_catalog)
);


CREATE TABLE travel_package (
ticket_number INT PRIMARY KEY IDENTITY(1,1) NOT NULL
, id_travel_agencies INT NOT NULL
, id_buyer INT NOT NULL
, id_contrue INT NOT NULL
, id_route_in_contrue INT NOT NULL
, cost_of_the_travel_package MONEY NOT NULL
, date_of_sale DATETIME NOT NULL
, purpose_of_the_trip VARCHAR(100) NOT NULL
, nombre_vise  VARCHAR(100) NULL
, FOREIGN KEY (id_travel_agencies) REFERENCES travel_agencies(id_travel_agencie)
, FOREIGN KEY (id_route_in_contrue) REFERENCES route_in_contrue(id_route_in_contrue)
);

CREATE TABLE buyer (
id_buyer INT PRIMARY KEY IDENTITY(1,1) NOT NULL
, fameli_buyer VARCHAR (100) NOT NULL
, ticket_number INT NOT NULL
, nomber_iphone VARCHAR(20) NOT NULL CHECK (nomber_iphone LIKE '+7%' AND nomber_iphone NOT LIKE'%[^0-9+]%')
, FOREIGN KEY (ticket_number) REFERENCES travel_package(ticket_number)
);