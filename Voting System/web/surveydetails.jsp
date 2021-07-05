<%-- 
    Document   : surveydetails
    Created on : 25 May, 2021, 1:14:12 PM
    Author     : Arora computers
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Survey Details</title>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    </head>
    <body>
        <%
            if(session.getAttribute("Name")==null)
                response.sendRedirect("login.jsp?redo=surveydetails.jsp");
            
        %>
        <form action="SurveyDetails" method="post">
            <div class="container mx-auto">
			<div class="row w-100 text-warning mt-4" style="font-weight:700; font-size:40px" >
				New Survey
				<div class="border border-dark border-2 m-2"></div>
			</div>
			<div class="row bg-light mt-5">
				<div class="col-6 mt-3">
					<div>
						<label for="title" class="fs-4 fw-bolder" style="letter-spacing:1px" >Title</label><br>
						<input type="text" id="title" style="padding:5px; font-size:15px; width:80%; font-weight:600" class="shadow-sm rounded rounded-2 mt-1" placeholder="Test Survey" name="title" required>
					</div>
					<div class="mt-3">
						<label for="startdate" class="fs-4 fw-bolder" style="letter-spacing:1px" >Start Date</label><br>
						<input type="date" name="startdate" id="startdate" style="padding:5px; width:80%" required class="shadow-sm rounded rounded-2 mt-1" >
					</div>
					<div class="mt-3">
						<label for="enddate" class="fs-4 fw-bolder" style="letter-spacing:1px" >End Date</label><br>
						<input type="date" name="enddate" id="enddate" onblur="check()" style="padding:5px; width:80%" required class="shadow-sm rounded rounded-2 mt-1" >
                                                <p id="checked"></p>
                                        </div>
                                       <div class="mt-3">
						<label for="number" class="fs-4 fw-bolder" style="letter-spacing:1px" >No. of Questions</label><br>
						<input type="number" id="number" min="1" name="questions" required style="padding:5px; width:80%" class="shadow-sm rounded rounded-2 mt-1" >
					</div>
					
				</div>
				<div class="col-6 mt-3">
					<div>
						<label for="details" class="fs-4 fw-bolder" style="letter-spacing:1px" >Details</label><br>
						<textarea id="details" name="detail" required rows="7" style="padding:5px; font-size:15px; width:80%; font-weight:600" class="shadow-sm rounded rounded-2 mt-1" placeholder="Details"></textarea>
					</div>
				</div>
				<div class=" bg-light mt-3" style="margin-left:35%">
					<button class="btn btn-primary m-3 " value="submit" type="submit" id="submitbtn">Save</button>
					<a class="btn btn-secondary m-3" href="Surveys.jsp" role="button">Cancel</a>
				</div>
				
			</div>
		</div>
	
        </form>
        <script>
            startdate.min=new Date().toISOString().split("T")[0];
            enddate.min=new Date().toISOString().split("T")[0];
            function check(){
                document.getElementById("checked").innerHTML="";
                var edate=document.getElementById("enddate").value;
                var sdate=document.getElementById("startdate").value;
                if(edate<sdate)
                {
                    submitbtn.disabled=true;
                    document.getElementById("checked").innerHTML="End date cannot be less than start date";
                }
                else
                    submitbtn.disabled=false;
            }
        </script>
        
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    </body>
</html>
