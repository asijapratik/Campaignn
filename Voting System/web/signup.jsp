<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Sign Up</title>
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
                              <h1 >Signup</h1>
                           </div>
                        </div>
                        ${message}
                        <div class="m-1 p-1" style="background-color:#fffacd">
                            <p>Sign Up using <strong>institution email id's</strong> if you want to keep elections and surveys private and be accessible to users of the same institution.</p>
                        </div>
                        <form id="reg" action="SignUpServlet?redo=${param.redo}" name="registration" method="post">
                           <div class="form-group">
                              <label for="exampleInputEmail1">First Name</label>
                              <input type="text"  name="firstname" class="form-control" id="firstname" placeholder="Enter Firstname" onkeyup="validate()" required>
                              <span id="fnamemsg" class="text-danger"></span>
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">Last Name</label>
                              <input type="text"  name="lastname" class="form-control" id="lastname" placeholder="Enter Lastname" onkeyup="validate()" required>
                              <span id="lnamemsg" class="text-danger"></span>
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" name="email"  class="form-control" id="email" placeholder="Enter email" required>
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">Password</label>
                              <input type="password" name="password"  id="password"  class="form-control" placeholder="Enter Password" onkeyup="validate()" validate>
                              <span id="message" class="text-danger"></span>
                           </div>
                           <div class="col-md-12 text-center mb-3">
                              <button type="submit" class="btn btn-block mybtn btn-primary tx-tfm" id="submit" disabled>Get Started</button>
                           </div>
                           <div class="col-md-12 ">
                              <div class="form-group">
                                 <p class="text-center"><a href="login.jsp?redo=${param.redo}" id="signin">Already have an account?</a></p>
                              </div>
                           </div>
                        </form>
                     </div>
                </div>
            </div>
        </div>
        </div>
        <script>
            function validate()
            {
                var x=document.getElementById("firstname").value;
                var y=document.getElementById("lastname").value;
                var z=document.getElementById("password").value;
                document.getElementById("fnamemsg").innerHTML="";
                document.getElementById("lnamemsg").innerHTML="";
                document.getElementById("message").innerHTML="";
                var regex=/^[A-Za-z\s\'\-]{2,15}$/;
                var x1=false,y1=false,z1=false;
                if(x!="")
                {
                    if(!regex.test(x))
                        document.getElementById("fnamemsg").innerHTML="Name should be 2-15 characters containing only alphabets";
                    else
                        x1=true;
                }
                if(y!="")
                {
                    if(!regex.test(y))
                        document.getElementById("lnamemsg").innerHTML="Name should be 2-15 characters containing only alphabets";
                    else
                        y1=true;
                }
                if(z!="")
                {
                    if (z.length < 8) {
                        document.getElementById("message").innerHTML+="Your password must be at least 8 characters.\n\n";
                    }
                    else
                        document.getElementById("message").innerHTML+="";
                    if (z.search(/[A-Z]/) < 0) {
                        document.getElementById("message").innerHTML+="Your password must contain at least one uppercase letter.\n"; 
                    }
                    else
                        document.getElementById("message").innerHTML+="";
                    if (z.search(/[0-9]/) < 0) {
                        document.getElementById("message").innerHTML+="Your password must contain at least one digit.\n";
                    }
                    else
                        document.getElementById("message").innerHTML+="";
                    if(document.getElementById("message").innerHTML=="")
                        z1=true;
                }
                if(x1&&y1&&z1)
                    submit.disabled=false;
                else
                    submit.disabled=true;
            }
        </script>
    </body>
</html>
