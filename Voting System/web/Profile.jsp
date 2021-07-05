<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>My Profile</title>
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
            .slanted{
                transform: rotate(-5deg)
                            skew(-5deg);
            }
        .emp-profile{
            padding: 3%;
            margin-top: 3%;
            margin-bottom: 3%;
            border-radius: 0.5rem;
            background: #fff;
        }
        .profile-img{
            text-align: center;
        }
        .profile-img img{
            width: 70%;
            height: 100%;
        }
        .profile-img .file {
            position: relative;
            overflow: hidden;
            margin-top: -20%;
            width: 70%;
            border: none;
            border-radius: 0;
            font-size: 15px;
            background: #212529b8;
        }
        .profile-img .file input {
            position: absolute;
            opacity: 0;
            right: 0;
            top: 0;
        }
        .profile-head h5{
            color: #333;
        }
        .profile-head h6{
            color: #0062cc;
        }
        .profile-edit-btn{
            border: none;
            border-radius: 1.5rem;
            width: 70%;
            padding: 2%;
            font-weight: 600;
            color: #6c757d;
            cursor: pointer;
        }
        .proile-rating{
            font-size: 12px;
            color: #818182;
            margin-top: 5%;
        }
        .proile-rating span{
            color: #495057;
            font-size: 15px;
            font-weight: 600;
        }
        .profile-head .nav-tabs .nav-link{
            font-weight:600;
            border: none;
        }
        .profile-head .nav-tabs .nav-link.active{
            border: none;
            border-bottom:2px solid #0062cc;
        }
        .profile-work{
            padding: 14%;
            margin-top: -15%;
        }
        .profile-work p{
            font-size: 12px;
            color: #818182;
            font-weight: 600;
        }
        .profile-work a{
            text-decoration: none;
            color: #495057;
            font-weight: 600;
            font-size: 14px;
        }
        .profile-work ul{
            list-style: none;
        }
        .profile-tab label{
            font-weight: 600;
        }
        .profile-tab p{
            font-weight: 600;
            color: #0062cc;
        }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row mt-2 mb-2">
                <div class="col-4 mr-auto slanted">
                    <img src="assets/img/logo.png" style="float:left" width="40" height="40">
                    <h3 class="text-secondary font-italic">Campaignn</h3>
                </div>
                <div class="col-7 mx-auto">
                    <h1>Profile Page</h1>
                    <a href="Home.jsp" style="float:right">Home</a>
                </div>
            </div>
            <hr>
            ${passchangeornot}
            <div class="my-2">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#edit" data-toggle="tab" class="nav-link">Edit</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#passchange" data-toggle="tab" class="nav-link">Change Password</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active emp-profile" id="profile">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="profile-img">
                                    <c:choose>
                                        <c:when test="${picexists==false}">
                                            <img src="assets/img/empty-profile.png" data-toggle="tooltip" title="No Profile Photo" alt="No Profile Photo"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="data:image/jpg;base64,${ud.profilepic}" data-toggle="tooltip" title="${Name}" alt="Profile Photo"/>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        <div class="col-md-6">
                            <div class="profile-head">
                                <h5>
                                    ${Name}
                                </h5>
                                <h6>
                                    <c:if test="${ud.profession!=null}">
                                        ${ud.profession}
                                    </c:if>
                                </h6>
                                <br>
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                    </li>
                                    <li>
                                        <a class="nav-link" id="elections-tab" data-toggle="tab" href="#elections" role="tab">Elections</a>
                                    </li>
                                    <li>
                                        <a class="nav-link" id="surveys-tab" data-toggle="tab" href="#surveys" role="tab">Surveys</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content profile-tab" id="myTabContent">
                                <div class="tab-pane fade show active mt-3" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="row mt-1">
                                        <div class="col-md-6">
                                            <label>Name</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>${Name}</p>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-6">
                                            <label>Email</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>${email}</p>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-6">
                                            <label>Gender</label>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${ud.gender!=null}">
                                                <p>${ud.gender}</p>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-6">
                                            <label>Date Of Birth</label>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${ud.dob!=null}">
                                                <p>${ud.dob}</p>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-6">
                                            <label>Phone</label>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${ud.phoneno!=null}">
                                                <p>${ud.phoneno}</p>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col-md-6">
                                            <label>Profession</label>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${ud.profession!=null}">
                                                <p>${ud.profession}</p>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade show mt-3" id="elections" role="tabpanel" aria-labelledby="elections-tab">
                                    <div class="mt-2">
                                        <h6>Conducted Elections</h6>
                                        <ul class="text-primary" style="list-style-type:square;">
                                            <c:forEach var="ci" items="${c}">
                                                <li>${ci.getKey()} at ${ci.getValue()}</li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="mt-2">
                                        <h6>Campaigned In</h6>
                                        <ul class="text-primary" style="list-style-type:square;">
                                            <c:forEach var="pi" items="${p}">
                                                <li>${pi.getKey()} at ${pi.getValue()}</li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="mt-2">
                                        <h6>Voted In</h6>
                                        <ul class ="text-primary" style="list-style-type:square;">
                                            <c:forEach var="vi" items="${v}">
                                                <li>${vi.getKey()} at ${vi.getValue()}</li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-pane fade show mt-3" id="surveys" role="tabpanel" aria-labelledby="surveys-tab">
                                    <div class="mt-2">
                                        <h6>Surveys Conducted</h6>
                                        <ul class ="text-primary" style="list-style-type:square;">
                                            <c:forEach var="sci" items="${sc}">
                                                <li>${sci}</li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="mt-2">
                                        <h6>Surveys Filled</h6>
                                        <ul class ="text-primary" style="list-style-type:square;">
                                            <c:forEach var="sfi" items="${sf}">
                                                <li>${sfi}</li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="tab-pane mt-4" id="edit">
                        <form role="form" action="UpdateProfile" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="hiddeninput" value="changes">
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Profile Photo</label>
                                <div class="col-lg-9">
                                    <input type="file" name="profilephoto" id="profiler" onchange="check()">
                                    <input type="hidden" name="photouploaded" id="photoexists" value="false">
                                    <p id="extension" class="text-danger"></p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">First name</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="text" value="${Name.split(' ')[0]}" disabled>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="text" value="${Name.split(' ')[1]}" disabled>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Email</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="email" value="${email}" disabled>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Gender</label>
                                <div class="col-lg-9">
                                    <c:choose>
                                        <c:when test="${ud.gender!=null}">
                                            <c:choose>
                                                <c:when test="${ud.gender.equals('Male')}">
                                                    <input checked="checked" class="radio-inline ml-3 mr-1" type="radio" name="gender" value="Male" disabled>Male
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="radio-inline ml-3 mr-1" type="radio" name="gender" value="Male" disabled>Male
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${ud.gender.equals('Female')}">
                                                    <input checked="checked" class="radio-inline ml-3 mr-1" type="radio" name="gender" value="Female" disabled>Female
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="radio-inline ml-3 mr-1" type="radio" name="gender" value="Female" disabled>Female
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${ud.gender.equals('Others')}">
                                                    <input checked="checked" class="radio-inline ml-3 mr-1" type="radio" name="gender" value="Others" disabled>Others
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="radio-inline ml-3 mr-1" type="radio" name="gender" value="Others" disabled>Others
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <input class="radio-inline ml-3 mr-1" type="radio" name="gender" value="Male">Male
                                            <input class="radio-inline ml-3 mr-1" type="radio" name="gender" value="Female">Female
                                            <input class="radio-inline ml-3 mr-1" type="radio" name="gender" value="Others">Others
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Date Of Birth</label>
                                <div class="col-lg-9">
                                <c:choose>
                                    <c:when test="${ud.dob!=null}">
                                        <input class="form-control" type="date" value="${ud.dob}" id="date" name="date" disabled>
                                    </c:when>
                                    <c:otherwise>
                                        <input class="form-control" type="date" id="date" name="date" onchange="check()">
                                    </c:otherwise>
                                </c:choose>
                                        <p id="dated" class="text-danger"></p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Phone Number</label>
                                <div class="col-lg-9">
                                    <c:choose>
                                        <c:when test="${ud.phoneno!=null}">
                                            <input class="form-control" id="phno" type="text" name="phno" value="${ud.phoneno}" onblur="check()">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" id="phno" type="text" name="phno" placeholder="xxxxx-xxxxx" onblur="check()">
                                        </c:otherwise>
                                    </c:choose>
                                    <p id="msgphno" class="text-danger"></p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Profession</label>
                                <div class="col-lg-9">
                                <c:choose>
                                    <c:when test="${ud.profession!=null}">
                                        <input class="form-control" type="text" name="profession" value="${ud.profession}">
                                    </c:when>
                                    <c:otherwise>
                                        <input class="form-control" type="text" name="profession">
                                    </c:otherwise>
                                </c:choose>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label"></label>
                                <div class="col-lg-9">
                                    <input onClick="window.location.reload();" class="btn btn-secondary" value="Cancel">
                                    <input type="submit" id="submitbtn1" class="btn btn-primary" value="Save Changes">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane mt-4" id="passchange">
                        <div class="mt-2">
                            <h3>Change Password</h3>                            
                        </div>
                        <form role="form" action="UpdateProfile" method="post">
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Enter Current Password</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="password" id="oldpassword" name="oldpassword">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Enter New Password</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="password" id="newpassword" onkeyup="matchpass()" name="newpassword">
                                    <p id="message" class="text-danger"></p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Confirm password</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="password" id="newpasswordagain" onkeyup="matchpass()" name="newpasswordagain">
                                    <p id="matchcheck" class="text-danger"></p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label"></label>
                                <div class="col-lg-9">
                                    <input type="submit" id="submitbtn" class="btn btn-primary" value="Change Password" disabled>
                                </div>
                            </div>
                        </form>
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
        <script>
            function matchpass(){
                var a=document.getElementById("newpassword").value;
                var b=document.getElementById("newpasswordagain").value;
                document.getElementById("message").innerHTML="";
                var x=false,y=false;
                if(a!="")
                {
                    if (a.length < 8) {
                        document.getElementById("message").innerHTML+="Your password must be at least 8 characters.\n\n";
                    }
                    else
                        document.getElementById("message").innerHTML+="";
                    if (a.search(/[A-Z]/) < 0) {
                        document.getElementById("message").innerHTML+="Your password must contain at least one uppercase letter.\n"; 
                    }
                    else
                        document.getElementById("message").innerHTML+="";
                    if (a.search(/[0-9]/) < 0) {
                        document.getElementById("message").innerHTML+="Your password must contain at least one digit.\n";
                    }
                    else
                        document.getElementById("message").innerHTML+="";
                    if(document.getElementById("message").innerHTML=="")
                        x=true;
                }
                if(b!="")
                {
                    if(a!=b)
                    {
                        document.getElementById("matchcheck").innerHTML="Passwords do not match";
                    }
                    else
                    {
                        document.getElementById("matchcheck").innerHTML="";
                        y=true;
                    }
                }
                if(x&&y)
                    submitbtn.disabled=false;
            }
            function check(){
                var phno=document.getElementById("phno").value;
                var date=document.getElementById("date").value;
                var photo=document.getElementById("profiler").value;
                document.getElementById("msgphno").innerHTML="";
                document.getElementById("dated").innerHTML="";
                document.getElementById("extension").innerHTML="";
                var regex=/^\d{5}-\d{5}$/;
                var x=true,y=true,z=true;
                if(phno!="")
                {
                    x=false;
                    if(!regex.test(phno))
                    {
                        document.getElementById("msgphno").innerHTML="Phone Number should be of 10 digits and of the format (xxxxx-xxxxx)";
                    }
                    else
                    {
                        document.getElementById("msgphno").innerHTML="";
                        x=true;
                    }
                }
                else
                    x=true;
                if(date!="")
                {
                    y=false;
                    var today = new Date();
                    var birthDate = new Date(date);
                    var age = today.getFullYear() - birthDate.getFullYear();
                    var m = today.getMonth() - birthDate.getMonth();
                    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                        age--;
                    }
                    if(age<18)
                        document.getElementById("dated").innerHTML="Age must be 18 years or older";
                    else
                        y=true;
                }
                else
                    y=true;
                if(photo!="")
                {
                    z=false;
                    var arr=photo.split(".");
                    if(arr[arr.length-1]!='png'&&arr[arr.length-1]!='PNG'&&arr[arr.length-1]!='jpg'&&arr[arr.length-1]!='JPG'&&arr[arr.length-1]!='jpeg'&&arr[arr.length-1]!='JPEG')
                    {
                        document.getElementById("extension").innerHTML="Image Type Not Valid";
                    }
                    else
                    {
                        document.getElementById("photoexists").value=true;
                        z=true;
                    }
                }
                else
                    z=true;
                if(!x||!y||!z)
                    submitbtn1.disabled=true;
                else
                    submitbtn1.disabled=false;
            }
        </script>
    </body>
</html>
