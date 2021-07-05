<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>OTP</title>
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
                            <h1>Enter OTP</h1>
                        </div>
                    </div>
                <form action="otpentered?redo=${param.redo}" method="post">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Enter OTP (6 digits):</label>
                        <input type="hidden" value="${email}" name="email">
                        <input type="hidden" value="${generatedOTP}" name="generatedotp">
                        <input type="numbers" name="otp"  class="form-control" placeholder="Enter one time password" required>
                    </div>
                    <div class="col-md-12 text-center mt-2">
                       <button type="submit" class=" btn mybtn btn-primary tx-tfm">Submit</button>
                    </div>
                </form>
            </div>
        </div>
        </div>
        </div>
        </div>
    </body>
</html>
