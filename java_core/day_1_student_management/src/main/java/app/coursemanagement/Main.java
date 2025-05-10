package app.coursemanagement;

import com.coursemanagement.*;

import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        CourseManager cm = new CourseManager();
        Scanner scanner = new Scanner(System.in);

        cm.addStudentSample();
        cm.addCourseSample();

        boolean running = true;

        while (running) {
            System.out.println("\n====== COURSE MANAGEMENT MENU ======");
            System.out.println("1. Enroll student to course");
            System.out.println("2. View students in a course");
            System.out.println("3. View courses of a student");
            System.out.println("4. Course with most students");
            System.out.println("5. Student with most courses");
            System.out.println("0. Exit");
            System.out.print("Select an option: ");

            String choice = scanner.nextLine();

            switch (choice) {
                case "1" -> {
                    System.out.print("Enter student ID: ");
                    String studentId = scanner.nextLine();
                    System.out.print("Enter course ID: ");
                    String courseId = scanner.nextLine();
                    Error err = cm.enrollCourse(studentId, courseId);
                    if (err != null) {
                        System.out.println("Error: " + err.getMessage());
                    } else {
                        System.out.println("Enrollment successful.");
                    }
                }
                case "2" -> {
                    System.out.print("Enter course ID: ");
                    String courseId = scanner.nextLine();
                    List<Student> students = cm.courseStudentList(courseId);
                    if (students.isEmpty()) {
                        System.out.println("No students enrolled in this course.");
                    } else {
                        System.out.println("Students in course " + courseId + ":");
                        students.forEach(s ->
                                System.out.println("- " + s.getName() + " (" + s.getId() + ")"));
                    }
                }
                case "3" -> {
                    System.out.print("Enter student ID: ");
                    String studentId = scanner.nextLine();
                    List<Course> courses = cm.studentCourseList(studentId);
                    if (courses.isEmpty()) {
                        System.out.println("This student is not enrolled in any courses.");
                    } else {
                        System.out.println("Courses for student " + studentId + ":");
                        courses.forEach(c ->
                                System.out.println("- " + c.getTitle() + " (" + c.getId() + ")"));
                    }
                }
                case "4" -> {
                    Course topCourse = cm.courseWithMostStudents();
                    if (topCourse != null) {
                        System.out.println("Course with most students: " +
                                topCourse.getTitle() + " (" + topCourse.getId() + ")");
                    } else {
                        System.out.println("No enrollments found.");
                    }
                }
                case "5" -> {
                    Student topStudent = cm.studentWithMostCourses();
                    if (topStudent != null) {
                        System.out.println("Student with most courses: " +
                                topStudent.getName() + " (" + topStudent.getId() + ")");
                    } else {
                        System.out.println("No enrollments found.");
                    }
                }
                case "0" -> {
                    System.out.println("Exiting program. Goodbye!");
                    running = false;
                }
                default -> System.out.println("Invalid option. Please try again.");
            }
        }

        scanner.close();
    }
}
