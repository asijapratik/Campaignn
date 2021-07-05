<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
        <link rel="stylesheet" type="text/css" href="custom.css">
        <!--JS-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!--Fonts-->
        <script src="https://kit.fontawesome.com/fa6bbc7d37.js" crossorigin="anonymous"></script>
        <title>Home Page</title>
        
    </head>
    <body>
        <nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top">
            <div class="container">
                <a class="navbar-brand">
                    <img src="images/logo.JPG" alt="logo">
                </a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#Home">Home </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#Profile">My Profile </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#About">About </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#Services">Services </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#Portfolio">Portfolio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#Contact">Contact Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Logout</a>
                        </li>
                    </ul>
                </div> 
            </div>
        </nav>
        <div class="container" id="Home">
            <div id="demo" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                </ol>
                <!-- The slideshow--> 
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img class="d-block w-100" width="1100" height="700" src="images/Election.jpg" alt="First Slide">
                        <div class="carousel-caption">
                            <h3 class="text-dark">Online Elections</h3>
                            <p class="text-dark">A transparent,immutable verifiable online election system</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" width="1100" height="700" src="images/Survey.jpg" alt="Second Slide">
                        <div class="carousel-caption">
                            <h3 class="text-dark">Online Surveys</h3>
                            <p class="text-dark">Gather the data you need to make informed decisions with our free online survey tool.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" width="1100" height="700" src="images/Polls.jpg" alt="Third Slide">
                        <div class="carousel-caption">
                            <h3 class="text-dark">Online Polls</h3>
                            <p class="text-dark">Hear the voice of public on any matter you want.</p>
                        </div>
                    </div>
                    <!-- Left and right controls--> 
                    <a class="carousel-control-prev" href="#demo" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#demo" role="button" data-slide="next">
                      <span class="carousel-control-next-icon"></span>
                      <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
        <section class="about-section" id="About">
            <div class="container text-center">
                <div class="row">
                    <div class="col-lg-10 mx-auto">
                        <h2 class="section-title mb-4">About us</h2>
                        <p class="lead">
                            
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <section class="services-section bg-dark text-white" id="services">
            <div class="container text-center">
                <div class="content-section-heading">
                    <h2 class="mb-5 section-title">Services</h2>
                </div>
                <div class="row mb-4">
                    <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
                        <span class="services-icon rounded-circle mx-auto mb-3">
                            <i class="fa fa-mobile fa-3x"></i>
                        </span>
                        <h4 class="mb-1">
                            <strong>Responsive</strong>
                        </h4>
                        <p class="lead text-faded">
                        </p>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
                        <span class="services-icon rounded-circle mx-auto mb-3">
                            <i class="fa fa-mobile fa-3x"></i>
                        </span>
                        <h4 class="mb-1">
                            <strong>Redesigned</strong>
                        </h4>
                        <p class="lead text-faded">
                        </p>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
                        <span class="services-icon rounded-circle mx-auto mb-3">
                            <i class="fa fa-mobile fa-3x"></i>
                        </span>
                        <h4 class="mb-1">
                            <strong>Made With Love</strong>
                        </h4>
                        <p class="lead text-faded">
                        </p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <span class="services-icon rounded-circle mx-auto mb-3">
                            <i class="fa fa-mobile fa-3x"></i>
                        </span>
                        <h4 class="mb-1">
                            <strong>Ready to publish</strong>
                        </h4>
                        <p class="lead text-faded">
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <section class="portfolio-section" id="Portfolio">
            <div class="container">
                <div class="content-section-heading text-center">
                    <h2 class="mb-5 section-title">Portfolio</h2>
                </div>
                <div class="row no-gutters">
                    <div class="col-lg-6 col-md-6">
                        <a class="portfolio-items" href="#">
                            <div class="caption">
                                <div class="caption-content">
                                    <h2 class="text-uppercase mb-2">Heading 1</h2>
                                    <p class="lead">Welcome to Silas</p> 
                                </div>
                            </div>
                            <img class="img w-100" height="300" src="images/one.jpg"/>
                        </a>                        
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <a class="portfolio-items" href="#">
                            <div class="caption">
                                <div class="caption-content">
                                    <h2 class="text-uppercase mb-2">Heading 2</h2>
                                    <p class="lead">Welcome to Bilas</p>
                                </div>
                            </div>
                            <img class="img w-100" height="300" src="images/two.jpg"/>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <section class="contact-section bg-primary text-white" id="Contact">
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
                        <p class="d-block lead text-white" href="mailto:campaignn@gmail.com">campaignn@gmail.com</p>
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer py-3">
            <div class="container d-flex justify-content-center">
                <p class="lead">&copy;Copyright<span class="mark">Campaignn</span>.All Rights Reserved.</p>
            </div>
        </footer>
        <a href="#Home" class="go2top scroll"><i class="fa fa-arrow-up"></i></a>
    </body>
</html>
