<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    
    <style>
        /* General Reset */
               * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        h2, h1 {
        text-align:center;
            color: white;
        }

        h4 {
		    color: white; /* Set text color to white */
		    font-size: 1.1rem; /* Set font size */
		    text-align: center; /* Center-align the text */
		}


        /* Navbar Styles */
        .navbar {
            background-color: white;
            padding: 15px 0;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar ul {
            list-style: none;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .navbar ul li {
            margin: 0 20px;
        }

        .navbar ul li a {
            text-decoration: none;
            color: #764ba2;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 1.1rem;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .navbar ul li a:hover {
            background-color: #0056b3;
            color: white;
        }

        /* Section Styles */
        .section {
            padding: 60px 20px;
        }

        /* Home Section */
        .home-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .home-text {
            max-width: 50%;
            text-align: center;
        }

        .home-text h1 {
            font-size: 2.5em;
            margin-bottom: 1em;
        }

        .home-text p {
            font-size: 1.2em;
            margin-bottom: 1.5em;
        }

        .cta-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #764ba2;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0d47a1;
        }
        button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #764ba2;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0d47a1;
        }

        .home-image {
    width: 100%;  /* Make sure the parent container is 100% width of its parent */
    max-width: 45%;  /* Remove any max-width limitation */
    display: block; /* Ensure the container is a block element, so it takes full width */
}

.home-image img {
    width: 100%; /* Set image width to 100% of the container */
    height: auto; /* Maintain aspect ratio */
    border-radius: 10px;
}


        /* About Us Section */
        .about-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #f4f4f4;
            padding: 60px 20px;
            color: #764ba2;
        }

        .about-image {
    width: 100%;  /* Make sure the parent container is 100% width of its parent */
    max-width: 45%;  /* Remove any max-width limitation */
    display: block; /* Ensure the container is a block element, so it takes full width */
}

.about-image img {
    width: 100%; /* Set image width to 100% of the container */
    height: auto; /* Maintain aspect ratio */
    border-radius: 10px;
}


        .about-text {
            max-width: 50%;
        }

        .about-text h2 {
        text-align:center;
            font-size: 2em;
            margin-bottom: 1em;
            color: #764ba2;
        }

        .about-text p {
            font-size: 1.1em;
            margin-bottom: 1.5em;
            color: #764ba2;
        }

        /* Footer Styles */
        footer {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 1rem;
        }

        @media (max-width: 768px) {
            .home-section, .about-section {
                flex-direction: column;
                text-align: center;
            }

            .home-text, .about-text, .home-image, .about-image {
                max-width: 100%;
            }

            .home-image img, .about-image img {
                margin-top: 20px;
            }
        }
        
        #courses {
        .courses {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* Three courses in a row */
    gap: 2em;
    margin-top: 2em;
    padding: 0 1em; /* Add padding for consistent alignment */
    justify-content: center;
}

.course-card {
    background-color: white;
    padding: 1em;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
}

.course-card:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
}

.course-card img {
    width: 100%;
    border-radius: 8px;
    max-height: 150px;
    object-fit: cover;
    margin-bottom: 1em;
}

.course-card h3 {
    font-size: 1.5em;
    color: #1565c0;
    margin-bottom: 0.5em;
}

.course-card p {
    margin-bottom: 0.5em;
    color: #555;
}

.course-card .rating {
    color: #ffd700; /* Gold color for stars */
    font-size: 1.2em;
    margin-bottom: 1em;
}

.course-card .cta-button {
    display: inline-block;
    padding: 0.5em 1em;
    background-color: #1565c0;
    color: white;
    text-decoration: none;
    border-radius: 4px;
}

.course-card .cta-button:hover {
    background-color: #0d47a1;
}

/* Responsive Design */
@media (max-width: 1024px) {
    .courses {
        grid-template-columns: repeat(2, 1fr); /* Two courses in a row */
    }
}

@media (max-width: 768px) {
    .courses {
        grid-template-columns: 1fr; /* One course per row */
    }
}
        }

.mentors-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3 mentors in a row */
    gap: 2em;
    padding: 2em;
    justify-content: center;
}

.mentor-card {
    background-color: white;
    padding: 1em;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
    text-align: center; /* Center-align text */
    display: flex;
    flex-direction: column; /* Stack items vertically */
    align-items: center; /* Center items horizontally */
    justify-content: center; /* Center items vertically */
}


.mentor-card:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
}
.mentor-card h3 {
    margin-top: 0.5em;
    font-size: 1.2em;
    font-weight: bold;
    color: #764ba2; /* New color for mentor names */
}

.mentor-image {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    margin-bottom: 1em;
}

h3 {
    margin-top: 0.5em;
    font-size: 1.2em;
    font-weight: bold;
}

p {
    font-size: 1em;
    color: #666;
}

.feedback-form {
    display: flex; /* Flexbox for centering */
    flex-direction: column; /* Stack items vertically */
    align-items: center; /* Center horizontally */
    justify-content: center; /* Center vertically */
    width: 100%;
    max-width: 500px;
    margin: 0 auto; /* Center the form on the page */
    padding: 20px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.feedback-form label {
    width: 100%; /* Ensure labels span full width */
    text-align: left;
    margin-bottom: 5px;
    font-weight: bold;
    color: #764ba2;
}

.feedback-form input, .feedback-form textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 1rem;
}

