-- Name: Huu Nguyen Van
-- Class: DTN_2503
-- Exercise #1

CREATE DATABASE IF NOT EXISTS UniversityManagement;
USE UniversityManagement;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    gpa DECIMAL(3,2) NOT NULL,
    CONSTRAINT gpa_range CHECK (gpa >= 0.0 AND gpa <= 4.0)
);

CREATE TABLE Professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits TINYINT NOT NULL,
    professor_id INT NOT NULL,
    CONSTRAINT credits_range CHECK (credits BETWEEN 1 AND 5),
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id)
);

CREATE TABLE Enrollments (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enroll_date DATE NOT NULL,
    grade TINYINT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    CONSTRAINT grade_range CHECK (grade BETWEEN 1 AND 20)
);
