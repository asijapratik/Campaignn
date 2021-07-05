<%-- 
    Document   : newjsp1
    Created on : 25 May, 2021, 1:03:06 PM
    Author     : Arora computers
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Surveys</title>
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
        <link href="assets/css/style1.css" rel="stylesheet">
    </head>
    <body>
        <header id="header" class="fixed-top bg-light">
            <div class="container d-flex">
                <div class="logo mr-auto">
                    <h1><span>Campaignn</span></h1>
                </div>

                <nav class="nav-menu d-none d-lg-block">
                    <ul>
                        <li><a href="Home.jsp">Home</a></li>
                        <c:if test="${Name!=null}">
                            <li><a target="blank" href="LoadProfile">My Profile</a></li>
                        </c:if>
                        <c:choose>
                            <c:when test="${Name!=null}">
                                <li><a href="/Voting%20System/LogoutServlet?redo=Surveys.jsp">Logout</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="login.jsp?redo=Surveys.jsp">Login</a></li>
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
        <div class="container  mx-auto" style="margin-top:100px" >
			<div class="row w-100 text-primary mt-4" style="font-weight:700; font-size:40px" >
			Survey
			<div class="border border-dark border-2 m-2"></div>
			</div>
			<div class="row">
				<div class="col-4 mt-5" >
					<div class="border border-2 border-primary"></div>
					<div class="card" >

 						<h2 class="card-header fw-bolder fs-3">Conduct The Survey</h2>
 						<div class="card-body">
    						<p class="card-text fs-5 mt-3 "><p class=" fs-4" style="font-weight:400">One can conduct survey here by adding questions according to wish and provide various choices for answers :-</p>
    							<p>Single Choice</p>
    							<p>Multiple Choice</p>
    							<p>Text</p>
    						</p>
    						<a href="surveydetails.jsp" class="btn btn-primary">Proceed >></a>
    					</div>
  					</div>
  				</div>


  				<div class="col-4 mt-5"  >
					<div class="border border-2 border-secondary"></div>
					<div class="card" >

 						<h2 class="card-header fw-bolder fs-3">Fill the Survey</h2>
 						<div class="card-body">
    						<p class="card-text fs-5 mt-3 "><p class=" fs-4" style="font-weight:400">One can see the details of the surveys currenty in action. One can select and fill those surveys for which one is eligible</p>
    							
    						</p>
    						<a href="fetchdetails.jsp" class="btn btn-secondary mt-3">Proceed >></a>
    					</div>
  					</div>
  				</div>
                                <div class="col-4 mt-5" >
					<div class="border border-2 border-danger"></div>
					<div class="card" >

 						<h2 class="card-header fw-bolder fs-3">Check Result</h2>
 						<div class="card-body">
    						<p class="card-text fs-5 mt-3 "><p class=" fs-4" style="font-weight:400">One can view and check the results of the surveys conducted by him by the various users.</p>
    							
    						</p>
    						<a href="choosesurvey.jsp" class="btn btn-danger">Proceed >></a>
    					</div>
  					</div>
  				</div>
			</div>
		</div>
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
