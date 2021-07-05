<%-- 
    Document   : addquestions
    Created on : 25 May, 2021, 1:22:05 PM
    Author     : Arora computers
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Add Questions</title>
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
        <script src="https://kit.fontawesome.com/fa6bbc7d37.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <%
            String Title=(String)request.getAttribute("title");
            String Startdate = request.getParameter("startdate");
            String Enddate = request.getParameter("enddate");
            String ques=(String)request.getAttribute("ques");
            String details=request.getParameter("detail");
            
            
        %>
        <form method="post" action="AddQuestions">
        <div class="container w-80 me-0 ">
		<div class="row w-100 text-primary mt-4" style="font-weight:700; font-size:40px" >
			Conduct Survey
			<div class="border border-dark border-2 m-2"></div>
		</div>
		<div class="row">
			<div class="col-3 mt-5">
				<div class="card text-white mb-4" >
					<div class="border border-primary border-2"></div>
  					<div class="card-header text-dark fs-5 fw-bold">Survey Details</div>
  					<div class="card-body text-dark">
                                            <h5 class="card-title">Title:- <%=Title%></h5>
    					<div class="card-text">
                                                <p><span class="fs-5 " style="font-weight:600">Description : </span> <%=details%></p>
                                                <p><span class="fs-5" style="font-weight:600">Questions : </span><%=ques%></p>
                                                <p><span class="fs-5" style="font-weight:600">Start Date : </span><%=Startdate%></p>
                                                <p><span class="fs-5" style="font-weight:600">End Date : </span><%=Enddate%></p>
    					</div>
  					</div>
				</div>
			</div>
			<div class="col mt-5"><div class="card text-white mb-4" >
					<div class="border border-danger border-2"></div>
  					<div class="card-header text-dark fs-5 fw-bolder">Survey Questionaire
  						<button onclick="addques()" type="button" class="btn btn-success" style="margin-left:420px"> Add Questions</button>
  					</div>
  					<div class="card-body text-dark">
    					<p id="demo"></p>
  					</div>
                                        <div class="card-body text-dark">
    					<p id="buttons"></p>
  					</div>
                                        <div>
                                            <input type="hidden" value="${title}" name="Title">
                                            <input type="hidden" value="${ques}" name="Ques">
                                        </div>
                                            
				</div>

			</div>
		</div>
	</div>
        </form>
	<!-- Java Classes -->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/venobox/venobox.min.js"></script>
        <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
	<script>
		function myFunction() {
  		document.getElementById("demo").innerHTML = "<div class='fs-4 fw-bold mt-3 ms-3' >Write Question</div> <textarea class='w-75 m-2' rows='5'></textarea> <div class='fs-4 fw-bold mt-3 ms-3' >Select Answer Type</div><select id='options' style='font-size:20px;font-weight:700; border-radius:10px;color:red; padding:5px;margin-left:20px;margin-top:10px'><option value='empty'>Select Type</option><option value='singletype'>Single Type</option><option value='multipletype'>Multiple Type</option><option value='text'>Text</option></select>";
		}
                
                
                
                function addques(){
                    var quesno=<%=Integer.parseInt(request.getParameter("questions"))%>;
                    var x="";
                    document.getElementById('demo').innerHTML=x;
                    for(var i=1;i<=quesno;i++)
                    {
                        x+='<div class="fs-4 fw-bold mt-3 ms-3" >Write Question</div>';
                        x+='<textarea name="textarea'+i+'" required class="w-75 m-2" rows="5"></textarea>';
                        x+='<div class="fs-4 fw-bold mt-3 ms-3" >Select Answer Type</div>';
                        x+='<select name="optiontype'+i+'" id="optiontype'+i+'" onchange="addoptions('+i+')" style="border:0px;font-size:20px;font-weight:700; border-radius:5px;color:white; padding:5px;margin-left:20px;margin-top:10px;background-color:#0d6efd">';
                        x+='<option value="Select Type" default>Select Type</option>';
                        x+='<option value="Single">Single Choice</option>';
                        x+='<option value="Multiple">Multiple Choice</option>';
                        x+='<option value="Subjective">Subjective</option>';
                        x+='</select>';
                        x+='<p id="options'+i+'"+>';
                        x+='<br>';
                    }
                    document.getElementById('demo').innerHTML=x;
                    document.getElementById('buttons').innerHTML="<div class='bg-white mt-3' style='margin-left:35%'><button class='btn btn-primary m-3 ' value='submit' type='submit' >Save</button><a class='btn btn-secondary m-3' href='newjsp1.jsp' role='button'>Cancel</a></div>";
                }
                function addoptions(id){
                    var type=document.getElementById("optiontype"+id).value;
                    document.getElementById("options"+id).innerHTML="";
                    if(type=="Single" || type=="Multiple")
                    {
                        var x="<span style='margin:10px;margin-left:20px;font-weight:800;font-size:20px'>Enter No. of Choices --></span>";
                        x+="<input type='number' name='noofoptions"+id+"' id='noofoptions"+id+"' required min='2' onchange='addoptionboxes("+id+")' style='margin:10px;margin-left:20px;padding:3px;font-size:15px;border:2px solid black'>";
                        x+="<p id='optionnos"+id+"'></p>";
                        document.getElementById("options"+id).innerHTML=x;
                    }
                }
                function addoptionboxes(id){
                    document.getElementById("optionnos"+id).innerHTML="";
                    var noofoptions=document.getElementById("noofoptions"+id).value;
                    var x="";
                    for(var i=1;i<=noofoptions;i++)
                    {
                        x+="<span style='font-size:20px;font-weight:600;margin-left:20px'>Option"+ i+"</span>";
                        x+="<input type='text' name='option"+id+"_"+i+"' required style='margin:10px;border-radius:5px;padding:3px'><br>";
                    }
                    document.getElementById("optionnos"+id).innerHTML=x;
                }
	</script>








	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    </body>
</html>
