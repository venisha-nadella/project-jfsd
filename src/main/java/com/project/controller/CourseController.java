package com.project.controller;

import com.project.model.Course;
import com.project.model.User;
import com.project.service.CourseService;
import com.project.service.UserService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/courses")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private UserService userService;

    @PostMapping("/enroll")
    public String enrollInCourse(@RequestParam Long courseId, HttpSession session) {
        String username = (String) session.getAttribute("username");
        String role = (String) session.getAttribute("role");

        if ("USER".equalsIgnoreCase(role) && username != null) {
            User user = userService.findByUsername(username).orElse(null);
            if (user != null) {
                courseService.enrollUserInCourse(user.getId(), courseId);
                return "redirect:/courses"; // Redirect back to courses after enrollment
            }
        }
        return "redirect:/auth/login";
    }

    @GetMapping("/enrolled-courses")
    public String showEnrolledCourses(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");

        if (username != null) {
            User user = userService.findByUsername(username).orElse(null);
            if (user != null) {
                List<Course> enrolledCourses = courseService.getEnrolledCoursesByUserId(user.getId());
                model.addAttribute("enrolledCourses", enrolledCourses);
                return "course/enrolled-courses"; // Correct mapping for enrolled-courses.jsp
            }
        }

        return "redirect:/auth/login";
    }

    // Mapping for all users to view available courses
    @GetMapping
    public String getAllCourses(Model model, HttpSession session) {
        List<Course> courses = courseService.getAllCourses();
        model.addAttribute("courses", courses);

        // Check the user's role from the session to conditionally include the navbar in JSP
        String role = (String) session.getAttribute("role");
        model.addAttribute("role", role);

        return "course/courses"; // Ensure the path matches /WEB-INF/views/course/courses.jsp
    }

    @GetMapping("/{id}")
    public String getCourseById(@PathVariable Long id, Model model, HttpSession session) {
        if (session.getAttribute("username") == null) {
            return "redirect:/auth/login";
        }

        Course course = courseService.getCourseById(id);
        if (course != null) {
            model.addAttribute("course", course);
            return "course/course-detail"; // Correct path to course-detail.jsp
        } else {
            return "redirect:/courses";
        }
    }

    @PostMapping
    public String addCourse(@ModelAttribute Course course) {
        courseService.saveCourse(course);
        return "redirect:/courses";
    }

    @PostMapping("/{id}")
    public String updateCourse(@PathVariable Long id, @ModelAttribute Course course) {
        courseService.updateCourse(id, course);
        return "redirect:/courses";
    }

    @PostMapping("/delete/{id}")
    public String deleteCourse(@PathVariable Long id) {
        courseService.deleteCourse(id);
        return "redirect:/courses";
    }
    
    @GetMapping("/video-session/{moduleId}")
    public ResponseEntity<byte[]> streamVideoSession(@PathVariable Long moduleId) {
        byte[] video = courseService.getSessionVideo(moduleId);

        if (video == null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok()
                .header("Content-Type", "video/mp4")
                .header("Accept-Ranges", "bytes")
                .body(video);
    }

    
}
