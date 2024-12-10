<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>

<%
    // Check if the session already exists
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if no session exists
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/navbar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMeUg8v3gQ6zNBK5imEK0AGzhR5VfLIA3hNdcBu" crossorigin="anonymous">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate, max-age=0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">

    <!-- CSS for professional look -->
    <style>
        /* Dashboard Main Container */
        .content {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        h1 {
            font-size: 2.5rem;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 15px;
        }

        p {
            font-size: 1.2rem;
            color: #7f8c8d;
            text-align: center;
            margin-bottom: 30px;
        }

        /* Dashboard Info Section */
        .dashboard-info {
            background-color: #f4f6f7;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .dashboard-info h2 {
            font-size: 1.6rem;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 15px;
        }

        .dashboard-info ul {
            list-style: none;
            padding: 0;
        }

        .dashboard-info ul li {
            background-color: #fff;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            font-size: 1.1rem;
            line-height: 1.6;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .dashboard-info ul li:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .dashboard-info ul li strong {
            font-weight: bold;
            color: #1abc9c;
        }

        /* Responsive Design for Mobile */
        @media (max-width: 768px) {
            .content {
                padding: 15px;
            }

            h1 {
                font-size: 2rem;
            }

            p {
                font-size: 1rem;
            }

            .dashboard-info {
                padding: 15px;
            }

            .dashboard-info ul li {
                font-size: 1rem;
                padding: 12px;
            }
        }
    </style>

</head>
<body>

   <jsp:include page="user-navbar.jsp" />

    <!-- Dashboard Content -->
    <div class="content">
        <h1>Welcome to the User Dashboard</h1>
        <p>Here you can access your courses, complete assignments, and build new skills.</p>

        <!-- New Information for the User -->
        <div class="dashboard-info">
            <h2>What You Can Do</h2>
            <ul>
                <li><strong>Enroll in Courses:</strong> Browse and enroll in various courses to enhance your knowledge and skills.</li>
                <li><strong>Complete Assignments:</strong> Stay on top of your learning by completing assignments and assessments in your courses.</li>
                <li><strong>Skill Development:</strong> Gain valuable skills by completing courses and improving your professional expertise.</li>
            </ul>
        </div>
    </div>

    <script>
        const sidebar = document.getElementById('sidebar');
        const toggleBtn = document.getElementById('toggleBtn');

        toggleBtn.addEventListener('click', () => {
            sidebar.classList.toggle('collapsed');
            toggleBtn.classList.toggle('collapsed');
        });
    </script>

   <script>
    async function logout() {
        try {
            const response = await fetch('<%= request.getContextPath() %>/auth/logout', {
                method: 'POST',
                credentials: 'include'
            });
            if (response.ok) {
                window.location.href = '<%= request.getContextPath() %>/auth/login'; // Updated URL for redirection
            } else {
                alert('Error during logout');
            }
        } catch (error) {
            console.error('Logout failed:', error);
        }
    }
</script>

</body>
</html>
