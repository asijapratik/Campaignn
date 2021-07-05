<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="Conducting.ElectionDetails"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Party</title>
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
    <%
            if(session.getAttribute("Name")==null)
            {
                response.sendRedirect("login.jsp?redo=PartyServlet");
            }
    %>

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-dark border-right text-white" id="sidebar-wrapper">
        <div class="sidebar-heading">
            <c:choose>
                <c:when test="${picexists==false}">
                    <img src="assets/img/empty-profile.png" data-toggle="tooltip" title="No Profile Photo" style="float:left" class="mt-2 rounded-circle" width="60" height="60">
                </c:when>
                <c:otherwise>
                    <img src="data:image/jpg;base64,${profilepic}" data-toggle="tooltip" title="${Name}" class="mt-2 rounded-circle" style="float:left" width="65" height="65">
                </c:otherwise>
            </c:choose>
            <h2>${Name}</h2>
        </div>
        <br>
      <div class="list-group list-group-flush">
          <a style="font-size:12px; color:rgb(255,255,240);" href="Electionlist"><i class="fa fa-chevron-left"></i>&nbsp;Back to Elections page</a>
          <a href="Home.jsp" class="list-group-item list-group-item-action bg-dark text-white" ><i class="bx bx-home">&nbsp;</i>Home</a>
        <a target="blank" href="LoadProfile" class="list-group-item list-group-item-action bg-dark text-white"><i class='bx bxs-user-account'>&nbsp;</i>My Profile</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white active" onclick="openTab(event,'conduct')"><i class="fa fa-handshake-o" aria-hidden="true">&nbsp;</i>Participate in Election</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white" onclick="openTab(event, 'completed')"><i class="fa fa-bullhorn" aria-hidden="true">&nbsp;</i>Successfully Campaigned</a>
        <a href="/Voting%20System/LogoutServlet?redo=Electionlist" class="list-group-item list-group-item-action bg-dark text-white"><i class='bx bx-log-out' >&nbsp;</i>Logout</a>
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
        <!-- 1st Tab Starts-->
        <div id="conduct" class="list-content active">
            <div class="container m-2 p-2">
            <h3>Campaign for Elections</h3>
            <hr>
            ${errormessage}
                <div class="row m-3">
                    <%--<c:out value="${eligible.size()}"></c:out>--%>
                    <c:set var="modcount" value="0"></c:set>
                    <c:forEach var="el" items="${eligible}">
                        <c:set var="x" value="${el.electionname} ${el.hostname}"></c:set>
                        <c:if test="${(el.pre||el.live)&&Name!=el.hostname}">
                        <div class="col-sm-12 col-md-6 col-lg-4 mb-3">
                            <div class="card h-100">
                            <div class="card-header bg-dark text-white">${el.electionname}</div>
                            <div class="card-body mt-0">
                                <p class="card-text font-weight-bold mb-0">${el.organization}</p>
                                <p class="card-text font-weight-bold ">${el.organizationURL}</p>
                                <p class="card-text">${el.description}</p>
                                <c:choose>
                                    <%--Not Registered Yet and not started yet--%>
                                    <c:when test="${!registeredparty.contains(x)&&el.pre}">
                                        <p class="card-text mb-0">Registration Ends :</p>
                                        <p class="card-text">${el.startDate}&nbsp;${el.startTime}</p>
                                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal_${modcount}" style="float:right">Register Party</button>
                                        <%--<c:out value="myModal_${modcount}"></c:out>--%>
                                        <div class="modal fade" id="myModal_${modcount}">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-body">
                                                        <div class="container">
                                                        <div class="p-3 mt-2 mb-2 text-white" style="background-color:black;"> 
                                                            <h4>Complete Registration</h4>
                                                        </div>
                                                        <form action="PartyRegister?ename=${el.electionname}&hname=${el.hostname}" method="post" enctype="multipart/form-data">
                                                            <div class="ml-auto mr-auto mb-1">
                                                                <p class="mb-0"><strong>Party Name</strong></p>
                                                                <input type="text" name="${x}pname" size="30" required/> 
                                                            </div>
                                                            <div class="mr-auto ml-auto mb-1">
                                                                <p class="mb-0"><strong>Party Logo</strong></p>
                                                                <input type="file" name="${x}plogo" size="30" required/> 
                                                            </div>
                                                            <p class="mt-2 mb-0"><strong>Name the candidates for:</strong></p>
                                                            <c:set var="count" value="0"></c:set>
                                                            <c:forTokens items="${el.positions}" delims="," var="p">
                                                                <div class="ml-auto mb-auto mb-1">
                                                                    <div class="text-secondary"><strong><c:out value="${p}"></c:out></strong>&nbsp;</div>
                                                                    <input type="text" name="${x}pos_${count}" required>
                                                                </div>
                                                                <c:set var="count" value="${count+1}"></c:set>
                                                            </c:forTokens>
                                                            <div class="mr-auto ml-auto mb-1 mt-2">
                                                                <p class="mb-0"><strong>Address to voters:</strong><small>(Optional)</small></p>
                                                                <textarea rows="4" cols="40" placeholder="Motto,Party Goals  etc." name="${x}address"></textarea>
                                                            </div>
                                                            <div class="text-center mt-1"><input type="submit" value="Submit" name="submit"></div>
                                                        </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <c:set var="modcount" value="${modcount+1}"></c:set>
                                    </c:when>
                                    <%--Not Registered Yet and started--%>
                                    <c:when test="${el.live&&!registeredparty.contains(x)}">
                                        <h6>Registration Ended ON:</h6>
                                        <h6>${el.startDate}&nbsp;${el.startTime}</h6>
                                    </c:when>
                                    <%--Registered but not verified and not started--%>
                                    <c:when test="${registeredparty.contains(x)&&!verifiedparty.contains(x)&&el.pre}">
                                        <h6> You are Registered.</h6>
                                        <p class="text-danger"><i class="fa fa-spinner"></i>&nbsp;Verification Pending</p>
                                    </c:when>
                                    <%--Registered but not verified and started--%>
                                    <c:when test="${registeredparty.contains(x)&&!verifiedparty.contains(x)&&el.live}">
                                        <h6>Sorry you could not be verified.</h6>
                                    </c:when>
                                    <%--Verified--%>
                                    <c:otherwise>
                                        <h4 class="text-info"><i class="fa fa-check"></i>&nbsp;Verified</h4>
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
        <!-- 1st Tab Ends-->
        <!-- 2nd Tab Starts-->
        <div id="completed" class="list-content">
            <div class="container m-2 p-2">
            <h3>Successfully Campaigned</h3>
            <hr>
            <div class="row m-3">
                <%--<c:out value="${eligible.size()}"></c:out>--%>
                <c:forEach var="el" items="${eligible}">
                    <c:set var="x" value="${el.electionname} ${el.hostname}"></c:set>
                    <c:if test="${el.conducted&&Name!=el.hostname&&verifiedparty.contains(x)}">
                    <div class="col-sm-12 col-md-6 col-lg-4 mb-3">
                        <div class="card h-100">
                            <div class="card-header bg-dark text-white">${el.electionname}</div>
                            <div class="card-body mt-0">
                                <p class="card-text font-weight-bold mb-0">${el.organization}</p>
                                <p class="card-text font-weight-bold ">${el.organizationURL}</p>
                                <p class="card-text">${el.description}</p>
                                <c:choose>
                                    <c:when test="${el.result.equals('Public')}">
                                        <a href="resulteval?Electionname=${el.electionname}&hostname=${el.hostname}" class="btn btn-info">View Results</a>
                                    </c:when>
                                    <c:otherwise>
                                        <p><strong>Results have not been made public by your election administrator.</strong></p>
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
        <!-- 2nd Tab Ends-->
        <!--Modal Box Starts-->
        <!--Modal Box Ends-->
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
