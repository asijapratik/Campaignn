<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="Conducting.ElectionDetails"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Elections</title>
        <!-- Favicons -->
        <link href="assets/img/logo.png" rel="icon">        
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
        <!--Begin Header-->
        <header id="header" class="fixed-top">
            <div class="container d-flex">
                <div class="logo mr-auto">
                    <h1><span>Campaignn</span></h1>
                    <!-- Uncomment below if you prefer to use an image logo -->
                    <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
                </div>

                <nav class="nav-menu d-none d-lg-block">
                    <ul>
                        <li><a href="Home.jsp">Home</a></li>
                        <c:if test="${Name!=null}">
                            <li><a target="blank" href="LoadProfile">My Profile</a></li>
                        </c:if>
                        <li class="drop-down"><a href="">Conduct Election</a>
                            <ul>
                                <li><a href="#rea">Register as Election Administrator</a></li>
                                <li><a href="#rpo">Register as Party Owner</a></li>
                            </ul>
                        </li>                        
                        <li><a href="#oe">Ongoing Elections(Vote Here)</a></li>
                        <c:choose>
                            <c:when test="${Name!=null}">
                                <li><a href="/Voting%20System/LogoutServlet?redo=Electionlist">Logout</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="login.jsp?redo=Electionlist">Login</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
                <div class="header-social-links">
                    <a href="#" class="twitter"><i class="icofont-twitter"></i></a>
                    <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
                    <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
                    <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a>
                </div>
            </div>
        </header>
        
        <!--End Header-->
        <!--Elections Info-->
        <section id="about" class="about mb-2">
            <div class="container">
                <h2>Elections</h2>
                <p> Online voting system is an online voting technique. In this system people who are authorized by the admin can cast his/her vote online without going to any physical
                    polling station. There are many voting procedures which are being used for Voting purpose, such as ballot paper, EVM machine but all these procedures require
                    more time and more man power so to eliminate all these drawbacks we provide an online voting system which provides features such as accuracy, convenience,
                    flexibility, privacy and verifiability. Our online voting system provides user a platform where he can register himself to vote remotely.
                <h4>Who should use?</h4><br>
                <div class="row bg-light text-center">
                    <div class="shadow col-md-3 bg-white ml-auto rounded mb-2">
                        <h6 class="pt-1 text-left"><strong>Membership Associations</strong></h6><br>
                            <img src="assets/img/Who/member.JPG" alt="member">
                    </div>
                    <div class="shadow col-md-3 ml-auto bg-white rounded mb-2">
                        <h6 class="pt-1 text-left"><strong>Condos & HOAs</strong></h6><br>
                        <img src="assets/img/Who/Condos.JPG" alt="condos">
                    </div>
                    <div class="shadow col-md-3 ml-auto mr-auto bg-white rounded mb-2">
                        <h6 class="pt-1 text-left"><strong>Unions</strong></h6><br>
                        <img src="assets/img/Who/Unions.JPG" alt="unions">
                    </div>
                </div>
                <div class="row  text-center">
                    <div class="shadow col-md-3 ml-auto bg-white rounded mb-2">
                        <h6 class="pt-1 text-left"><strong>Schools</strong></h6><br>
                        <img src="assets/img/Who/Schools.JPG" alt="schools">
                    </div>
                    <div class="shadow col-md-3 ml-auto bg-white rounded mb-2">
                        <h6 class="pt-1 text-left"><strong>Corporate & Shareholders</strong></h6><br>
                        <img src="assets/img/Who/Shareholders.JPG" alt="shareholders">
                    </div>
                    <div class="shadow col-md-3 ml-auto mr-auto bg-white rounded mb-2">
                        <h6 class="pt-1 text-left"><strong>Chambers, Civic Groups, etc.</strong></h6><br>
                        <img src="assets/img/Who/Chambers.JPG" alt="chambers">
                    </div>
                </div>
            </div>
        </section>
        <!--Elections Info ends-->
        <!--Conduct Election Start-->  
        <div class="container pb-3 pt-3" id="rea">
            <div class="mt-2 mb-3">
                <h2><strong>Conduct Election</strong></h2>
                <hr>
            </div>
            <div class="row mb-3">
                <div class="col-md-8">
                    <p>Want to conduct Elections? Read the steps below carefully and click on the button here to go to the conduct elections page.</p>
                </div>
                <div class="col-md-4 ml-auto">
                    <a href="AdminServlet" class="btn btn-danger ml-auto text-center pt-auto"><p>Register as Election Administrator&nbsp;&nbsp;&nbsp;<i class="fa fa-arrow-right" style="position:relative"></i></p></a>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-3 mb-3">
                <div class="card h-100">
                    <div class="card-header bg-primary text-white text-center">
                        <p>Step - <kbd>1</kbd></p>
                        <h4><strong>Fill Details</strong></h4>
                    </div>
                      <div class="card-body">                          
                          <p class="card-text">Click on the register as Administrator button and fill the details regarding the elections like name, start date&time and end date&time.</p>
                      </div>
                </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 mb-3">
                <div class="card h-100">
                    <div class="card-header bg-primary text-white text-center">
                        <p>Step - <kbd>2</kbd></p>
                        <h4><strong>Add Voters</strong></h4>
                    </div>
                    <div class="card-body bg-secondary text-white">
                        <p class="card-text">View the election details and add voters who are allowed to vote in the election.</p>
                    </div>
                </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 mb-3">
                <div class="card h-100">
                    <div class="card-header bg-primary text-white text-center">
                        <p>Step - <kbd>3</kbd></p>
                        <h4><strong>View Candidates</strong></h4>
                    </div>
                    <div class="card-body">
                        <p class="card-text">Now you can easily verify the candidates taking part and voters registered for election.</p>
                    </div>
                </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 mb-3">
                <div class="card h-100">
                    <div class="card-header bg-primary text-white text-center">
                        <p>Step - <kbd>4</kbd></p>
                        <h4><strong>View Results</strong></h4>
                    </div>
                    <div class="card-body bg-secondary text-white">
                        <p class="card-text">After Elections are over you will be able to view the results and publish them.</p>
                    </div>
                </div>
                </div>
            </div>
        </div>
         <!--Conduct Election End-->
         <!--Party Registration Started-->
        <div class="container pb-3 pt-4 bg-light" id="rpo">
            <div class="mb-3">
                <h2><strong>Party Registration</strong></h2>
                <hr>
            </div>
            <div class="row mb-3">
                <div class="col-md-8">
                    <p>Want to Campaignn during election? Read the steps below carefully and click on the button here to register as a Party for an Election</p>
                </div>
                <div class="col-md-4 ml-auto" style="float:right">
                    <a href="PartyServlet" class="btn btn-danger ml-auto text-center pt-auto"><p>Register as Party Owner&nbsp;&nbsp;&nbsp;<i class="fa fa-arrow-right"></i></p></a>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-3 mb-3 ml-auto">
                    <div class="card h-100">
                    <div class="card-header bg-primary text-white text-center">
                        <p>Step - <kbd>1</kbd></p>
                        <h4><strong>Register as Party Owner</strong></h4>
                    </div>
                      <div class="card-body">                          
                          <p class="card-text">Click on the register as Party Owner button.</p>
                      </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 mb-3">
                    <div class="card h-100">
                    <div class="card-header bg-primary text-white text-center ">
                        <p>Step - <kbd>2</kbd></p>
                        <h4><strong>Fill Details</strong></h4>
                    </div>
                    <div class="card-body bg-secondary text-white">
                        <p class="card-text">You will see a list of elections you are eligible to form party in. For every election you will have to fill details and specify your party candidate and party logo.</p>
                    </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-3 mr-auto">
                    <div class="card h-100">
                    <div class="card-header bg-primary text-white text-center">
                        <p>Step - <kbd>3</kbd></p>
                        <h4><strong>Wait for Verification</strong></h4>
                    </div>
                    <div class="card-body ">
                        <p class="card-text">Wait for Verification. Once Verified voters will be able to vote for you.</p>
                    </div>
                    </div>
                </div>
            </div>
        </div>
         <!--Party Registration End-->
         <!--Ongoing Elections Start-->
            <div class="container bg-white" id="oe">
                <div class="mb-2 pt-4 pb-2">
                    <h3><strong>Ongoing Elections</strong><small>&nbsp;(Vote Here)</small></h3>
                    <hr>
                </div>
                <div class="row">
                    <c:forEach var="el" items="${ElectionsList}">
                        <c:if test="${!el.conducted}">
                        <div class="col-sm-12 col-md-6 col-lg-4 mb-2">
                            <div class="card h-100">
                            <div class="card-header bg-dark text-white">${el.electionname}</div>
                            <div class="card-body mt-0">
                                <p class="card-text font-weight-bold mb-0">${el.organization}</p>
                                <p class="card-text font-weight-bold ">${el.organizationURL}</p>
                                <p class="card-text">${el.description}</p>
                                <div class="card-footer pt-auto">
                                <c:choose>
                                <c:when test="${el.live}">
                                    <div class="btn btn-danger"><div class="spinner-grow spinner-grow-sm relative-position"></div>&nbsp;Live Now</div>
                                    <div style="float:right"><a href="UserVoting.jsp?Electionname=${el.electionname}&organization=${el.organization}&hostname=${el.hostname}" id="logout" class="btn btn-info">Vote Here</a></div>
                                </c:when>
                                <c:otherwise>
                                    <p class="mb-0 mt-0">Starts On</p>
                                    <p class="mb-0">${el.startDate}&nbsp;${el.startTime}</p>
                                </c:otherwise>
                                </c:choose>
                                </div>
                            </div>
                            </div>
                        </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
         <!--Ongoing Elections End-->
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
        <script>
            $(function(){
                $('a#logout').click(function(){
                    if(<%=session.getAttribute("Name")!=null%>){
                        if(confirm('You will be Logged out. Are You Sure you want to Continue?')) {
                            return true;
                        }
                        return false;
                    }
                    return true;
                });
            });
        </script>
    </body>
</html>
