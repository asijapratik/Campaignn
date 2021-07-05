<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Reset Password</title>
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
         <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <script src="assets/js/adminsupport.js"></script>
        <!-- Bootstrap core CSS -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/loginstyle.css" rel="stylesheet">
    </head>
    <body>
        <%
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        %>
        <div class="container">
        <div class="row">
            <div class="col-md-5 mx-auto">
            <div class="mb-5 mt-1 text-white ml-5"> 
                <img src="assets/img/logo.png" alt="Campaignn" style="float:left" width="50" height="50">
                <h1 style="font-family:'Poppins',sans-serif;">Campaignn</h1>
            </div>
            <div id="first">
                <div class="myform form ">
                    <div class="logo mb-3">
                        <div class="col-md-12 text-center">
                            <h1>Reset Password</h1>
                        </div>
                    </div>
                <form action="passwordreset?redo=${param.redo}" method="post">
                    <input type="hidden" name="email" value="${email}">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Enter New Password</label>
                        <input type="password" name="newpassword"  class="form-control" id="newpassword" onkeyup="checkpasswordmatch()" placeholder="Enter New Password" required>
                        <p class="text-danger" id="message"></p>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Enter New Password Again</label>
                        <input type="password" name="newpasswordagain" id="newpasswordagain"  onkeyup="checkpasswordmatch()" class="form-control" placeholder="Enter New Password Again" required>
                        <p class="text-danger" id="matchcheck"></p>
                    </div>
                    <div class="col-md-12 text-center">
                       <button type="submit" id="submitbtn" class=" btn btn-block mybtn btn-primary tx-tfm" disabled>Reset Password</button>
                    </div>
                </form>
            </div>
        </div>
        </div>
        </div>
        </div>
        <script>
            function checkpasswordmatch()
            {
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
                        y=false;
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
        </script>
    </body>
</html>
