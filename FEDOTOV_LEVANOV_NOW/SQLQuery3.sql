USE SchoolDB;
GO

INSERT INTO classi_1 (ClassNumber, Capacity) VALUES
('5A', 25),
('5B', 28),
('6A', 24),
('6B', 30),
('7A', 26),
('7B', 22),
('8A', 29),
('8B', 27),
('9A', 25),
('9B', 23);
GO

INSERT INTO ychenik_0 (FullName, BirthDate, Gender, ClassID) VALUES
('Ivan Ivanov',        '20130514', 'M', 1),
('Maria Petrova',      '20130822', 'F', 1),
('Dmitry Sidorov',     '20130130', 'M', 2),
('Anna Kuznetsova',    '20131105', 'F', 2),
('Sergey Smirnov',     '20120318', 'M', 3),
('Elena Morozova',     '20120709', 'F', 3),
('Andrey Volkov',      '20121225', 'M', 4),
('Olga Fedorova',      '20120411', 'F', 4),
('Nikolay Pavlov',     '20110602', 'M', 5),
('Tatiana Orlova',     '20110917', 'F', 5);
GO

INSERT INTO ychitelya_2 (FullName, Gender, Subject) VALUES
('Alexander Popov',     'M', 'Mathematics'),
('Irina Sokolova',      'F', 'Physics'),
('Vladimir Nikolaev',   'M', 'Chemistry and Biology'),
('Natalia Andreeva',    'F', 'History'),
('Oleg Borisov',        'M', 'English and Literature'),
('Svetlana Mikhailova', 'F', 'Geography'),
('Pavel Grigoriev',     'M', 'Computer Science'),
('Yulia Fedotova',      'F', 'Art'),
('Maxim Ulyanov',       'M', 'Music'),
('Kristina Yakovleva',  'F', 'Physical Education');
GO

INSERT INTO raspisanie_Grades2 (ClassID, TeacherID, StartTime) VALUES
(1, 1, '20240902 08:30:00'),
(1, 3, '20240902 09:25:00'),
(2, 2, '20240902 08:30:00'),
(2, 5, '20240902 09:25:00'),
(3, 4, '20240902 10:20:00'),
(3, 6, '20240902 11:15:00'),
(4, 7, '20240902 08:30:00'),
(4, 8, '20240902 09:25:00'),
(5, 9, '20240902 10:20:00'),
(5, 10, '20240902 11:15:00');
GO

INSERT INTO zapis_v_dnev_Grades1 (Grade, StudentID, TeacherID) VALUES
(5, 1, 1),
(4, 2, 3),
(5, 3, 2),
(3, 4, 5),
(4, 5, 4),
(5, 6, 6),
(2, 7, 7),
(5, 8, 8),
(4, 9, 9),
(5, 10, 10);
GO

SELECT * FROM ychenik_0;
SELECT * FROM ychitelya_2;
