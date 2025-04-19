USE CompanyDB;

--1  
SELECT * FROM Employee;

--2  
SELECT e.employeeName, e.email
FROM Employee e
JOIN Department d ON e.departmentId = d.departmentId
WHERE d.departmentName = 'Phòng Kỹ Thuật';

--3  
SELECT * FROM Project
WHERE YEAR(startDate) = 2023;

--4  
SELECT * FROM Employee
WHERE hireDate > '2021-01-01';

--5  
SELECT * FROM Department;

--6  
SELECT employeeName, salary FROM Employee;

--7  
SELECT d.departmentName, COUNT(e.employeeId) AS totalEmployees
FROM Department d
LEFT JOIN Employee e ON d.departmentId = e.departmentId
GROUP BY d.departmentName;

--8  
SELECT * FROM Project
WHERE endDate > '2023-01-01';

--9  
SELECT * FROM Employee
WHERE salary > 700;

--10  
SELECT * FROM Employee
WHERE managerId IS NULL;

--11  

SELECT d.departmentName, SUM(e.salary) AS totalSalary
FROM Employee e
JOIN Department d ON e.departmentId = d.departmentId
GROUP BY d.departmentName;

--12  

SELECT p.projectName, p.startDate, p.endDate
FROM EmployeeProject ep
JOIN Project p ON ep.projectId = p.projectId
WHERE ep.employeeId = 2;

--13  

SELECT e.employeeName, d.departmentName
FROM Employee e
JOIN Department d ON e.departmentId = d.departmentId;

--14  

SELECT d.departmentName, e.employeeName, e.salary
FROM Employee e
JOIN Department d ON e.departmentId = d.departmentId
WHERE (e.departmentId, e.salary) IN (
    SELECT departmentId, MAX(salary)
    FROM Employee
    GROUP BY departmentId
);

--15  

SELECT e.employeeId, e.employeeName, COUNT(ep.projectId) AS projectCount
FROM Employee e
JOIN EmployeeProject ep ON e.employeeId = ep.employeeId
GROUP BY e.employeeId, e.employeeName
HAVING COUNT(ep.projectId) > 1;

--16  

SELECT p.projectName, COUNT(ep.employeeId) AS totalEmployees
FROM Project p
LEFT JOIN EmployeeProject ep ON p.projectId = ep.projectId
GROUP BY p.projectId, p.projectName;

--17  

SELECT e.employeeName, e.salary
FROM Employee e
JOIN Department d ON e.departmentId = d.departmentId
WHERE d.departmentName = 'Phòng Nhân Sự' AND e.salary > 60000;

--18  

SELECT p.projectName
FROM Project p
LEFT JOIN EmployeeProject ep ON p.projectId = ep.projectId
WHERE ep.projectId IS NULL;

--19  

SELECT e.employeeName AS Employee, m.employeeName AS Manager
FROM Employee e
LEFT JOIN Employee m ON e.managerId = m.employeeId;

--20
sql
SELECT e.employeeName
FROM Employee e
JOIN Department d ON e.departmentId = d.departmentId
LEFT JOIN EmployeeProject ep ON e.employeeId = ep.employeeId
WHERE d.departmentName = 'Sales' AND ep.projectId IS NULL;

--21
sql
SELECT e.employeeName, p.projectName, ep.assignedDate
FROM EmployeeProject ep
JOIN Employee e ON ep.employeeId = e.employeeId
JOIN Project p ON ep.projectId = p.projectId;

--22
sql
SELECT p.projectName, COUNT(ep.employeeId) AS employeeCount
FROM EmployeeProject ep
JOIN Project p ON ep.projectId = p.projectId
GROUP BY p.projectId
HAVING COUNT(ep.employeeId) >= 3;

--23
sql
SELECT e.employeeName
FROM Employee e
JOIN EmployeeProject ep ON e.employeeId = ep.employeeId
JOIN Project p ON ep.projectId = p.projectId
WHERE p.projectName IN ('Website Redesign', 'Mobile App')
GROUP BY e.employeeId
HAVING COUNT(DISTINCT p.projectName) = 2;

--24
sql
SELECT e.employeeName
FROM Employee e
WHERE e.managerId = (
    SELECT managerId
    FROM Employee
    WHERE employeeName = 'Bob'
) AND e.employeeName != 'Bob';

--25
sql
SELECT d.departmentName, AVG(e.salary) AS avgSalary
FROM Employee e
JOIN Department d ON e.departmentId = d.departmentId
GROUP BY d.departmentId
HAVING COUNT(e.employeeId) > 1;

--26

sql
SELECT e.employeeName, e.salary
FROM Employee e
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
) AND e.employeeId NOT IN (
    SELECT DISTINCT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
);

--27
sql
SELECT DISTINCT p.projectName
FROM Project p
JOIN EmployeeProject ep ON p.projectId = ep.projectId
JOIN Employee e ON ep.employeeId = e.employeeId
JOIN Department d ON e.departmentId = d.departmentId
WHERE d.departmentName = 'Engineering';

--28
sql
SELECT 
    e.employeeName AS employee,
    m.employeeName AS manager,
    gm.employeeName AS grandManager
FROM Employee e
LEFT JOIN Employee m ON e.managerId = m.employeeId
LEFT JOIN Employee gm ON m.managerId = gm.employeeId;

--29

SELECT e.employeeName, p.projectName, ep.assignedDate, e.hireDate
FROM EmployeeProject ep
JOIN Employee e ON ep.employeeId = e.employeeId
JOIN Project p ON ep.projectId = p.projectId
WHERE ep.assignedDate < e.hireDate;

--30

SELECT p.projectName, COUNT(ep.employeeId) AS employeeCount
FROM Project p
LEFT JOIN EmployeeProject ep ON p.projectId = ep.projectId
WHERE p.endDate > CURRENT_DATE
GROUP BY p.projectId
HAVING COUNT(ep.employeeId) < 3;