.feedback-form button {
    width: 100%;
    padding: 10px;
    background-color: #764ba2;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 1rem;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease;
}

.feedback-form button:hover {
    background-color: #667eea;
}

.section1 {
    display: flex; /* Flexbox for centering */
    flex-direction: column;
    align-items: center; /* Center horizontally */
    justify-content: center; /* Center vertically */
    min-height: 100vh; /* Ensure section takes full height of viewport */
    padding: 20px;
    text-align: center; /* Center-align text */
}


        /* Feedback Section Styles */
#feedback {
    background: white;
    border-radius: 10px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
    margin: 40px auto;
    padding: 40px;
    text-align: center;
}

#feedback h2 {
    margin-bottom: 30px;
    color: #764ba2;
    font-size: 1.8em;
    display: flex;
    align-items: center;
    justify-content: center;
}

#feedback h2 i {
    margin-right: 10px;
    font-size: 36px;
    color: #667eea;
}

#feedback p {
    font-size: 1rem;
    color: #333;
    margin-bottom: 20px;
}

#feedback .form-group {
    position: relative;
    margin-bottom: 25px;
}

#feedback .floating-input {
    width: 100%;
    padding: 10px 15px 10px 40px;
    border: 2px solid #e0e0e0;
    border-radius: 7px;
    outline: none;
    transition: all 0.3s;
    font-size: 1rem;
}

#feedback .floating-input:focus {
    border-color: #764ba2;
}

#feedback .floating-label {
    position: absolute;
    top: 50%;
    left: 40px;
    transform: translateY(-50%);
    transition: all 0.3s;
    color: #999;
    font-size: 1rem;
}

#feedback .floating-input:focus + .floating-label,
#feedback .floating-input:not(:placeholder-shown) + .floating-label {
    top: -20px;
    left: 0;
    font-size: 12px;
    color: #764ba2;
}

#feedback .form-icon {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #999;
}

#feedback .login-button {
    width: 100%;
    padding: 12px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
    border-radius: 7px;
    cursor: pointer;
    transition: transform 0.2s;
    font-size: 1rem;
    font-weight: bold;
}

#feedback .login-button:hover {
    transform: scale(1.05);
}

#feedback .register-link {
    margin-top: 15px;
    font-size: 14px;
}

#feedback .register-link a {
    color: #764ba2;
    text-decoration: none;
}

#feedback .error-message {
    color: red;
    font-size: 12px;
    text-align: left;
    margin-top: 5px;
    display: none;
}

#feedback .error-message.show {
    display: block;
}

#feedback .success-message {
    display: none;
    position: fixed;
    top: 20px;
    left: 50%;
    transform: translateX(-50%);
    background-color: #4CAF50;
    color: white;
    padding: 15px;
    border-radius: 5px;
    font-size: 1rem;
}

#feedback .success-message.show {
    display: block;
}

/* Responsive Design */
@media (max-width: 768px) {
    #feedback {
        padding: 30px;
    }

    #feedback h2 {
        font-size: 1.5em;
    }

    #feedback .login-button {
        font-size: 0.9rem;
    }
}



        /* Footer Styles */
        /* Footer Styles */
footer {
    background-color: white; /* Keep the blue background for footer */
    font-color: #764ba2; /* Ensure text is white */
    text-align: center;
    padding: 20px 0; /* Adjust padding for a more balanced footer */
    position: relative;
    bottom: 0;
    width: 100%;
    font-size: 1rem;
}

/* Make footer text smaller and aligned */
footer p {
    margin: 0;
    color: #764ba2;
}

