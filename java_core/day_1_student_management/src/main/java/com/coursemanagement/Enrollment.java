package com.coursemanagement;

import java.time.LocalDate;

public class Enrollment {
    private Student student;

    private Course course;

    private LocalDate enrollmentDate;

    public Enrollment(Student student, Course course, LocalDate date) {
        this.student = student;
        this.course = course;
        this.enrollmentDate = date;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Course getCourse() {
        return course;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Student getStudent() {
        return student;
    }

    public void setEnrollmentDate(LocalDate enrollmentDate) {
        this.enrollmentDate = enrollmentDate;
    }

    public LocalDate getEnrollmentDate() {
        return enrollmentDate;
    }
}

