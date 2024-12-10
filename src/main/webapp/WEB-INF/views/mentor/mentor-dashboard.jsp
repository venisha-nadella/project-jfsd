<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.io.IOException" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f4f6;
        }

        .content {
            text-align: center;
            margin: 2em auto;
            padding: 2em;
            max-width: 900px;
            background-color: #ffffff;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
            border-radius: 12px;
        }

        .content h1 {
            font-size: 2.5em;
            color: #6f42c1; /* Purple color */
            margin-bottom: 0.5em;
            text-transform: uppercase;
        }

        .content p {
            font-size: 1.2em;
            color: #6c757d;
            margin-bottom: 1.5em;
        }

        .action-buttons {
            margin: 2em 0;
            display: flex;
            justify-content: center;
            gap: 1em;
        }

        .action-buttons button {
            background-color: #6f42c1; /* Purple color */
            color: #ffffff;
            border: none;
            padding: 0.8em 1.5em;
            border-radius: 8px;
            font-size: 1.1em;
            text-transform: capitalize;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, background-color 0.3s;
        }

        .action-buttons button:hover {
            background-color: #5a32a3; /* Darker purple */
            transform: translateY(-2px);
        }

        .available-courses,
        .insights,
        .assignments {
            text-align: left;
            margin-top: 2em;
            padding: 1.5em;
            background: #f8f9fa;
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .available-courses h2,
        .insights h2,
        .assignments h2 {
            color: #6f42c1; /* Purple color */
            font-size: 1.5em;
            margin-bottom: 0.8em;
            border-bottom: 2px solid #6f42c1; /* Purple border */
            display: inline-block;
            padding-bottom: 0.2em;
        }

        .available-courses ul,
        .assignments ul {
            list-style: none;
            padding: 0;
        }

        .available-courses li,
        .assignments li {
            padding: 0.8em 0;
            border-bottom: 1px solid #dee2e6;
            color: #6c757d;
            font-size: 1.1em;
        }

        .available-courses li:last-child,
        .assignments li:last-child {
            border-bottom: none;
        }

        .insights p {
            color: #6c757d;
            font-size: 1.1em;
            line-height: 1.6em;
        }

        .assignments li:hover {
            background-color: #e9ecef;
            cursor: pointer;
        }

        footer {
            margin-top: 2em;
            text-align: center;
            padding: 1em;
            background-color: #6f42c1; /* Purple background */
            color: #ffffff;
            border-radius: 8px;
        }

        footer p {
            margin: 0;
            font-size: 0.9em;
        }

        footer a {
            color: #ffffff;
            text-decoration: none;
            font-weight: bold;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);


    if (session == null || session.getAttribute("username") == null || !"MENTOR".equalsIgnoreCase((String) session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/auth/login");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor Dashboard</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/navbar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

    <%-- Include Mentor Navbar --%>
    <jsp:include page="/WEB-INF/views/mentor/mentor-navbar.jsp" />

    <div class="content">
        <h1>Welcome to the Mentor Dashboard</h1>
        <p>Here you can manage courses and interact with students.</p>

        <div class="action-buttons">
    <a href="<%= request.getContextPath() %>/mentor/create-course">
        <button>Create Course</button>
    </a>
    <a href="<%= request.getContextPath() %>/mentor/manage-courses">
        <button>View All Courses</button>
    </a>
</div>

    </div>

    <script>
        // Ensure that `sidebar` and `toggleBtn` elements exist
        const sidebar = document.getElementById('sidebar');
        const toggleBtn = document.getElementById('toggleBtn');

        if (sidebar && toggleBtn) {
            toggleBtn.addEventListener('click', () => {
                sidebar.classList.toggle('collapsed');
                toggleBtn.classList.toggle('collapsed');
            });
        }
    </script>

    <script>
        // Logout function
        async function logout() {
            try {
                const response = await fetch('<%= request.getContextPath() %>/auth/logout', {
                    method: 'POST',
                    credentials: 'include'
                });
                if (response.ok) {
                    window.location.href = '<%= request.getContextPath() %>/auth/login';
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

