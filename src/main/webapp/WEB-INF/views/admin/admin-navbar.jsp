<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="navbar.css">
</head>
<body>
    <nav class="navbar">
        <div class="navbar-brand">
            <div class="logo">A</div>
            <span class="logo-text">Admin Panel</span>
        </div>

        <div class="navbar-menu">
            <div class="navbar-item has-dropdown">
                <a href="<%= request.getContextPath() %>/admin/dashboard" class="dropdown-item">Dashboard</a>
            </div>
            
            <div class="navbar-item has-dropdown">
                <a href="<%= request.getContextPath() %>/profile/admin" class="dropdown-item">Profile</a>
            </div>
            
            <div class="navbar-item has-dropdown">
                    <a href="<%= request.getContextPath() %>/courses" class="dropdown-item">Courses</a>
            </div>
            
            <div class="navbar-item has-dropdown">
                    <a href="<%= request.getContextPath() %>/admin/manage-users" class="dropdown-item">Manage Users</a>
            </div>
            
            <div class="navbar-item has-dropdown">
                    <a href="<%= request.getContextPath() %>/admin/manage-courses" class="dropdown-item">Manage Courses</a>
            </div>
        </div>

        <div class="navbar-end">
            <a href="#" onclick="logout()" class="navbar-item logout-btn">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </a>
            <div class="mobile-toggle" id="mobileToggle">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </nav>

    <script>
        function logout() {
            fetch('<%= request.getContextPath() %>/auth/logout', {
                method: 'POST',
                credentials: 'include'
            }).then(response => {
                if (response.ok) {
                    window.location.href = '<%= request.getContextPath() %>/auth/login';
                } else {
                    alert('Error during logout');
                }
            }).catch(error => {
                console.error('Logout failed:', error);
            });
        }

        // Mobile menu toggle
        document.getElementById('mobileToggle').addEventListener('click', function() {
            document.querySelector('.navbar-menu').classList.toggle('is-active');
            this.classList.toggle('is-active');
        });

        // Dropdown menu logic
        document.querySelectorAll('.navbar-item.has-dropdown').forEach(item => {
            item.addEventListener('click', function(e) {
                e.stopPropagation();
                this.classList.toggle('is-active');
            });
        });

        // Close dropdowns when clicking outside
        document.addEventListener('click', function() {
            document.querySelectorAll('.navbar-item.has-dropdown').forEach(item => {
                item.classList.remove('is-active');
            });
        });
    </script>
</body>
</html>