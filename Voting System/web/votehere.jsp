<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Vote Here</title>
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
        <style>
            [name="voted"]{
                position:fixed;
                opacity:0;
            }
        </style>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            if(session.getAttribute("extra")==null)
            {
                response.sendRedirect("Electionlist");
            }
        %>
        <div class="container-fluid">
            <div class="container-fluid bg-dark mb-2" style="background:url('assets/img/white-bg.jpeg')">
                <h2 class="pt-2 font-weight-bold text-center pb-2">${param.Electionname} at ${param.organization}</h2>
            </div>
            <div class="alert alert-info alert-dismissible">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <p>Your vote is anonymous. No one will know who you voted. If you don't click to vote any party it will be considered NOTA.</p>
            </div>
            <div class="mt-1 mb-5">
                <form id="votingform" action="VoteRecord" method="get" enctype="multipart/form-data">
                    <input type="hidden" value="NOTA" id="hiddeninput" name="hidden">
                    <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Party Logo</th>
                                <th>Party Name</th>
                                <th>Candidates</th>
                                <th>Address</th>
                                <th>Vote</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="count" value="1"/>
                            <c:forEach var="p" items="${parties}">
                            <tr>
                                <td><img src="data:image/jpg;base64,${p.partylogo}" height="70" width="70"></td>
                                <td>${p.partyname}</td>
                                <td>
                                    <c:forTokens var="z" items="${p.candidates}" delims=",">
                                        <p><c:out value="${z}"></c:out></p>
                                    </c:forTokens>
                                </td>
                                <td>${p.address}</td>
                                <td>
                                    <button type="button" id="button${count}" class="btn" onclick="return selected(this);" value="${p.partyname}" style="background-color:#00ced1;">Select</button>
                                    <c:set var="count" value="${count+1}"/>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    </div>
                    <center>
                        <input type="button" name="submit" id="submitBtn" value="Submit" class="btn btn-primary mt-5" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">
                            <div class="modal fade" id="myModal">
                                <div class="modal-dialog modal-dialog-centered">
                                  <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                      <h4 class="modal-title">Confirmation</h4>
                                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        You are voting for <span id="votefor"></span>.<br>
                                        Are You sure you want to proceed?
                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                      <input type="submit" name="submit" id="submit" class="btn btn-outline-dark" value="Confirm">
                                    </div>

                                  </div>
                                </div>
                            </div>
                    </center>
                </form>
            </div>
        </div>
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
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
            function selected(el)
            {
                var z=document.getElementById("hiddeninput");
                var selected = el.id;
                if(el.innerHTML === "Select")
                {
                    el.innerHTML = "Selected";
                    el.style.backgroundColor="#32CD32";
                    document.getElementById(selected).disabled=true;
                }
                var q=1;
                while(true)
                {
                    var a=document.getElementById("button"+q);
                    var b="button"+q;
                    if(a==null)
                        break;
                    if(b!=selected)
                    {
                        a.innerHTML="Select";
                        a.style.backgroundColor="#00CED1";
                        document.getElementById(b).disabled=false;
                    }
                    q+=1;
                }
                z.value=document.getElementById(selected).value;
            }
            $('#submitBtn').click(function() {
                $('#votefor').text($('#hiddeninput').val());
            });
        </script>
    </body>
</html>
