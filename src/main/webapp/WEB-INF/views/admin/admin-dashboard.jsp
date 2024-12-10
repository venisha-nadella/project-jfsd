<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/navbar.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/dashboard.css">
    <title>Admin Dashboard</title>
    <!-- Chart.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .content {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }

        h1 {
            font-size: 2rem;
            color: #333;
            text-align: center;
        }

        .chart-container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px auto;
            max-width: 600px; /* Adjust container width */
            text-align: center;
        }

        .chart-container h2 {
            font-size: 1.5rem;
            color: #764ba2;
            margin-bottom: 20px;
        }

        canvas {
            max-width: 500px; /* Increased chart size */
            max-height: 500px;
            margin: 0 auto;
        }

        .table-container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px auto;
            max-width: 800px;
        }

        .table-container h2 {
            font-size: 1.5rem;
            color: #764ba2;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #764ba2;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        @media (max-width: 768px) {
            .content {
                padding: 10px;
            }

            canvas {
                max-width: 90%;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="admin-navbar.jsp" />

    <div class="content">
        <h1>Admin Dashboard</h1>
        <center><p style="margin-top: 1rem; color: #000;">This is the admin analysis dashboard.</p></center>

        <!-- Section for User Stats Pie Chart -->
        <div class="chart-container">
            <h2>User Statistics</h2>
            <canvas id="userStatsChart"></canvas>
        </div>
    </div>

    <script>
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

        // Fetch Admin Analysis Data
        async function fetchAdminData() {
            try {
                // Fetch user stats for the pie chart
                const userStatsResponse = await fetch('<%= request.getContextPath() %>/analysis/admin/user-stats');
                const userStatsData = await userStatsResponse.json();

                // Populate Pie Chart
                const ctx = document.getElementById('userStatsChart').getContext('2d');
                const userStatsChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: ['Mentors', 'Users'],
                        datasets: [{
                            label: 'User Distribution',
                            data: [userStatsData.mentors, userStatsData.users],
                            backgroundColor: ['#3498db', '#2ecc71'], // Colors for chart
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                    }
                });

                // Fetch enrolled students data for the table
                const enrollmentResponse = await fetch('<%= request.getContextPath() %>/analysis/admin/enrolled-students');
                const enrollmentData = await enrollmentResponse.json();

                // Populate Enrollment Table
                const tableBody = document.querySelector('#enrollmentTable tbody');
                enrollmentData.forEach(row => {
                    const tr = document.createElement('tr');
                    tr.innerHTML = `<td>${row.courseName}</td><td>${row.studentCount}</td>`;
                    tableBody.appendChild(tr);
                });
            } catch (error) {
                console.error('Error fetching analysis data:', error);
            }
        }

        // Initialize Dashboard Data
        fetchAdminData();
    </script>
</body>
</html>