/* Responsive Design */
@media (max-width: 768px) {
    footer {
        padding: 15px 0; /* Adjust padding for smaller screens */
    }
}


        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar ul {
                flex-direction: column;
            }

            .navbar ul li {
                margin: 10px 0;
            }

            .navbar ul li a {
                padding: 12px 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar Section -->
    <nav class="navbar">
        <ul>
            <li><a href="#about">About Us</a></li>
            <li><a href="#courses">Courses</a></li>
            <li><a href="#mentor">Mentors</a></li>
            <li><a href="#feedback">Feedback</a></li>
            <li><a href="/login">Login</a></li>
        </ul>
    </nav>
    
        <!-- Home Section -->
    <section id="home" class="home-section section">
        <div class="home-text">
            <h1>Welcome to Your Mentorship Journey</h1>
            <h4>Connect with top mentors and coaches to accelerate your personal and professional growth.</h4>
            <a href="/login" class="cta-button">Get Started</a>
        </div>
        <div class="home-image">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTufpywcE80g7m9Oor6dR2BaTrNAwP6TVaiSHNJwq4AHvCNhFUwetNn0aSN_4LGuOLfhnE&usqp=CAU" alt="Mentorship Image">
        </div>
    </section>

    <!-- About Us Section -->
    <section id="about" class="about-section section">
        <div class="about-image">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0v8k_u-gCWzRYExsq1F2zgWucRMVaPs8LI6p11RdcMccguJDaHKm6rum9So6qgN-J60Y&usqp=CAU" alt="About Us Image">
        </div>
        <div class="about-text">
            <h2>About Us</h2>
            <p>At Mentorship and Coaching, we strive to empower individuals by connecting them with experienced mentors and coaches. Our mission is to provide the guidance and resources needed for growth and success in every aspect of life.</p>
            <p>Our platform is designed to match you with mentors who understand your goals and can help you achieve them through tailored guidance and support. Join us to embark on a journey of continuous learning and self-improvement.</p>
        </div>
    </section>

    <!-- Courses Section -->
    <section id="courses" class="section">
    <h1>Explore Our Courses</h1>
    <div class="courses">
        <div class="course-card">
            <img src="https://tse1.mm.bing.net/th?id=OIP.AbZBT3lhbTHcKspwOCghhwHaEh&pid=Api&P=0&h=180" alt="Introduction to Programming">
            <h3>Introduction to Programming</h3>
            <p>Learn the basics of programming in a fun and engaging way.</p>
            <div class="rating">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
        </div>
        <div class="course-card">
            <img src="https://nita.edu.sa/images/thumbs/0001202_web-development-advanced.jpeg" alt="Advanced Web Development">
            <h3>Advanced Web Development</h3>
            <p>Enhance your skills in HTML, CSS, and JavaScript.</p>
            <div class="rating">&#9733;&#9733;&#9733;&#9734;&#9734;</div>
        </div>
        <div class="course-card">
            <img src="https://anthonyhuntley.com/wp-content/uploads/2017/11/Data-Science-Overview.jpg" alt="Data Science Fundamentals">
            <h3>Data Science Fundamentals</h3>
            <p>Understand data analysis, visualization, and machine learning basics.</p>
            <div class="rating">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
        </div>
        <div class="course-card">
            <img src="https://tse1.mm.bing.net/th?id=OIP.CJpM2vh32a7cYmVjQryYewHaE7&pid=Api&P=0&h=180" alt="Digital Marketing Basics">
            <h3>Digital Marketing Basics</h3>
            <p>Learn digital marketing strategies and tools to grow your online presence.</p>
            <div class="rating">&#9733;&#9733;&#9733;&#9734;&#9734;</div>
        </div>
        <div class="course-card">
            <img src="https://tse3.mm.bing.net/th?id=OIP.if64vR9-9aZSOoxwc6zhnwHaEK&pid=Api&P=0&h=180" alt="Project Management Essentials">
            <h3>Project Management Essentials</h3>
            <p>Master project management techniques to lead successful projects.</p>
            <div class="rating">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
        </div>
        <div class="course-card">
            <img src="https://tse2.mm.bing.net/th?id=OIP.KeF6JasZLDD4ultyOumqZwHaD_&pid=Api&P=0&h=180" alt="Introduction to AI and ML">
            <h3>Introduction to AI and ML</h3>
            <p>Discover the fundamentals of artificial intelligence and machine learning.</p>
            <div class="rating">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
        </div>
    </div>
</section>

	<!-- Mentors Section -->
	<section id="mentor" class="section">
	 <h2>Our Mentors</h2>
        <div class="mentors-container">
            <div class="mentor-card">
                <img src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&auto=format&fit=crop&w=256&q=80" alt="Priya Sharma" class="mentor-image mx-auto d-block">
                <h3>John Doe</h3>
                <p>Expert in Leadership and Personal Growth. 10+ years of experience in coaching professionals.</p>
            </div>
            <div class="mentor-card">
                <img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&auto=format&fit=crop&w=256&q=80" alt="Michael Rodriguez" class="mentor-image mx-auto d-block">
                <h3>Jane Smith</h3>
                <p>Certified Career Counselor specializing in IT and Software Development mentoring.</p>
            </div>
            <div class="mentor-card">
                <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=crop&w=256&q=80" alt="Sarah Chen" class="mentor-image mx-auto d-block"/>
                <h3>Emily Johnson</h3>
                <p>Focuses on mindset coaching and stress management with a psychology background.</p>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </section>
	
	<!-- Feedback Section -->
	<section id="feedback" class="section1">
	    <h2>Feedback</h2>
	    <p>We value your feedback and strive to improve our platform.</p>
	
	    <!-- Feedback Form -->
	    <div class="feedback-form">
	        <form action="/submit-feedback" method="post">
	            <label for="name">Name</label>
	            <input type="text" id="name" name="name" placeholder="Your Name" required>
	
	            <label for="email">Email</label>
	            <input type="email" id="email" name="email" placeholder="Your Email" required>
	
	            <label for="message">Feedback</label>
	            <textarea id="message" name="message" rows="5" placeholder="Write your feedback here..." required></textarea>
	
	            <button type="submit">Submit Feedback</button>
	        </form>
	    </div>
	</section>


    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Your Company Name. All rights reserved.</p>
    </footer>
</body>
</html>
