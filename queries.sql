

SELECT d.Name
FROM [Hospital].[dbo].[Doctors] d
WHERE EXISTS (
    SELECT 1
    FROM [Hospital].[dbo].[DoctorsExaminations] de
    WHERE d.Id = de.DoctorId
    AND CAST(de.StartTime AS TIME) < '12:00:00'
);

SELECT Name, Salary
FROM [Hospital].[dbo].[Doctors]
WHERE Salary > ANY (SELECT Salary FROM [Hospital].[dbo].[Doctors] WHERE Premium > 1000);

SELECT Name
FROM [Hospital].[dbo].[Departments]
WHERE Id = ANY (SELECT DepartmentId FROM [Hospital].[dbo].[Wards]);

SELECT Name, Salary
FROM [Hospital].[dbo].[Doctors]
WHERE Salary > SOME (SELECT Salary FROM [Hospital].[dbo].[Doctors] WHERE Salary < 100000);

SELECT Name
FROM [Hospital].[dbo].[Wards]
WHERE Places > ALL (
    SELECT Places
    FROM [Hospital].[dbo].[Wards]
    WHERE DepartmentId = 1
);

SELECT Surname, Name, Salary
FROM [Hospital].[dbo].[Doctors]
WHERE Salary > ALL (
    SELECT Salary
    FROM [Hospital].[dbo].[Doctors]
    WHERE Salary < 50000
)
OR Salary < ANY (
    SELECT Salary
    FROM [Hospital].[dbo].[Doctors]
    WHERE Salary > 100000
);

SELECT Id, Name, Building
FROM [Hospital].[dbo].[Departments]
WHERE Name LIKE 'Н%'

UNION

SELECT Id, Name, Building
FROM [Hospital].[dbo].[Departments]
WHERE Name LIKE 'О%';


SELECT Surname, Name, Salary
FROM [Hospital].[dbo].[Doctors]
WHERE Salary > 50000

UNION ALL

SELECT Surname, Name, Salary
FROM [Hospital].[dbo].[Doctors]
WHERE Salary < 20000;


SELECT Doctors.Name, Doctors.Surname, Wards.Name
FROM [Hospital].[dbo].[Doctors]
INNER JOIN [Hospital].[dbo].[DoctorsExaminations] ON Doctors.Id = DoctorsExaminations.DoctorId
INNER JOIN [Hospital].[dbo].[Wards] ON DoctorsExaminations.WardId = Wards.Id;


SELECT
    Doctors.Name AS DoctorName,
    Doctors.Surname,
    Examinations.Name AS ExaminationName,
    Wards.Name AS WardName
FROM
    [Hospital].[dbo].[Doctors]
LEFT JOIN
    [Hospital].[dbo].[DoctorsExaminations] ON Doctors.Id = DoctorsExaminations.DoctorId
LEFT JOIN
    [Hospital].[dbo].[Examinations] ON DoctorsExaminations.ExaminationId = Examinations.Id
LEFT JOIN
    [Hospital].[dbo].[Wards] ON DoctorsExaminations.WardId = Wards.Id;

SELECT
    Sponsors.Name AS SponsorName,
    Donations.Amount,
    Donations.Date,
    Departments.Name AS DepartmentName
FROM
    [Hospital].[dbo].[Sponsors]
RIGHT JOIN
    [Hospital].[dbo].[Donations] ON Sponsors.Id = Donations.SponsorsId
RIGHT JOIN
    [Hospital].[dbo].[Departments] ON Donations.DepartmentId = Departments.Id;


SELECT
    Doctors.Name AS DoctorName,
    Doctors.Surname,
    Examinations.Name AS ExaminationName,
    Wards.Name AS WardName,
    Departments.Name AS DepartmentName
FROM
    [Hospital].[dbo].[Doctors]
LEFT JOIN
    [Hospital].[dbo].[DoctorsExaminations] ON Doctors.Id = DoctorsExaminations.DoctorId
LEFT JOIN
    [Hospital].[dbo].[Examinations] ON DoctorsExaminations.ExaminationId = Examinations.Id
LEFT JOIN
    [Hospital].[dbo].[Wards] ON DoctorsExaminations.WardId = Wards.Id
RIGHT JOIN
    [Hospital].[dbo].[Departments] ON Wards.DepartmentId = Departments.Id;


SELECT
    Sponsors.Name AS SponsorName,
    Donations.Amount,
    Donations.Date,
    Departments.Name AS DepartmentName,
    Wards.Name AS WardName
FROM
    [Hospital].[dbo].[Sponsors]
FULL JOIN
    [Hospital].[dbo].[Donations] ON Sponsors.Id = Donations.SponsorsId
FULL JOIN
    [Hospital].[dbo].[Departments] ON Donations.DepartmentId = Departments.Id
FULL JOIN
    [Hospital].[dbo].[Wards] ON Departments.Id = Wards.DepartmentId;













