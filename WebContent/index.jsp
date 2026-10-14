<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Automated Timetable Scheduler</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Theme CSS -->
<link href="css/agency.min.css" rel="stylesheet">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" class="index">

	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-custom navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top"><i class="fa fa-calendar-check-o text-primary"></i> Automated Timetable Scheduler</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a href="admin-login.jsp" style="color: #93c5fd; font-weight: 600;"><i class="fa fa-cogs"></i> Admin</a></li>
					<li><a href="faculty-login.jsp" style="color: #bae6fd; font-weight: 600;"><i class="fa fa-user-circle"></i> Faculty</a></li>
					<li><a href="student-login.jsp" style="color: #a7f3d0; font-weight: 600;"><i class="fa fa-graduation-cap"></i> Student</a></li>
					<li><a href="how-to-use.jsp"><i class="fa fa-book"></i> Guide</a></li>
					<li><a class="page-scroll" href="#about">About</a></li>
					<li><a class="page-scroll" href="#services">Features</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- Header -->
	<header>
		<div class="container">
			<div class="intro-text" style="padding-top: 150px; padding-bottom: 120px;">
				<div class="intro-lead-in" style="font-size: 26px; text-transform: uppercase; letter-spacing: 2px; color: #93c5fd; margin-bottom: 15px;">
					Intelligent Academic Scheduling System
				</div>
				<div class="intro-heading" style="font-size: 48px; font-weight: 800; text-transform: none; margin-bottom: 25px;">
					Automated Timetable Scheduler
				</div>
				<p style="max-width: 720px; margin: 0 auto 35px; font-size: 16px; color: #e2e8f0; text-shadow: 0 2px 4px rgba(0,0,0,0.6);">
					Optimized genetic algorithm scheduling with zero clashes, balanced faculty workload, dedicated lab reservations, and role-based access for Administrators, Faculty, and Students.
				</p>
				<div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 14px; margin-top: 20px;">
					<a href="admin-login.jsp" class="btn btn-xl" style="background: #1e3a8a; border-color: #2563eb; color: #fff; padding: 16px 28px; font-size: 15px; font-weight: 700; border-radius: 8px; box-shadow: 0 10px 20px rgba(0,0,0,0.3);">
						<i class="fa fa-cogs"></i> Login as Admin
					</a>
					<a href="faculty-login.jsp" class="btn btn-xl" style="background: #0284c7; border-color: #0ea5e9; color: #fff; padding: 16px 28px; font-size: 15px; font-weight: 700; border-radius: 8px; box-shadow: 0 10px 20px rgba(0,0,0,0.3);">
						<i class="fa fa-user-circle"></i> Login as Faculty
					</a>
					<a href="student-login.jsp" class="btn btn-xl" style="background: #059669; border-color: #10b981; color: #fff; padding: 16px 28px; font-size: 15px; font-weight: 700; border-radius: 8px; box-shadow: 0 10px 20px rgba(0,0,0,0.3);">
						<i class="fa fa-graduation-cap"></i> Login as Student
					</a>
				</div>
			</div>
		</div>
	</header>


	<!-- About Section -->
	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">About this Software</h2>
					<h3 class="section-subheading text-muted">Read to know what
						this is about.</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<ul class="timeline">
						<li>
							<div class="timeline-image">
								<img class="img-circle img-responsive" src="img/1.jpg" alt="">
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">

									<h4 class="subheading">Introduction</h4>
								</div>
								<div class="timeline-body">
									<p class="text-muted">This is a free site to generate
										complete college schedule for which would be a tedious and
										error prone task to do by hand (on paper). We provide a very
										user friendly interface to work with and you will get your
										time table generated in seconds.</p>
								</div>
							</div>
						</li>
						<li class="timeline-inverted">
							<div class="timeline-image">
								<img class="img-circle img-responsive" src="img/2.png" alt="">
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">

									<h4 class="subheading">How to proceed</h4>
								</div>
								<div class="timeline-body">
									<p class="text-muted">You need to be logged in to make use
										of this free software. Once logged in, you will need to
										provide important details like batch names,subjects, faculties
										in college etc and you are ready to go.</p>
								</div>
							</div>
						</li>
						<li>
							<div class="timeline-image">
								<img class="img-circle img-responsive" src="img/3.jpg" alt="">
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="subheading">Quality of time table</h4>
								</div>
								<div class="timeline-body">
									<p class="text-muted">The software makes sure that the
										generated time table is feasible at the least (there is no
										clash) ,students get required hours each week and teachers are
										given equal load. The user will be given more options to
										refine timetable using some soft constraints(like setting
										preference for a teacher,guest faculty, lab consideration etc)
										in a later version.</p>
								</div>
							</div>
						</li>

						<li class="timeline-inverted"><a href="form">
								<div class="timeline-image">
									<h4>
										Get started <br>with us <br>today!
									</h4>
								</div>
						</a></li>

					</ul>
				</div>
			</div>
		</div>
	</section>


	<!-- Features Section -->
	<section id="services" class="bg-light-gray">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">Features</h2>
					<h3 class="section-subheading text-muted">The time table we
						generate is loaded with unique features.</h3>
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-4">
					<img src="img/student-friendly.jpg" class="img-circle"
						alt="student-friendly" width="250" height="250">

					<h4 class="service-heading">Student Friendly</h4>
					<p class="text-muted">Every subject is alloted exactly as many
						hours as required.</p>
				</div>
				<div class="col-md-4">
					<img src="img/teacher-friendly.jpg" class="img-circle"
						alt="Teacher-friendly" width="250" height="250">
					<h4 class="service-heading">Teacher Friendly</h4>
					<p class="text-muted">It is taken care that every teacher is
						given more or less same load.</p>
				</div>
				<div class="col-md-4">
					<img src="img/pdf-format.jpg" class="img-circle" alt="Pdf-format"
						width="250" height="250">

					<h4 class="service-heading">Pdf format for print</h4>
					<p class="text-muted">The final time table is available in pdf
						format and ready to print design.</p>
				</div>

				<div class="col-md-4">
					<img src="img/fully-online.png" class="img-circle"
						alt="student-friendly" width="250" height="250">

					<h4 class="service-heading">Fully Online</h4>
					<p class="text-muted">This is fully online software and no
						download is required.</p>
				</div>
				<div class="col-md-4">
					<img src="img/user-friendly-interface.png" class="img-circle"
						alt="student-friendly" width="250" height="250">

					<h4 class="service-heading">User-friendly Interface</h4>
					<p class="text-muted">This is extremely easy to use software
						and anyone with basic knowledge of computer can use it.</p>
				</div>
				<div class="col-md-4">
					<img src="img/support.png" class="img-circle"
						alt="student-friendly" width="250" height="250">

					<h4 class="service-heading">Amazing Support</h4>
					<p class="text-muted">We provide technical and non-technical
						support at any step you are stuck.</p>
				</div>


			</div>
		</div>
	</section>


	<!-- Contact Section -->
	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">Contact Us</h2>
					<h3 class="section-subheading text-muted">For any help or
						queries you can always contact us.</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<form name="sentMessage" id="contactForm" novalidate>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Your Name *" id="name" required
										data-validation-required-message="Please enter your name.">
									<p class="help-block text-danger"></p>
								</div>
								<div class="form-group">
									<input type="email" class="form-control"
										placeholder="Your Email *" id="email" required
										data-validation-required-message="Please enter your email address.">
									<p class="help-block text-danger"></p>
								</div>
								<div class="form-group">
									<input type="tel" class="form-control"
										placeholder="Your Phone *" id="phone" required
										data-validation-required-message="Please enter your phone number.">
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<textarea class="form-control" placeholder="Your Message *"
										id="message" required
										data-validation-required-message="Please enter a message."></textarea>
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="col-lg-12 text-center">
								<div id="success"></div>
								<button type="submit" class="btn btn-xl">Send Message</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-4">
					<ul class="list-inline social-buttons">
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="https://www.facebook.com/pranav.khurana.56"><i class="fa fa-facebook"></i></a></li>
						<li><a href="https://www.linkedin.com/in/pranav-khurana-421525115"><i class="fa fa-linkedin"></i></a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<ul class="list-inline quicklinks">
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Terms of Use</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div>Made with <span style="color: #e74c3c;font-size:30px;">&hearts;</span> by <a href="https://www.linkedin.com/in/pranav-khurana-421525115">Pranav</a> at JavaTpoint</div>
	</footer>


	<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Theme JavaScript -->
	<script src="js/agency.min.js"></script>

</body>

</html>
