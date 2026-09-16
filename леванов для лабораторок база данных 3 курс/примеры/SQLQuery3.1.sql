USE Blohin_Smolesci;

DELETE FROM travel_catalog
DELETE FROM route_in_contrue
DELETE FROM route_catalog
DELETE FROM travel_agencies
DELETE FROM travel_package
DELETE FROM buyer

INSERT INTO contrues (contrue_name, cost_of_the_vise) VALUES
('Austria', 80),
('Belgium', 80),
('Bulgaria', 80),
('Croatia', 80),
('Cyprus', 80),
('Czech Republic', 80),
('Denmark', 80),
('Estonia', 80),
('Finland', 80),
('France', 80),
('Germany', 80),
('Greece', 80),
('Hungary', 80),
('Iceland', 80),
('Ireland', 70),
('Italy', 80),
('Latvia', 80),
('Liechtenstein', 80),
('Lithuania', 80),
('Luxembourg', 80),
('Malta', 80),
('Netherlands', 80),
('Norway', 80),
('Poland', 80),
('Portugal', 80),
('Romania', 80),
('Slovakia', 80),
('Slovenia', 80),
('Spain', 80),
('Sweden', 80),
('Switzerland', 80),
('United States', 160),
('Canada', 100),
('United Kingdom', 115),
('Australia', 150),
('New Zealand', 170),
('Japan', 30),
('South Korea', 45),
('China', 140),
('India', 80),
('Turkey', 60),
('Egypt', 25),
('Thailand', 40),
('Vietnam', 25),
('Indonesia', 50),
('Malaysia', 0),
('Singapore', 30),
('Philippines', 30),
('United Arab Emirates', 100),
('Saudi Arabia', 120),
('Qatar', 100),
('Kuwait', 60),
('Bahrain', 80),
('Oman', 70),
('Israel', 35),
('Jordan', 60),
('Lebanon', 40),
('Morocco', 30),
('Tunisia', 40),
('Algeria', 100),
('Nigeria', 160),
('South Africa', 50),
('Kenya', 50),
('Tanzania', 100),
('Uganda', 50),
('Rwanda', 30),
('Zimbabwe', 80),
('Zambia', 50),
('Madagascar', 35),
('Mauritius', 0),
('Seychelles', 0),
('Brazil', 80),
('Argentina', 100),
('Chile', 100),
('Colombia', 0),
('Peru', 30),
('Ecuador', 50),
('Venezuela', 30),
('Bolivia', 100),
('Paraguay', 70),
('Uruguay', 90),
('Mexico', 40),
('Cuba', 25),
('Dominican Republic', 30),
('Jamaica', 100),
('Haiti', 120),
('Panama', 50),
('Costa Rica', 55),
('Guatemala', 40),
('El Salvador', 35),
('Honduras', 35),
('Nicaragua', 50),
('Belize', 50),
('Russia', 35),
('Ukraine', 85),
('Belarus', 80),
('Kazakhstan', 40),
('Uzbekistan', 50),
('Georgia', 0),
('Armenia', 0);
GO



INSERT INTO travel_catalog (theme) VALUES
('Working'),
('Chill'),
('Learning');
GO

