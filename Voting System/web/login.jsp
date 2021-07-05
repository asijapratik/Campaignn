<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Log In</title>
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
                            <h1>Login</h1>
                            <span class="bg-danger text-white mt-2">${Info.error}</span>
                            <span class="bg-success text-white mt-2">${Info.success}</span>
                        </div>
                    </div>
                ${passchange}
                <form action="LoginServlet?redo=${param.redo}" method="post" name="login">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" name="email"  class="form-control" id="email" placeholder="Enter email" required>
                    </div>
                    <div class="form-group">
                        <a href="ForgotPassword.jsp?redo=${param.redo}" class="text-primary" style="float:right">Forgot Password?</a>
                        <label for="exampleInputEmail1">Password</label>
                        <input type="password" name="password" id="password"  class="form-control" placeholder="Enter Password" required>
                    </div>
                    <div class="form-group">
                       <p class="text-center">By logging in you accept our <a href="#">Terms Of Use</a></p>
                    </div>
                    <div class="col-md-12 text-center">
                       <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
                       <span class="text-danger">${message.email}</span>
                    </div>
                    <div class="form-group">
                        <p class="text-center">Don't have account? <a href="signup.jsp?redo=${param.redo}" id="signup">Sign up here</a></p>
                    </div>
                </form>
            </div>
        </div>
        </div>
        </div>
        </div>
    </body>
</html>
