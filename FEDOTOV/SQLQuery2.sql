USE SchoolDB;
GO

CREATE TABLE classi_1 (
    ClassID INT PRIMARY KEY IDENTITY(1, 1),  -- "классы" (PK)
    ClassNumber VARCHAR(10) NOT NULL,        -- "номер класса"
    Capacity INT NOT NULL                    -- "вместимость"
) ON main;
GO

CREATE TABLE ychenik_0 (
    StudentID INT PRIMARY KEY IDENTITY(1, 1), -- "ученик" (PK)
    FullName VARCHAR(100) NOT NULL,           -- "фио"
    BirthDate DATETIME NOT NULL,              -- "др"
    Gender VARCHAR(10) NOT NULL,              -- "пол"
    ClassID INT NOT NULL,                     -- "класс" (FK)
    FOREIGN KEY (ClassID) REFERENCES classi_1(ClassID)
);
GO

CREATE TABLE ychitelya_2 (
    TeacherID INT PRIMARY KEY IDENTITY(1, 1), -- "учитель" (PK)
    FullName VARCHAR(100) NOT NULL,           -- "фио"
    Gender VARCHAR(10) NOT NULL,              -- "пол"
    Subject VARCHAR(100) NOT NULL             -- "предмет"
) ON main;
GO

CREATE TABLE raspisanie_Grades2 (
    ScheduleID INT PRIMARY KEY IDENTITY(1, 1), -- "расписание" (PK)
    ClassID INT NOT NULL,                      -- "id_класс" (FK)
    TeacherID INT NOT NULL,                    -- "id_препод" (FK)
    StartTime DATETIME NOT NULL,               -- "начало занятий"
    FOREIGN KEY (ClassID) REFERENCES classi_1(ClassID),
    FOREIGN KEY (TeacherID) REFERENCES ychitelya_2(TeacherID)
) ON FG_Grades;
GO

CREATE TABLE zapis_v_dnev_Grades1 (
    RecordID INT PRIMARY KEY IDENTITY(1, 1),   -- "записи" (PK)
    Grade INT NOT NULL,                        -- "оценка"
    StudentID INT NOT NULL,                    -- "id_ученика" (FK)
    TeacherID INT NOT NULL,                    -- "id_препод" (FK)
    FOREIGN KEY (StudentID) REFERENCES ychenik_0(StudentID),
    FOREIGN KEY (TeacherID) REFERENCES ychitelya_2(TeacherID)
) ON FG_Grades;
GO