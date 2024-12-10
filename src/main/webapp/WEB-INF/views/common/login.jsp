<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"> <!-- Include your CSS here -->
</head>
<body>
    <div class="container">
        <h1 class="title">
            <i class="fas fa-lock"></i>
            Welcome Back
        </h1>
        <form id="loginForm">
            <div class="form-group">
                <i class="fas fa-user form-icon"></i>
                <input type="text" id="username" name="username" class="floating-input" required placeholder=" ">
                <label for="username" class="floating-label">Username</label>
                <div class="error-message" id="usernameError"></div>
            </div>
            <div class="form-group">
                <i class="fas fa-key form-icon"></i>
                <input type="password" id="password" name="password" class="floating-input" required placeholder=" ">
                <label for="password" class="floating-label">Password</label>
                <div class="error-message" id="passwordError"></div>
            </div>
            <button type="submit" class="login-button">
                <i class="fas fa-sign-in-alt"></i> Login
            </button>
            <div class="register-link">
                Don't have an account? <a href="${pageContext.request.contextPath}/auth/register">Register Now</a>
            </div>
        </form>
    </div>

    <div class="success-message" id="successMessage">
        Login Successful!
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('loginForm');
            const successMessage = document.getElementById('successMessage');

            form.onsubmit = async function(event) {
                event.preventDefault();

                // Reset error messages
                document.querySelectorAll('.error-message').forEach(error => {
                    error.textContent = '';
                    error.classList.remove('show');
                });

                const formData = new FormData(form);
                const params = new URLSearchParams();
                params.append('username', formData.get('username'));
                params.append('password', formData.get('password'));

                let isValid = true;
                const username = formData.get('username');
                const password = formData.get('password');

                if (username.length < 4) {
                    document.getElementById('usernameError').textContent = 'Username must be at least 4 characters';
                    document.getElementById('usernameError').classList.add('show');
                    isValid = false;
                }

                if (password.length < 6) {
                    document.getElementById('passwordError').textContent = 'Password must be at least 6 characters';
                    document.getElementById('passwordError').classList.add('show');
                    isValid = false;
                }

                if (isValid) {
                    try {
                        const response = await fetch('${pageContext.request.contextPath}/auth/login?' + params.toString(), {
                            method: 'POST',
                            credentials: 'include'
                        });

                        if (response.ok) {
                            const redirectUrl = await response.text();
                            successMessage.classList.add('show');
                            setTimeout(() => {
                                successMessage.classList.remove('show');
                                if (redirectUrl === '/admin/dashboard') {
                                    window.location.href = '${pageContext.request.contextPath}/admin/dashboard';
                                } else if (redirectUrl === '/user/dashboard') {
                                    window.location.href = '${pageContext.request.contextPath}/courses/enrolled-courses';
                                } else if (redirectUrl === '/mentor/dashboard') {
                                    window.location.href = '${pageContext.request.contextPath}/mentor/manage-courses';
                                }
                            }, 1000);
                        } else {
                            alert('Invalid credentials!');
                        }
                    } catch (error) {
                        console.error('Login failed:', error);
                    }
                }
            };
        });
    </script>
</body>
</html>
