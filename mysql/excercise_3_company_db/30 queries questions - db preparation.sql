drop database if exists CompanyDB;
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Bảng phòng ban
CREATE TABLE Department (
    departmentId INT AUTO_INCREMENT PRIMARY KEY,
    departmentName VARCHAR(100) NOT NULL
);

-- Bảng nhân viên
CREATE TABLE Employee (
    employeeId INT AUTO_INCREMENT PRIMARY KEY,
    employeeName VARCHAR(100),
    email VARCHAR(100),
    salary DECIMAL(10,2),
    hireDate DATE,
    departmentId INT,
    managerId INT,
    FOREIGN KEY (departmentId) REFERENCES Department(departmentId),
    FOREIGN KEY (managerId) REFERENCES Employee(employeeId)
);

-- Bảng dự án
CREATE TABLE Project (
    projectId INT AUTO_INCREMENT PRIMARY KEY,
    projectName VARCHAR(100),
    startDate DATE,
    endDate DATE
);

-- Bảng phân công nhân viên vào dự án
CREATE TABLE EmployeeProject (
    employeeId INT,
    projectId INT,
    assignedDate DATE,
    PRIMARY KEY (employeeId, projectId),
    FOREIGN KEY (employeeId) REFERENCES Employee(employeeId),
    FOREIGN KEY (projectId) REFERENCES Project(projectId)
);

INSERT INTO Department (departmentName) VALUES
('Phòng Kỹ Thuật'),
('Phòng Nhân Sự'),
('Phòng Kinh Doanh'),
('Phòng Tài Chính'),
('Phòng Marketing');

-- Phòng Kỹ Thuật (ID = 1)
INSERT INTO Employee (employeeName, email, salary, hireDate, departmentId, managerId) VALUES
('Nguyễn Văn A', 'a@company.com', 2000.00, '2022-01-01', 1, NULL), -- Manager
('Nguyễn Văn B', 'b@company.com', 1500.00, '2022-02-01', 1, 1),
('Nguyễn Văn C', 'c@company.com', 1500.00, '2022-03-01', 1, 1),
('Nguyễn Văn D', 'd@company.com', 1500.00, '2022-04-01', 1, 1),
('Nguyễn Văn E', 'e@company.com', 1500.00, '2022-05-01', 1, 1),
('Nguyễn Văn F', 'f@company.com', 1500.00, '2022-06-01', 1, 1),
('Nguyễn Văn G', 'g@company.com', 1500.00, '2022-07-01', 1, 1),
('Nguyễn Văn H', 'h@company.com', 1500.00, '2022-08-01', 1, 1),
('Nguyễn Văn I', 'i@company.com', 1500.00, '2022-09-01', 1, 1),
('Nguyễn Văn K', 'k@company.com', 1500.00, '2022-10-01', 1, 1);

-- Phòng Nhân Sự (ID = 2)
INSERT INTO Employee (employeeName, email, salary, hireDate, departmentId, managerId) VALUES
('Trần Thị A', 'tta@company.com', 1900.00, '2022-01-01', 2, NULL), -- Manager (ID 11)
('Trần Thị B', 'ttb@company.com', 1400.00, '2022-02-01', 2, 11),
('Trần Thị C', 'ttc@company.com', 1400.00, '2022-03-01', 2, 11),
('Trần Thị D', 'ttd@company.com', 1400.00, '2022-04-01', 2, 11),
('Trần Thị E', 'tte@company.com', 1400.00, '2022-05-01', 2, 11),
('Trần Thị F', 'ttf@company.com', 1400.00, '2022-06-01', 2, 11),
('Trần Thị G', 'ttg@company.com', 1400.00, '2022-07-01', 2, 11),
('Trần Thị H', 'tth@company.com', 1400.00, '2022-08-01', 2, 11),
('Trần Thị I', 'tti@company.com', 1400.00, '2022-09-01', 2, 11),
('Trần Thị K', 'ttk@company.com', 1400.00, '2022-10-01', 2, 11);

-- Phòng Kinh Doanh (ID = 3)
-- Manager là ID 21
INSERT INTO Employee (employeeName, email, salary, hireDate, departmentId, managerId) VALUES
('Lê Văn A', 'lva@company.com', 1950.00, '2022-01-01', 3, NULL),
('Lê Văn B', 'lvb@company.com', 1450.00, '2022-02-01', 3, 21),
('Lê Văn C', 'lvc@company.com', 1450.00, '2022-03-01', 3, 21),
('Lê Văn D', 'lvd@company.com', 1450.00, '2022-04-01', 3, 21),
('Lê Văn E', 'lve@company.com', 1450.00, '2022-05-01', 3, 21),
('Lê Văn F', 'lvf@company.com', 1450.00, '2022-06-01', 3, 21),
('Lê Văn G', 'lvg@company.com', 1450.00, '2022-07-01', 3, 21),
('Lê Văn H', 'lvh@company.com', 1450.00, '2022-08-01', 3, 21),
('Lê Văn I', 'lvi@company.com', 1450.00, '2022-09-01', 3, 21),
('Lê Văn K', 'lvk@company.com', 1450.00, '2022-10-01', 3, 21);

