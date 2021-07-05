<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Campaignn</title>
        <!-- Favicons -->
        <link href="assets/img/logo1.JPG" rel="icon">        
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  
         <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/fa6bbc7d37.js" crossorigin="anonymous"></script>

        <!-- Main CSS File -->
        <link href="assets/css/style1.css" rel="stylesheet">
    </head>
    <body>
        <header id="header" class="fixed-top">
            <div class="container d-flex">
                <div class="logo mr-auto">
                    <h1><span>Campaignn</span></h1>
                </div>

                <nav class="nav-menu d-none d-lg-block">
                    <ul>
                        <li class="active"><a href="Home.jsp">Home</a></li>
                        <c:if test="${Name!=null}">
                            <li><a target="blank" href="LoadProfile">My Profile</a></li>
                        </c:if>
                        <li><a href="#about">About Us</a></li>
                        <li><a href="#services">Services</a></li>
                        <li><a href="#contact">Contact</a></li>
                        <c:choose>
                            <c:when test="${Name!=null}">
                                <li><a href="/Voting%20System/LogoutServlet?redo=Home.jsp">Logout</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="login.jsp?redo=Home.jsp">Login</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
                <div class="header-social-links">
                    <a href="#" class="twitter"><i class="icofont-twitter"></i></a>
                    <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
                    <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
                    <a href="#" class="linkedin"><i class="icofont-linkedin"></i></a>
                </div>
            </div>
        </header>
        <!--First Part-->
        <section id="hero">

            <div class="container">
              <div class="row">
                  <div class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center" ><!--data-aos="fade-up"-->
                  <div>
                    <h1>We help make your election process easier</h1>
                    <h2>We are dedicated to make your election process transparent,immutable and verifiable also help you conduct easy surveys</h2>
                    <a href="#about" class="btn-get-started scrollto">Get Started</a>
                  </div>
                </div>
                <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="fade-left">
                  <img src="assets/img/Election.jpg" class="img w-100" alt="">
                </div>
              </div>
            </div>

        </section>
        <!-- End First Part -->
        <main id="main">
        <section id="about" class="about">
            <div class="container">

                <div class="row">
                    <div class="col-lg-6" >
                        <img src="assets/img/Survey.jpg" class="img-fluid" alt="">
                    </div>
                    <div class="col-lg-6 d-flex flex-column justify-contents-center" >
                        <div class="content pt-4 pt-lg-0">
                            <h3>Learn more about us</h3>
                            <p class="font-italic">
                            We are committed to make online voting a norm in the world.
                            </p>
                            <ul>
                                <li><i class="icofont-check-circled"></i> Easy Election Process while maintaining the privacy of the voter.</li>
                                <li><i class="icofont-check-circled"></i> Survey generation made easy to get people views.</li>
                            </ul>
                            <p>
                              If you are looking to conduct Elections in your university or workplace you are at the right place. Visit the services section below to know the process.
                              If you want to conduct a survey to know people opinions you should head on to the services section down below.
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- End About Section -->
        <!--Features Section-->
            <section id="features" class="features">
                <div class="container">

                  <div class="row">
                    <div class="col-lg-6 mt-2 mb-tg-0 order-2 order-lg-1">
                      <ul class="nav nav-tabs flex-column">
                          <li class="nav-item" data-aos="fade-up">
                          <div class="nav-link">
                               <h4>Privacy</h4>
                            <p>Completely Private Voting System. Nobody will know who you vote for</p>
                          </div>
                        </li>
                        <li class="nav-item mt-2" data-aos="fade-up" data-aos-delay="100">
                          <div class="nav-link">
                            <h4>Statistical Result Representation</h4>
                            <p>Result of elections or surveys will be displayed in complete statistical form for easy interpretation.</p>
                          </div>
                        </li>
                        <li class="nav-item mt-2" data-aos="fade-up" data-aos-delay="200">
                          <div class="nav-link">
                              <h4>Secure</h4>
                            <p>Entirely Secure elections person will be given a randomly generated key for every election which will be non reusable.</p>
                          </div>
                        </li>
                        <li class="nav-item mt-2" data-aos="fade-up" data-aos-delay="300">
                          <div class="nav-link">
                            <h4>Flexible</h4>
                            <p>Easy voting from your comfort place and at any time you like</p>
                            
                          </div>
                        </li>
                      </ul>
                    </div>
                      <div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in">
                        <img src="assets/img/features-1.png" alt="" class="img-fluid">
                      </div>
                    </div>
                </div>
                    
            </section>
        <!--End Features Section-->
       <section id="services" class="services section-bg">
            <div class="container">

              <div class="section-title" data-aos="fade-up">
                <h2>Services</h2>
              </div>

              <div class="row">
                <div class="col-md-12 col-lg-6 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in">
                  <a href="Surveys.jsp" class="icon-box icon-box-pink text-dark">
                    <div class="icon"><i class="bx bx-question-mark"></i></div>
                    <h4 class="title">Conduct Surveys</h4>
                    <p class="description">You can conduct easy surveys to capture the voices and opinions of the people who matter the most to you.</p>
                  </a>
                </div>

                  <div class="col-md-12 col-lg-6 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="zoom-in" data-aos-delay="100">
                  <a href="Electionlist" class="icon-box icon-box-cyan text-dark">
                    <div class="icon"><i class="bx bx-poll"></i></div>
                    <h4 class="title">Conduct Elections</h4>
                    <p class="description">Easily conduct elections in your school,club or university and help voters vote conveniently.</p>
                  </a>
                  </div>
            </div>

           </div>
         </section><!-- End Services Section -->
         <!--Quote-->
        <section id="cta" class="cta">
            <div class="container">

                <div class="row" data-aos="zoom-in">
                  <div class="col-lg-12 text-center text-light">
                      <h2>Voting is the expression of our commitment to<br><strong>ourselves,one another,this country and this world.</strong></h2>
                        <em>- Sharon Salzberg</em>
                  </div>
                </div>
            </div>
        </section>
         <!--Quote Ends-->
         </main>
         <!--Contact Begins-->
         <section class="contact-section bg-light text-dark" id="contact">
            <div class="container text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <h2 class="section-title mb-3">Let's Get in Touch!</h2>
                        <p> Have Some Queries?or Need any help?Give us a call or send us an email and we will get back to you as soon as possible.
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5 col-md-5 ml-auto text-center mb-5 mb-lg-0">
                        <i class="fa fa-phone fa-3x mb-3"></i>
                        <p class="lead">+1 (555) 123-4567</p>
                    </div>
                    <div class="col-lg-5 col-md-5 mr-auto text-center">
                        <i class="fa fa-envelope fa-3x mb-3"></i>
                        <a class="d-block lead text-dark" href="mailto:campaignn3@gmail.com">campaignn3@gmail.com</a>
                    </div>
                </div>
            </div>
        </section>
         <!--Contact Ends-->
         <!--Footer Begins-->
         <div class="container-fluid text-white bg-dark">
             <div class="row">
             <div class="col-md-6 header-social-links text-left">
                    <a href="#" class="twitter"><i class="icofont-twitter"></i></a>
                    <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
                    <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
                    <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a>
             </div>
                    <div class="col-md-6 text-right pt-2">
                        <p class="text-right">&copy; Copyright <strong><span>Campaignn</span></strong>. All Rights Reserved</p>
                    </div>
             </div>
         </div>
         <!--Footer Ends-->
         <a href="#" class="back-to-top"><i class="bx bxs-up-arrow-alt"></i></a>
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/venobox/venobox.min.js"></script>
        <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>

        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
