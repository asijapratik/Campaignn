<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Thanks</title>
        <!-- Favicons -->
        <link href="assets/img/logo1.JPG" rel="icon">        
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  
         <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <style>
  		@keyframes changeshape{
  			from{
  				width:10px;
  				height:0px;
  				border-radius:25%;
  				margin:auto;
                                margin-top:15%;
  			}
  			
  		}
  		#div1{
                width:70%;
                margin:auto;
                height:500px;
                margin-top:5%;

            }
        #div1 img{
        		animation:changeshape 4s ease-in-out 1;
            }
  </style>
    </head>
    <body>
        <div id="div1">
            <img src="assets/img/thanks.jpg" height="100%" width="100%">
        </div>
        <%
            response.setHeader("Refresh","4;Surveys.jsp");
        %>
    </body>
</html>
