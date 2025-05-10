package com.coursemanagement;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

public class CourseManager {
    private final Map<String, Student> students = new HashMap<>();
    private final Map<String, Course> courses = new HashMap<>();
    private final List<Enrollment> enrollments = new ArrayList<>();

    public void addStudentSample() {
        students.put("S1", new Student("S1", "John", "John@example.com"));
        students.put("S2", new Student("S2", "Sam", "Sam@example.com"));
        students.put("S3", new Student("S3", "Andy", "Andy@example.com"));
    }

    public void addCourseSample() {
        courses.put("C1", new Course("C1", "Java Core", 2));
        courses.put("C2", new Course("C2", "OOP", 3));
    }

    public Error enrollCourse(String studentId, String courseId) {
        Student student = students.get(studentId);
        Course course = courses.get(courseId);

        if (student == null || course == null) {
            return new Error("Student or course not found.");
        }

        long enrolledCount = enrollments.stream()
                .filter(e -> e.getCourse().getId().equals(courseId))
                .count();

        if (enrolledCount >= course.getMaxStudents()) {
            return new Error("Course is full.");
        }

        boolean alreadyEnrolled = enrollments.stream()
                .anyMatch(e -> e.getStudent().getId().equals(studentId)
                        && e.getCourse().getId().equals(courseId));

        if (alreadyEnrolled) {
            return new Error("Student already enrolled in this course.");
        }

        enrollments.add(new Enrollment(student, course, LocalDate.now()));
        return null;
    }

    public List<Student> courseStudentList(String courseId) {
        return enrollments.stream()
                .filter(e -> e.getCourse().getId().equals(courseId))
                .sorted(Comparator.comparing(Enrollment::getEnrollmentDate))
                .map(Enrollment::getStudent)
                .toList();
    }

    public List<Course> studentCourseList(String studentId) {
        return enrollments.stream()
                .filter(e -> e.getStudent().getId().equals(studentId))
                .map(Enrollment::getCourse)
                .toList();
    }

    public Course courseWithMostStudents() {
        return enrollments.stream()
                .collect(
                        Collectors.groupingBy(
                                e -> e.getCourse().getId(),
                                Collectors.counting()
                        )
                )
                .entrySet()
                .stream()
                .max(Map.Entry.comparingByValue())
                .map(entry -> courses.get(entry.getKey()))
                .orElse(null);
    }

    public Student studentWithMostCourses() {
        return enrollments.stream()
                .collect(
                        Collectors.groupingBy(
                                e -> e.getStudent().getId(),
                                Collectors.counting()
                        )
                )
                .entrySet()
                .stream()
                .max(Map.Entry.comparingByValue())
                .map(entry -> students.get(entry.getKey()))
                .orElse(null);
    }
}
