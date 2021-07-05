<%@page import="java.util.ArrayList"%>
<%@page import="Conducting.ElectionDetails"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Build Election</title>
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
  <style>
      @media(min-width:700px){
        .name-header{
            width:50%;
        }
      }
      .has-search .form-control {
        padding-left: 2.375rem;
    }

      .has-search .form-control-feedback {
        position: absolute;
        z-index: 2;
        display: block;
        width: 2.375rem;
        height: 2.375rem;
        line-height: 2.375rem;
        text-align: center;
        pointer-events: none;
        color: #aaa;
      }
      .disabled{
          pointer-events: none;
      }
  </style>
</head>
<body onload="openTabe(event,'${param.redo}')" >
    <%
            if(session.getAttribute("Name")==null)
            {
                response.sendRedirect("login.jsp?redo=LoadElection");
            }
    %>
<jsp:useBean id="date" class="java.util.Date" />
<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm:ss" var="currdate" />
<c:set var="startdate" value="${ed.startDate} ${ed.startTime}"/>
  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-dark border-right text-white" id="sidebar-wrapper">
        <div class="sidebar-heading" style="background-color:#ffffe0">
            <img src="assets/img/logo.png" alt="logo" style="float:left;" width="30" height="30">
            <h2 style="font-size:25px; color:black;">Campaignn</h2>
        </div>
      <div class="list-group list-group-flush">
          <a style="font-size:12px; color:rgb(255,255,240);" href="AdminServlet"><i class="fa fa-chevron-left"></i>&nbsp;Back to Admin Page</a>
          <a href="Home.jsp" class="list-group-item list-group-item-action bg-dark text-white" ><i class="bx bx-home">&nbsp;</i>Home</a>
        <a target="blank" href="LoadProfile" class="list-group-item list-group-item-action bg-dark text-white"><i class='bx bxs-user-account'>&nbsp;</i>My Profile</a>
        <c:choose>
            <c:when test="${param.redo.equals('overview')}">
                <a href="#" class="list-group-item list-group-item-action bg-dark text-white active" onclick="openTab(event,'overview')"><i class="fa fa-window-maximize">&nbsp;</i>Overview</a>
            </c:when>
            <c:otherwise>
                <a href="#" class="list-group-item list-group-item-action bg-dark text-white" onclick="openTab(event,'overview')"><i class="fa fa-window-maximize">&nbsp;</i>Overview</a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${param.redo.equals('voters')}">
                <a href="#" class="list-group-item list-group-item-action bg-dark text-white active" onclick="openTab(event, 'voters')"><i class='fa fa-users'>&nbsp;</i>Voters</a>
            </c:when>
            <c:otherwise>
                <a href="#" class="list-group-item list-group-item-action bg-dark text-white" onclick="openTab(event, 'voters')"><i class='fa fa-users'>&nbsp;</i>Voters</a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${param.redo.equals('candidates')}">
                <a href="#" class="list-group-item list-group-item-action bg-dark text-white active" onclick="openTab(event, 'candidates')"><i class="fa fa-address-card">&nbsp;</i>Candidates</a>
            </c:when>
            <c:otherwise>
                <a href="#" class="list-group-item list-group-item-action bg-dark text-white" onclick="openTab(event, 'candidates')"><i class="fa fa-address-card">&nbsp;</i>Candidates</a>
            </c:otherwise>
        </c:choose>       
                <a href="/Voting%20System/LogoutServlet?redo=Electionlist" class="list-group-item list-group-item-action bg-dark text-white"><i class='bx bx-log-out' >&nbsp;</i>Logout</a>
      </div>
    </div>
    <!-- /#sidebar-wrapper -->
    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-white" id="menu-toggle">
            <span class="navbar-toggler-icon navbar-dark"></span>
        </button>
          <div class="logo mr-auto ml-auto" style="float:left">
              <h2 style="font-family:'Poppins',sans-serif;">${param.Electionname}</h2>
          </div>
      </nav>
        <!--Overview Page Ends-->
        <div id="overview" class="list-content active m-3">
            <div class="container">
                <div class="card mb-3 mt-5 name-header">
                    <div class="card-heading bg-light">
                        <h5><i class="fa fa-building"></i>&nbsp;Organization Name</h5>
                    </div>             
                    <div class="card-body pt-1 pb-1">
                        <h4 class="text-secondary">${ed.organization}</h4>
                    </div>
                </div>
                <div class="card mb-5 w-100">
                    <div class="card-heading bg-light">
                        <h5><i class="fa fa-link"></i>&nbsp;Organization URL</h5>
                    </div>             
                    <div class="card-body pt-1 pb-1">
                        <h4 class="text-secondary">${ed.organizationURL}</h4>
                    </div>
                </div>
                <div class="card-deck mt-5 w-75">
                    <div class="card bg-light">
                        <div class="card-header bg-primary text-white">
                            <h5><i class="fa fa-calendar"></i>&nbsp;Start Date</h5>
                        </div>
                        <div class="card-body pt-1 pb-1">
                            <h4 class="text-secondary">${ed.startDate} ${ed.startTime}</h4>
                        </div>
                    </div>
                    <div class="card bg-light">
                        <div class="card-header bg-primary text-white">
                            <h5><i class="fa fa-calendar"></i>&nbsp;End Date</h5>
                        </div>
                        <div class="card-body pt-1 pb-1">
                            <h4 class="text-secondary">${ed.endDate} ${ed.endTime}</h4>
                        </div>
                    </div>
                </div>
                <div class="card-deck mt-3">
                    <div class="card bg-warning">
                        <div class="card-body">
                            <i class="fa fa-users fa-3x"></i>
                            <h2 style="float:right">${voters.size()}</h2>
                            <p style="text-align:right">Voters Registered</p>
                        </div>
                    </div>
                    <div class="card bg-info">
                        <div class="card-body">
                            <i class="fa fa-address-card fa-3x"></i>
                            <h2 style="float:right">${parties.size()}</h2>
                            <p style="text-align:right">Parties Registered</p>
                        </div>
                    </div>
                </div>
                <div class="alert alert-info mt-2">
                    <strong>Note-</strong> To view Result after Election go to the successfully conducted tab on Admin Page.
                </div>
            </div>
        </div>
        <!--Overview Ends-->
        <!--Voters Page Begins-->
        <div id="voters" class="list-content m-3">
            <div class="container">
                <h2>View Voters</h2>
                <hr>
                ${message}
                <c:choose>
                <c:when test="${voters.size()==0}">
                    <p>No Voters Registered Yet.</p>
                    <div class="row">
                        <c:choose>
                            <c:when test="${startdate.compareTo(currdate)>0}">
                                <div class="col-md-4 btn btn-dark mt-5 text-center ml-auto mb-2 mr-1" data-target="#modal1" data-toggle="modal" style="float:left">
                                    <h5 class=" text-center p-2 text-white"><i class="fas fa-plus"></i>&nbsp;Add Voters</h5>
                                    <h5><small>(Using Excel Spreadsheet)</small></h5>
                                    <h5 class="text-light"><small>Recommended</small></h5>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-md-4 btn btn-dark mt-5 text-center ml-auto mb-2 mr-1 disabled" data-target="#modal1" data-toggle="modal" style="float:left">
                                    <h5 class=" text-center p-2 text-white"><i class="fas fa-plus"></i>&nbsp;Add Voters</h5>
                                    <h5><small>(Using Excel Spreadsheet)</small></h5>
                                    <h5 class="text-light"><small>Recommended</small></h5>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <!--1st Modal Begins-->
                        <div class="modal fade" id="modal1">
                            <div class="modal-dialog modal-dialog-centered">
                              <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                  <h4 class="modal-title">Upload Excel File</h4>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <p>1.) Uploaded File should be only in .xlsx format. Any other format would not be supported.</p>
                                    <p>2.) Although you can add voters to the list later manually if need be.</p>
                                    <p>3.) Excel File should contain only one sheet with two columns Name and Email.</p>
                                    <p>4.) All Email addresses should be valid. Voters will receive their VoterId and VoterPass on the provided email addresses only.</p>
                                    <p>5.) Click to download <a href="Uploads/Sample.xlsx" download="sample.xlsx">Sample</a> spreadsheet.</p>
                                    <h5 class="text-secondary"><strong>Upload Excel File</strong></h5>
                                    <form action="VoterRegister" method="post" enctype="multipart/form-data">
                                        <input type="file" name="file" id="excel" onchange="check()" required>
                                        <input type="submit" class="btn btn-outline-dark text-center" id="submitbtn" value="Submit">
                                        <span id="error"></span>
                                    </form>
                                </div>
                              </div>
                            </div>
                          </div>
                        <!--1st Modal Ends-->
                        <c:choose>
                            <c:when test="${startdate.compareTo(currdate)>0}">
                                <div class="col-md-4 btn btn-light mt-5 text-center mr-auto mb-2" data-target="#modal2" data-toggle="modal">
                                    <h5 class="text-center p-2"><i class="fas fa-plus"></i>&nbsp;Add Voters</h5>
                                    <h5><small>(Manually)</small></h5>
                                    <h5><small>(One-By-One)</small></h5>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-md-4 btn btn-light mt-5 text-center mr-auto mb-2 disabled" data-target="#modal2" data-toggle="modal">
                                    <h5 class="text-center p-2"><i class="fas fa-plus"></i>&nbsp;Add Voters</h5>
                                    <h5><small>(Manually)</small></h5>
                                    <h5><small>(One-By-One)</small></h5>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <!--2nd Modal Begins-->
                        <div class="modal fade" id="modal2">
                            <div class="modal-dialog modal-dialog-centered">
                              <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                  <h4 class="modal-title">Enter Name & Email</h4>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <p> 1. If you add voters manually you won't be able to add an excel file later. </p>
                                    <p> 2. You can start by adding Name and Email Id of voters.</p>
                                    <h5 class="text-secondary"><strong>Enter Name and Email</strong></h5>
                                    <form action="VoterRegister" method="get" enctype="multipart/form-data">
                                        <input type="text" name="Name" placeholder="Full Name" required>
                                        <input type="email" name="EmailId" placeholder="Email Id" required>
                                        <input type="hidden" name="hiddeninput" value="manual" >
                                        <input type="submit" class="btn btn-outline-dark mt-2" style="float:right" name="submit" value="Add Voter">
                                    </form>                                
                                </div>
                              </div>
                            </div>
                          </div>
                        <!--2nd Modal Ends-->
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row">
                        <div class="col-md-6 mr-auto">
                            <div class="form-group has-search">
                                <span class="fa fa-search form-control-feedback"></span>
                                <input type="text" id="myInput" onkeyup="search()" class="mt-2 mb-2 rounded form-control" placeholder="Search using name or voterId">
                            </div>
                        </div>
                        <div class="col-md-4 ml-auto mt-2 mb-2">
                            <c:choose>
                                <c:when test="${startdate.compareTo(currdate)>0}">
                                    <div class="btn btn-dark text-white rounded" data-toggle="modal" data-target="#modaladd"><h6 style="float:right"><i class="fa fa-plus"></i>&nbsp;Add Voter</h6></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="btn btn-dark text-white rounded disabled" data-toggle="modal" data-target="#modaladd"><h6 style="float:right"><i class="fa fa-plus"></i>&nbsp;Add Voter</h6></div>
                                </c:otherwise>
                            </c:choose>
                            <div class="modal fade" id="modaladd">
                               <div class="modal-dialog modal-dialog-centered">
                                 <div class="modal-content">

                                   <!-- Modal Header -->
                                   <div class="modal-header">
                                     <h4 class="modal-title">Enter Name & Email</h4>
                                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                                   </div>

                                   <!-- Modal body -->
                                   <div class="modal-body">
                                       <h5 class="text-secondary"><strong>Enter Name and Email</strong></h5>
                                       <form action="VoterRegister" method="get" enctype="multipart/form-data">
                                           <input type="text" name="Name" placeholder="Full Name" required>
                                           <input type="email" name="EmailId" placeholder="Email Id" required>
                                           <input type="hidden" name="hiddeninput" value="manual" >
                                           <input type="submit" class="btn btn-outline-dark mt-2" style="float:right" name="submit" value="Add Voter">
                                       </form>                                
                                   </div>
                                 </div>
                               </div>
                           </div>
                            <c:choose>
                                <c:when test="${startdate.compareTo(currdate)>0}">
                                    <div class="btn btn-danger rounded" data-toggle="modal" data-target="#modaldelete"><h6 style="float:right">Delete All Voters</h6></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="btn btn-danger rounded disabled" data-toggle="modal" data-target="#modaldelete"><h6 style="float:right">Delete All Voters</h6></div>
                                </c:otherwise>
                            </c:choose>
                            <div class="modal fade" id="modaldelete">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">

                                <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">Confirm Deletion</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                <!-- Modal body -->
                                    <div class="modal-body">
                                        <p> Are You sure you want to delete all the voters?</p>
                                        <a href="deletevoters"><button class="btn btn-outline-dark" style="float:right">Confirm</button></a>
                                    </div>
                                    </div>
                                </div>
                            </div>
                         </div>
                    </div>
                    <div class="table-responsive-md mt-2" id="myTable">
                        <table class="table table-bordered table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Name</th>
                                    <th>VoterId</th>
                                    <th>Email Id</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="vd" items="${voters}">
                                    <tr>
                                        <td>${vd.name}</td>
                                        <td>${vd.voterId}</td>
                                        <td>${vd.email}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
        <!--Voters Page Ends-->
        <!--Candidates Page Begins-->
        <div id="candidates" class="list-content m-3">
            <h2 class="mt-3 ml-3">View Parties Registered</h2>
            <hr>
            <div class="table-responsive-md">
                <table class="table table-bordered table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>Party Logo</th>
                            <th>Party Name</th>
                            <th>Party Leader</th>
                            <th>Candidates</th>
                            <th>Verification</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${parties}">
                            <tr>
                                <td><img src="data:image/jpg;base64,${p.partylogo}" height="70" width="70"></td>
                                <td>${p.partyname}</td>
                                <td>${p.partyowner}</td>
                                <td>
                                    <c:forTokens var="z" items="${p.candidates}" delims=",">
                                        <p><c:out value="${z}"></c:out></p>
                                    </c:forTokens>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${!p.verified&&startdate.compareTo(currdate)>0}">
                                            <a class="btn btn-secondary" href="verifyparty?pname=${p.partyname}">Verify</a>
                                        </c:when>
                                        <c:when test="${!p.verified&&startdate.compareTo(currdate)<0}">
                                            <a class="btn btn-secondary disabled" href="verifyparty?pname=${p.partyname}">Verify</a>
                                        </c:when>
                                        <c:otherwise>
                                            <p><i class="fa fa-check"></i>&nbsp;Verified</p>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!--Candidates Page Ends-->
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
    function check()
    {
        var excel=document.getElementById("excel").value;
        var arr=excel.split(".");
        if(arr[arr.length-1]!='xlsx')
        {
            document.getElementById("submitbtn").disabled=true;
            document.getElementById("error").innerHTML="<p class='p-2 bg-warning' style='width:fit-content'>Please upload a .xlsx file.</p>";
        }
        else
        {
            document.getElementById("submitbtn").disabled=false;
            document.getElementById("error").innerHTML="";
        }
    }
    function search()
    {
        var input, filter, table, tr, td, i, txtValue,found;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
          td = tr[i].getElementsByTagName("td");
          found=false;
          for(var q=0;q<2;q++)
          {
            if (td[q]) {
                txtValue = td[q].textContent || td[q].innerText; 
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    found=true;
                }
            }
          }
        if (found) {
            tr[i].style.display = "";
         } else {
           tr[i].style.display = "none";
         }
       }
    }
  </script>

</body>

</html>
