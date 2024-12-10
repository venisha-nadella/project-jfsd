package com.project.controller;

import com.project.model.User;
import com.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
import java.util.Optional;

@Controller
@RequestMapping("/auth")
public class AuthController {
 
    @Autowired
    private UserService userService;

    // GET endpoint to display the registration page
    @GetMapping("/register")
    public String showRegisterPage() {
        return "common/register"; // Maps to /WEB-INF/views/common/register.jsp
    }

    // POST endpoint for processing registration
    @PostMapping("/register")
    public ResponseEntity<String> registerUser(@RequestBody User user) {
        if (userService.isUsernameUnique(user.getUsername())) {
            userService.registerUser(user);
            return ResponseEntity.status(HttpStatus.CREATED).body("User registered successfully!");
        } else {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Username already exists.");
        }
    }
 

    // GET endpoint to display the login page
    @GetMapping("/login")
    public String showLoginPage() {
        return "common/login"; // Maps to /WEB-INF/views/common/login.jsp
    }


    @PostMapping("/login")
    public ResponseEntity<String> login(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session) {

        Optional<User> user = userService.validateUser(username, password);
        if (user.isPresent()) {
            User loggedInUser = user.get();
            session.setAttribute("username", username);
            session.setAttribute("role", loggedInUser.getRole());
            session.setAttribute("userId", loggedInUser.getId()); // Add userId to session

            String role = loggedInUser.getRole();
            if ("ADMIN".equalsIgnoreCase(role)) {
                return ResponseEntity.ok("/admin/dashboard");
            } else if ("MENTOR".equalsIgnoreCase(role)) {
                return ResponseEntity.ok("/mentor/dashboard");
            } else {
                return ResponseEntity.ok("/user/dashboard");
            }
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials");
        }
    }

    @PostMapping("/logout")
    public ResponseEntity<String> logout(HttpSession session) {
        session.invalidate(); // Invalidate the session
        return ResponseEntity.ok("Logged out successfully");
    }
}