-- Phòng Tài Chính (ID = 4), Manager ID 31
INSERT INTO Employee (employeeName, email, salary, hireDate, departmentId, managerId) VALUES
('Phạm Thị A', 'pta@company.com', 2100.00, '2022-01-01', 4, NULL),
('Phạm Thị B', 'ptb@company.com', 1600.00, '2022-02-01', 4, 31),
('Phạm Thị C', 'ptc@company.com', 1600.00, '2022-03-01', 4, 31),
('Phạm Thị D', 'ptd@company.com', 1600.00, '2022-04-01', 4, 31),
('Phạm Thị E', 'pte@company.com', 1600.00, '2022-05-01', 4, 31),
('Phạm Thị F', 'ptf@company.com', 1600.00, '2022-06-01', 4, 31),
('Phạm Thị G', 'ptg@company.com', 1600.00, '2022-07-01', 4, 31),
('Phạm Thị H', 'pth@company.com', 1600.00, '2022-08-01', 4, 31),
('Phạm Thị I', 'pti@company.com', 1600.00, '2022-09-01', 4, 31),
('Phạm Thị K', 'ptk@company.com', 1600.00, '2022-10-01', 4, 31);

-- Phòng Marketing (ID = 5), Manager ID 41
INSERT INTO Employee (employeeName, email, salary, hireDate, departmentId, managerId) VALUES
('Đỗ Văn A', 'dva@company.com', 1850.00, '2022-01-01', 5, NULL),
('Đỗ Văn B', 'dvb@company.com', 1350.00, '2022-02-01', 5, 41),
('Đỗ Văn C', 'dvc@company.com', 1350.00, '2022-03-01', 5, 41),
('Đỗ Văn D', 'dvd@company.com', 1350.00, '2022-04-01', 5, 41),
('Đỗ Văn E', 'dve@company.com', 1350.00, '2022-05-01', 5, 41),
('Đỗ Văn F', 'dvf@company.com', 1350.00, '2022-06-01', 5, 41),
('Đỗ Văn G', 'dvg@company.com', 1350.00, '2022-07-01', 5, 41),
('Đỗ Văn H', 'dvh@company.com', 1350.00, '2022-08-01', 5, 41),
('Đỗ Văn I', 'dvi@company.com', 1350.00, '2022-09-01', 5, 41),
('Đỗ Văn K', 'dvk@company.com', 1350.00, '2022-10-01', 5, 41);

INSERT INTO Project (projectName, startDate, endDate) VALUES
-- Phòng 1
('Dự án Kỹ Thuật 1', '2023-01-01', '2023-06-01'),
('Dự án Kỹ Thuật 2', '2023-02-01', '2023-07-01'),
('Dự án Kỹ Thuật 3', '2023-03-01', '2023-08-01'),
('Dự án Kỹ Thuật 4', '2023-04-01', '2023-09-01'),
('Dự án Kỹ Thuật 5', '2023-05-01', '2023-10-01'),

-- Phòng 2
('Dự án Nhân Sự 1', '2023-01-10', '2023-06-10'),
('Dự án Nhân Sự 2', '2023-02-10', '2023-07-10'),
('Dự án Nhân Sự 3', '2023-03-10', '2023-08-10'),
('Dự án Nhân Sự 4', '2023-04-10', '2023-09-10'),
('Dự án Nhân Sự 5', '2023-05-10', '2023-10-10'),

-- Phòng 3
('Dự án Kinh Doanh 1', '2023-01-20', '2023-06-20'),
('Dự án Kinh Doanh 2', '2023-02-20', '2023-07-20'),
('Dự án Kinh Doanh 3', '2023-03-20', '2023-08-20'),
('Dự án Kinh Doanh 4', '2023-04-20', '2023-09-20'),
('Dự án Kinh Doanh 5', '2023-05-20', '2023-10-20'),

-- Phòng 4
('Dự án Tài Chính 1', '2023-01-30', '2023-06-30'),
('Dự án Tài Chính 2', '2023-02-28', '2023-07-30'),
('Dự án Tài Chính 3', '2023-03-30', '2023-08-30'),
('Dự án Tài Chính 4', '2023-04-30', '2023-09-30'),
('Dự án Tài Chính 5', '2023-05-30', '2023-10-30'),

-- Phòng 5
('Dự án Marketing 1', '2023-01-15', '2023-06-15'),
('Dự án Marketing 2', '2023-02-15', '2023-07-15'),
('Dự án Marketing 3', '2023-03-15', '2023-08-15'),
('Dự án Marketing 4', '2023-04-15', '2023-09-15'),
('Dự án Marketing 5', '2023-05-15', '2023-10-15');

INSERT INTO EmployeeProject (employeeId, projectId) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
(2, 1), (2, 2),
(3, 2), (3, 3),
(4, 3), (4, 4),
(5, 4), (5, 5);

INSERT INTO EmployeeProject (employeeId, projectId) VALUES
(11, 6), (11, 7), (11, 8), (11, 9), (11, 10),
(12, 6), (12, 7),
(13, 7), (13, 8),
(14, 8), (14, 9),
(15, 9), (15, 10);

INSERT INTO EmployeeProject (employeeId, projectId) VALUES
(21, 11), (21, 12), (21, 13), (21, 14), (21, 15),
(22, 11), (22, 12),
(23, 12), (23, 13),
(24, 13), (24, 14),
(25, 14), (25, 15);

INSERT INTO EmployeeProject (employeeId, projectId) VALUES
(31, 16), (31, 17), (31, 18), (31, 19), (31, 20),
(32, 16), (32, 17),
(33, 17), (33, 18),
(34, 18), (34, 19),
(35, 19), (35, 20);

INSERT INTO EmployeeProject (employeeId, projectId) VALUES
(41, 21), (41, 22), (41, 23), (41, 24), (41, 25),
(42, 21), (42, 22),
(43, 22), (43, 23),
(44, 23), (44, 24),
(45, 24), (45, 25);