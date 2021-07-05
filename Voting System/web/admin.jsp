<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="Conducting.ElectionDetails"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Admin</title>
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
        <script src="assets/js/adminsupport.js"></script>
  <!-- Bootstrap core CSS -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="assets/css/simple-sidebar.css" rel="stylesheet">

</head>

<body onload="openTabe(event,'conduct')" >
    <%
            if(session.getAttribute("Name")==null)
            {
                response.sendRedirect("login.jsp?redo=AdminServlet");
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
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white active" onclick="openTab(event,'conduct')"><i class='bx bx-box'>&nbsp;</i>Conduct Elections</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white" onclick="openTab(event, 'completed')"><i class='bx bx-checkbox-checked' >&nbsp;</i>Successfully Conducted</a>
        <a href="#" class="list-group-item list-group-item-action bg-dark text-white" onclick="openTab(event, 'ongoing')"><i class='bx bx-time'>&nbsp;</i>Ongoing Elections</a>
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
        <div id="conduct" class="list-content active m-5 bg-light">
            ${Added}
            <div class="mt-2 mb-2 p-3 text-white" style="background-color:black;"> 
                <h2><strong>Conduct Elections</strong></h2>
            </div>
            <form action="ConductServlet" method="post">
                <div class="row  ml-2 mt-3 mb-1">
                    <div class="col-md-5 ml-auto mr-auto mb-1">
                        <p class="mb-0"><strong>Organization</strong></p>
                        <input type="text" name="org" size="30" required/> 
                    </div>
                    <div class="col-md-5 mr-auto ml-auto mb-1">
                        <p class="mb-0"><strong>Organization URL</strong></p>
                        <input type="text" name="orgurl" size="30" required/> 
                    </div>
                </div>
                <div class="row  ml-2 mt-3 mb-1">
                    <div class="col-sm-11 mr-auto ml-auto mb-1">
                        <p class="mb-0"><strong>Name of Election</strong></p>
                        <input type="text" name="election_name" size="30" required/> 
                    </div>
                </div>
                <div class="row ml-2 mt-3 mb-1">
                    <div class="col-sm-5 ml-auto mr-auto mb-1">
                        <p class="mb-0"><strong>Start Date</strong></p>
                        <input type="date" id="sdate" name="start_date" onblur="check()" required/>
                    </div>
                    <div class="col-sm-5 ml-auto mr-auto mb-1">
                        <p class="mb-0"><strong>Start Time</strong></p>
                        <input type="time" id="stime" name="start_time" onblur="check()" required/>
                        <br><span id="message1" class="text-danger"></span>
                    </div>
                </div>
                <div class="row ml-2 mt-3 mb-1">
                    <div class="col-sm-5 ml-auto mr-auto mb-1">
                        <p class="mb-0"><strong>End Date</strong></p>
                        <input type="date" id="edate" name="end_date" onblur="check()" required/>
                    </div>
                    <div class="col-sm-5 ml-auto mr-auto mb-1">
                        <p class="mb-0"><strong>End Time</strong></p>
                        <input type="time" id="etime" name="end_time" onblur="check()" required/>
                        <br><span id="message2" class="text-danger"></span>
                    </div>
                </div>
                <div class="row ml-2 mt-3 mb-1">
                    <div class="col-sm-11 ml-auto mr-auto mb-1">
                        <p class="mb-0"><strong>No of Positions open for election</strong></p>
                        <input type="number" name="positions" id="positions" value="0" min="1" required/>
                    </div>
                </div>
                <div class="ml-2" id="newRow"></div>
                <div class="row  ml-2 mt-3 mb-1">
                    <div class="col-sm-11 mr-auto ml-auto mb-1">
                        <p class="mb-0"><strong>Election Description<small>(Optional)</small></strong></p>
                        <textarea rows="4" cols="40" name="description"></textarea> 
                    </div>
                </div>
                <div class="row ml-2 mt-3 mb-1">
                    <div class="col-sm-11 mr-auto ml-auto mb-1">
                        <p class="mb-0 "><strong>Election Results</strong></p>
                        <select id="result" name="result">
                            <option value="Public">Open to All Parties</option>
                            <option value="Private1">Only Me</option>
                        </select> 
                    </div>
                </div>
                <div class="row ml-2 mt-3 mb-5">
                    <div class="mr-auto ml-auto col-sm-4 mb-1">
                        <input type="submit" name="submit" value="Submit" id="submit" class="bg-primary text-dark font-weight-bold"/> 
                    </div>
                </div>
            </form>
        </div>
        <div id="completed" class="list-content">
            <div class="container m-2 p-2">
                <h2>Successfully Conducted Elections</h2>
                <hr>
                <div class="row m-3">
                    <c:forEach var="el" items="${conducting}">
                    <c:if test="${el.hostname==Name}">
                        <c:if test="${el.conducted}">
                        <div class="col-sm-12 col-md-6 col-lg-4 mb-3">
                            <div class="card h-100">
                            <div class="card-header bg-dark text-white">${el.electionname}</div>
                            <div class="card-body mt-0">
                                <p class="card-text font-weight-bold mb-0">${el.organization}</p>
                                <p class="card-text font-weight-bold ">${el.organizationURL}</p>
                                <p class="card-text">${el.description}</p>
                                <a href="resulteval?Electionname=${el.electionname}&hostname=${Name}" class="btn btn-success stretched-link">View Results</a>
                            </div>
                            </div>
                        </div>
                        </c:if>
                    </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div id="ongoing" class="list-content">
            <div class="container m-2 p-2">
                <h2>Ongoing Elections</h2>
                <hr>
                <div class="row m-3">
                    <c:forEach var="el" items="${conducting}">
                    <c:if test="${el.hostname==Name}">
                        <c:if test="${!el.conducted}">
                        <div class="col-sm-12 col-md-6 col-lg-4 mb-3">
                            <div class="card h-100">
                            <div class="card-header bg-dark text-white">${el.electionname}</div>
                            <div class="card-body mt-0">
                                <p class="card-text font-weight-bold mb-0">${el.organization}</p>
                                <p class="card-text font-weight-bold ">${el.organizationURL}</p>
                                <p class="card-text">${el.description}</p>
                                <a href="LoadElection?Electionname=${el.electionname}&redo=overview" class="btn btn-info stretched-link">View Details</a>
                            </div>
                            </div>
                        </div>
                        </c:if>
                    </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Menu Toggle Script -->
  <script>
      sdate.min = new Date().toISOString().split("T")[0];
      edate.min = new Date().toISOString().split("T")[0];
      function check()
      {
            document.getElementById("message1").innerHTML="";
            document.getElementById("message2").innerHTML="";
            var sdate=document.getElementById("sdate").value;
            var edate=document.getElementById("edate").value;
            var stime=document.getElementById("stime").value+":00";
            var etime=document.getElementById("etime").value+":00";
            var s=false,e=false;
            if(stime!=""&&sdate!="")
            {
                var today = new Date();
                var dd = String(today.getDate()).padStart(2, '0');
                var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                var yyyy = today.getFullYear();
                var currdate=yyyy+"-"+mm+"-"+dd;
    //            alert(currdate+" "+date1);
                var hours=String(today.getHours()).padStart(2,'0');
                var minutes=String(today.getMinutes()).padStart(2,'0');
                var seconds=String(today.getSeconds()).padStart(2,'0');
                var currtime = hours+":"+minutes+":"+seconds;
                if(sdate<=currdate&&stime<currtime)
                    document.getElementById("message1").innerHTML="Start Date & Time cannot be less than current time";
                else
                    s=true;
            }
            if(etime!=""&&edate!="")
            {
                if(edate<sdate)
                    document.getElementById("message2").innerHTML="End Date should be after start date";
                else if(edate==sdate&&etime<stime)
                    document.getElementById("message2").innerHTML="End Date & Time cannot be less than Start Date & Time";
                else
                    e=true;
            }
            if(s==true&&e==true)
                submit.disabled=false;
            else
                submit.disabled=true;
      }
    $(document).ready(function(){
        $('#positions').change(function(){
            var x=$("#positions").val();
            $('#newRow').empty();
            var res='';
            res+='<div class="row ml-2 mt-3 mb-1">';
            for(var z=1;z<=x;z++){  
                res+='<div class="col-md-4 mb-1">'
                res+='<p class="mb-0"><strong>Position '+z+'</strong></p>';
                res+='<input type="text" name="Position_'+z+'" required/>';
                res+='</div>';
            }
            res+='</div>';
            $('#newRow').append(res);
        });
        $(window).keydown(function(event){
            if(event.keyCode == 13) {
            event.preventDefault();
            return false;
        }
        });
    });
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

</body>

</html>
