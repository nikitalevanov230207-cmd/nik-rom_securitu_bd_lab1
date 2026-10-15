-- Логины (серверный уровень)
SELECT name, type_desc, create_date
FROM sys.server_principals
WHERE name IN ('Teacher1','Teacher2','Teacher3',
               'Parent1','Parent2','Parent3',
               'ClassTeacher1','ClassTeacher2','ClassTeacher3')
ORDER BY name;
GO


-- Пользователи БД (уровень SchoolDBb)
USE SchoolDBb;
GO

SELECT name, type_desc, create_date
FROM sys.database_principals
WHERE name IN ('Teacher1','Teacher2','Teacher3',
               'Parent1','Parent2','Parent3',
               'ClassTeacher1','ClassTeacher2','ClassTeacher3')
ORDER BY name;
GO

-- Членство в ролях
SELECT r.name AS RoleName, m.name AS MemberName
FROM sys.database_role_members rm
JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
JOIN sys.database_principals m ON rm.member_principal_id = m.principal_id
WHERE r.name IN ('TeacherRole','ParentRole','ClassTeacherRole')
ORDER BY r.name, m.name;
GO

-- Сводка: сколько пользователей в каждой роли
SELECT r.name AS RoleName, COUNT(m.name) AS MembersCount
FROM sys.database_principals r
LEFT JOIN sys.database_role_members rm ON rm.role_principal_id = r.principal_id
LEFT JOIN sys.database_principals m ON rm.member_principal_id = m.principal_id
WHERE r.name IN ('AdminRole','TeacherRole','ParentRole','ClassTeacherRole')
GROUP BY r.name
ORDER BY r.name;
GO


-- Проверка прав на аудит
USE SchoolDBb;
GO

SELECT 
    dp.name AS Principal,
    p.permission_name,
    p.state_desc,
    o.name AS ObjectName
FROM sys.database_permissions p
JOIN sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
LEFT JOIN sys.objects o ON p.major_id = o.object_id
WHERE o.name = 'Audit'
ORDER BY dp.name, p.permission_name;
GO

-- Проверка входа
EXECUTE AS LOGIN = 'Teacher1';
    SELECT SUSER_SNAME() AS CurrentLogin, USER_NAME() AS CurrentUser;
REVERT;
GO