INSERT INTO route_in_contrue (id_contrue, name_routes_contrue, route_duration, cost_of_the_route, number_of_sold_trips) VALUES
(1, 'Barcelona to Madrid Cultural Tour', 7, 890, 142),
(2, 'New York to Los Angeles Road Trip', 8, 1450, 210),
(3, 'London & Cotswolds Heritage Tour', 6, 1100, 189),
(4, 'Sydney to Great Barrier Reef Adventure', 8, 1850, 97),
(5, 'Queenstown & Fiordland Explorer', 9, 1950, 76),
(6, 'Tokyo & Kyoto Highlights', 6, 1200, 320),
(7, 'Seoul City & DMZ Experience', 5, 950, 165),
(8, 'Beijing & Xi’an Imperial Journey', 8, 1300, 215),
(9, 'Golden Triangle of India', 9, 780, 298),
(10, 'Istanbul & Cappadocia Discovery', 7, 720, 254),
(11, 'Bangkok & Chiang Mai Escape', 7, 650, 312),
(12, 'Bali Island Wellness Retreat', 5, 1100, 276),
(13, 'Kuala Lumpur & Borneo Jungle Tour', 9, 1050, 198),
(14, 'Dubai & Abu Dhabi Luxury Tour', 5, 1300, 245),
(15, 'Riyadh & Desert Oasis Experience', 6, 950, 89),
(16, 'Jerusalem & Tel Aviv Spiritual Journey', 7, 1050, 177),
(17, 'Marrakesh & Sahara Desert Trek', 8, 680, 231),
(18, 'Cape Town & Safari Adventure', 10, 1650, 142),
(19, 'Nairobi & Maasai Mara Safari', 7, 1250, 198),
(20, 'Amazon & Rio de Janeiro Expedition', 8, 1800, 123),
(21, 'Buenos Aires & Patagonia Trek', 7, 1750, 105),
(22, 'Cartagena & Coffee Region Escape', 8, 790, 167),
(23, 'Mexico City & Yucatan Ruins Tour', 9, 980, 221),
(24, 'Punta Cana Beach & Culture', 6, 820, 289),
(25, 'Moscow & St. Petersburg Classic', 8, 920, 176),
(26, 'Kyiv & Carpathian Mountains', 7, 680, 104),
(27, 'Tbilisi & Kazbegi Adventure', 6, 590, 310),
(28, 'Yerevan & Lake Sevan Discovery', 5, 520, 205);
GO


INSERT INTO route_catalog (id_route_in_contrue, id_catalog) VALUES
(9, 1),
(2, 2),
(4, 3);
GO


INSERT INTO travel_agencies ( id_route_catalog, nomber_iphone, name_comparishon) VALUES
( 1, '+79807075281', 'OOO_Bnal'),
( 2, '+79807075281', 'OOO_Bnal'),
( 3, '+79817175181', 'OOO_Bnal')
GO 

INSERT INTO travel_package (id_travel_agencies, id_buyer, id_contrue, id_route_in_contrue, cost_of_the_travel_package, purpose_of_the_trip, nombre_vise, date_of_sale
) VALUES
(3, 1, 1, 4, 890, 'Tourism', 'VISA-ES7821', '20250201'),
(3, 2, 2, 2, 1450, 'Tourism', 'VISA-US4532', '20250210'),
(3, 3, 3, 3, 1100, 'Business', 'VISA-UK6610', '20250215'),
(3, 4, 4, 4, 1850, 'Tourism', 'VISA-AU9043', '20250220'),
(3, 5, 5, 5, 1950, 'Honeymoon', 'VISA-NZ2287', '20250330'),
(3, 6, 6, 6, 1200, 'Tourism', NULL, '20250911'),  
(3, 7, 7, 7, 950, 'Business', 'VISA-KR5109', '20251015'),
(3, 8, 8, 8, 1300, 'Tourism', 'VISA-CN3376', '20250520'),
(3, 9, 9, 9, 780, 'Pilgrimage', 'VISA-IN8841', '20250322'),
(3, 10, 10, 10, 720, 'Tourism', 'VISA-TR6625', '20250913'),
(3, 11, 11, 11, 920, 'Tourism', 'VISA-EG4490', '20250715'),
(3, 12, 12, 12, 650, 'Wellness', 'VISA-TH7712', '20251111'),
(3, 13, 13, 13, 620, 'Tourism', 'VISA-VN3098', '20251212'),
(3, 14, 14, 14, 660, 'Tourism', 'VISA-VN3099', '20251013');
GO

INSERT INTO buyer (fameli_buyer, ticket_number, nomber_iphone) VALUES
('Ivanov', 3, '+79159701845'),
('Smith',3 , '+72025550189'),
('Johnson', 3, '+74791112345'),
('Williams', 3, '+71412345678'),
('Brown', 3, '+74211234567'),
('Tanaka', 3, '+719012345678'),
('Kim', 3, '+721012345678'),
('Li', 3, '+761381234567'),
('Patel', 3, '+719876543210'),
('Yilmaz', 3, '+705321234567'),
('Hassan', 3, '+701012345678'),
('Sukhumvit', 3, '+7812345678'),
('Nguyen', 3, '+74901234567'),
('Wijaya', 3, '+728123456789');

