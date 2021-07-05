<%-- 
    Document   : VoteConfirm
    Created on : May 17, 2021, 3:11:00 PM
    Author     : KC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>User Voting</title>
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
    </head>
    <body>
        <div class="container mt-5">
            <div class="mb-5 mt-1 text-dark ml-5"> 
                <img src="assets/img/logo.png" alt="Campaignn" style="float:left" width="50" height="50">
                <h1 style="font-family:'Poppins',sans-serif;">Campaignn</h1>
            </div>
            <div class="border border-primary">
                <h1 class="mt-5 text-center mb-2">Your Vote has been recorded successfully.</h1>
                <h2 class="text-center mb-5">You will be redirected to Elections Page in <span id="countdowntimer">5</span> seconds</h2>
                <%response.setHeader("Refresh","5;URL='Electionlist'");%>
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
                var timeleft = 5;
                var downloadTimer = setInterval(function(){
                    timeleft--;
                    document.getElementById("countdowntimer").textContent = timeleft;
                    if(timeleft <= 0)
                        clearInterval(downloadTimer);
                    },1000);
        </script>
    </body>
</html>
