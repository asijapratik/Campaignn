<%-- 
    Document   : UserVoting
    Created on : May 12, 2021, 6:42:10 PM
    Author     : KC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>User Voting</title>
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
    <body class="bg-light">
        <%
            if(session.getAttribute("Name")!=null)
                session.invalidate();
        %>
        <header id="header" class="fixed-top">
            <div class="container d-flex">
                <div class="logo mr-auto">
                    <h1><span>Campaignn</span></h1>
                </div>

                <nav class="nav-menu d-none d-lg-block">
                    <ul>
                        <li><a href="Home.jsp">Home</a></li>
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
        <div class="container align-items-center mt-5 mb-5">
            <div class="container-fluid bg-dark mt-5 mb-2">
                <h2 class="pt-4 font-weight-bold text-white text-center pb-2">${param.Electionname} at ${param.organization}</h2>
            </div>
            <div class="row">
                <div class="col-md-7 ml-2 mr-2 mt-5 mb-3 p-2 rounded bg-secondary text-white">
                    <h4 style="text-decoration:underline"><i class="fa fa-asterisk"></i>&nbsp;Important Points</h4>
                    <p>1) If you are Registered for this election you would have received a <span style="color:#00ff66">VoterID</span> and <span style="color:#00ff66">VoterPass</span> for this election.</p>
                    <p>2) If you have not received any email, contact the Election Administrator.</p>
                    <p>3) Enter the <span style="color:#00ff66">VoterID</span> and <span style="color:#00ff66">VoterPass</span> in the fields to the right and cast your vote.</p>
                    <p>4) Remember you can cast your vote only once so make sure you are using it for the right candidate.</p>
                    <p>5) After entering the details you will be redirected to the Voting Page where you will see all the Parties which are participating in the Election. Click select on the party for which you want to vote and click submit below.</p>
                </div>
                <div class="mt-5 ml-2 mr-2 col-md-4 ml-auto mb-5 p-2 rounded" style="background-color:#98fb98">
                    <h2 class="font-weight-bold mb-4 pl-0 pr-0 pt-2 pb-2 text-center bg-dark text-white">Enter Details</h2>
                    ${msg}
                    <form action="VoteServlet?Electionname=${param.Electionname}&organization=${param.organization}&hostname=${param.hostname}" method="post">
                        <div class="form-group">
                            <label for="voterid">Voter ID:</label>
                            <input type="text" class="form-control"  id="voterid" name="voterid" required>
                        </div>
                        <div class="form-group">
                            <label for="voterpass">Voter Pass:</label>
                            <input type="password" class="form-control" id="voterpass" name="voterpass" required>
                        </div>
                        <div class="text-center mt-5 mb-5">
                            <button type="submit" class="btn btn-default btn-outline-dark ">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <footer id="footer" class="fixed-bottom">
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
        </footer>
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
