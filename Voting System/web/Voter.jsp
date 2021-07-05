<%@page import="java.util.HashSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="Conducting.ElectionDetails"%>
<%@page import="javafx.util.Pair"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Voter</title>
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
  <!-- Bootstrap core CSS -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="assets/css/simple-sidebar.css" rel="stylesheet">

</head>

<body onload="openTabe(event,'conduct')" >

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-dark border-right text-white" id="sidebar-wrapper">
        <div class="sidebar-heading"><h2>Hi!${Name}</h2></div>
        <br>
      <div class="list-group list-group-flush">
          <a style="font-size:12px; color:rgb(255,255,240);" href="Electionlist"><i class="fa fa-chevron-left"></i>&nbsp;Back to Elections page</a>
          <a href="Home.jsp" class="list-group-item list-group-item-action bg-dark text-white" ><i class="bx bx-home">&nbsp;</i>Home</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white"><i class='bx bxs-user-account'>&nbsp;</i>My Profile</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white active" onclick="openTab(event,'conduct')"><i class='bx bx-box'>&nbsp;</i>Register to Vote</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white" onclick="openTab(event, 'completed')"><i class="fa fa-vote-yea">&nbsp;</i>Successfully Voted</a>
        <a href="/Voting%20System/LogoutServlet" class="list-group-item list-group-item-action bg-dark text-white"><i class='bx bx-log-out' >&nbsp;</i>Logout</a>
      </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle">
            <span class="navbar-toggler-icon navbar-dark"></span>
        </button>
          <div class="logo mr-auto ml-auto" style="float:left">
              <h2 style="font-family:'Poppins',sans-serif;">Campaignn</h2>
          </div>
          <div class="header-social-links">
            <a href="#" class="twitter"><i class="icofont-twitter"></i></a>
            <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
            <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
            <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a>
          </div>
      </nav>
        <div id="conduct" class="list-content active m-3">
            <div class="container m-2 p-2">
                <h2>View Elections<small>(Click to Register)</small></h2>
                <hr>
                <div class="row m-3">
                    <%--<c:out value="${eligible.size()}"></c:out>--%>
                    <c:forEach var="el" items="${eligible}">
                        <c:if test="${el.pre}">
                        <div class="col-sm-12 col-md-6 col-lg-4 mb-3">
                            <div class="card h-100">
                            <div class="card-header bg-dark text-white">${el.electionname}</div>
                            <div class="card-body mt-0">
                                <p class="card-text font-weight-bold mb-0">${el.organization}</p>
                                <p class="card-text font-weight-bold ">${el.organizationURL}</p>
                                <p class="card-text">${el.description}</p>
                                <p class="card-text mb-0">Registration Ends :</p>
                                <p class="card-text">${el.startDate}&nbsp;${el.startTime}</p>
                                <a class="btn btn-info">View Details</a>
                                <c:set var="x" value="${el.electionname} ${el.hostname}"></c:set>
                                <c:choose>
                                    <c:when test="${!registered.contains(x)}">
                                        <a href="VoterRegister?ename=${el.electionname}&hname=${el.hostname}" class="btn btn-danger text-white" style="float:right">Register</a>
                                    </c:when>
                                    <c:otherwise>
                                        <h6 class="text-danger pt-2" style="float:right"><i class="fa fa-check"></i>&nbsp;Registered</h6>
                                    </c:otherwise>
                                </c:choose>
                                </div>
                            </div>
                        </div>
                        </c:if>
                    </c:forEach>
                </div>
        </div>
        </div>
        <div id="completed" class="list-content m-3">
            <h2>View Elections<small>(Successfully Voted)</small></h2>
            <p>Click on an Election card to view Result.If an Election card is not visible it might be because the administrator has not made the results public.</p>
            <hr>
            <div class="row m-3">
                    <%--<c:out value="${eligible.size()}"></c:out>--%>
                    <c:forEach var="el" items="${eligible}">
                        <c:if test="${el.conducted}">
                        <div class="col-sm-12 col-md-6 col-lg-4 mb-3">
                            <div class="card h-100">
                            <div class="card-header bg-dark text-white">${el.electionname}</div>
                            <div class="card-body mt-0">
                                <p class="card-text font-weight-bold mb-0">${el.organization}</p>
                                <p class="card-text font-weight-bold ">${el.organizationURL}</p>
                                <p class="card-text">${el.description}</p>
                                <a class="btn btn-info">View Details</a>
                                <c:set var="x" value="${el.electionname} ${el.hostname}"></c:set>
                                <c:choose>
                                    <c:when test="${!registered.contains(x)}">
                                        <a href="VoterRegister?ename=${el.electionname}&hname=${el.hostname}" class="btn btn-danger text-white" style="float:right">Register</a>
                                    </c:when>
                                    <c:otherwise>
                                        <h6 class="text-danger pt-2" style="float:right"><i class="fa fa-check"></i>&nbsp;Registered</h6>
                                    </c:otherwise>
                                </c:choose>
                                </div>
                            </div>
                        </div>
                        </c:if>
                    </c:forEach>
                </div>
        </div>
      
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/adminsupport.js"></script>
  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
   function preback(){window.history.forward();}
   setTimeout("preback()",0);
  </script>

</body>

</html>
