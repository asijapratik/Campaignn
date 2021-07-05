<%-- 
    Document   : showresults
    Created on : Jun 3, 2021, 4:52:54 PM
    Author     : KC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Campaignn</title>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <script src="https://kit.fontawesome.com/fa6bbc7d37.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
        <script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
        <style>
            #main{
                border-style:double;
            }
            .slanted{
                transform: rotate(-5deg)
                            skew(-5deg);
            }
        </style>
    </head>
    <body>
        <div class="container mb-2">
            <button style="float:right" onclick="getPDF()">Download as PDF</button>
        </div>
        <div id="main" class="container mt-2 mb-2 canvas_div_pdf">
            <div class="row mt-2 mb-2">
                <div class="col-4 mr-auto slanted">
                    <img src="assets/img/logo.png" style="float:left" width="40" height="40">
                    <h3 class="text-secondary font-italic">Campaignn</h3>
                </div>
                <div class="col-7 mx-auto">
                    <h1>Election Results</h1>
                </div>
            </div>
            <div class="bg-dark text-white p-2 text-center mb-2">
                <h4>${param.Electionname}</h4>
            </div>
            <c:choose>
                <c:when test="${tie.equals('Yes')}">
                    <h2 class="mt-4 mb-4" style="font-family:Courier New, monospace; font-style:oblique">There has been a tie for ${param.Electionname}</h2>
                </c:when>
                <c:otherwise>
                    <h2 class="mt-4 mb-4" style="font-family:Courier New, monospace; font-style:oblique">Congratulations to party <c:out value="${partywon}"/> for winning the ${param.Electionname}</h2>
                </c:otherwise>
            </c:choose>
            <div class="container mt-4 mb-4">
                <h3 class="text-primary"><u>Newly Elected Officials</u></h3>
                <ul>
                    <c:forTokens var="position" items="${positions}" delims=",">
                        <li><h5>${position}</h5></li>
                    </c:forTokens>
                </ul>
            </div>
            <div class="row mt-4 mb-4">
                <div class="col-md-6">
                    <canvas id="mychart1"></canvas>
                </div>
                <div class="col-md-6">
                    <canvas id="mychart2"></canvas>
                </div>
            </div>
            <div class="container mt-4 mb-4">
                <h3 class="text-primary"><u>Stats</u></h3>
                <ul style="list-style-type:circle;">
                    <li><h4><c:out value="${partysize}"/> Parties registered for elections</h4></li>
                    <li><h4><c:out value="${votersize}"/> Voters registered for election</h4></li>
                    <li><h4><c:out value="${votersvoted}"/> voters voted in election</h4></li>
                    <li><h4>Voter Turnout - <c:out value="${turnout}"/>%</h4></li>
                </ul>
            </div>
        </div>
        <script>
            let myChart1 = document.getElementById('mychart1').getContext('2d');
            let myChart2 = document.getElementById('mychart2').getContext('2d');

            // Global Options
            Chart.defaults.global.defaultFontFamily = 'Lato';
            Chart.defaults.global.defaultFontSize = 18;
            Chart.defaults.global.defaultFontColor = '#777';

            var labelss='${parties}'.split(",");
            var datas='${counts}'.split(",");
//            var labels=['Boston', 'Worcester', 'Springfield', 'Lowell', 'Cambridge', 'New Bedford'];
//            var data=[617594,181045,153060,106519,105162,95072];
            var bgColor = ["#878BB6", "#FFEA88", "#FF8153", "#4ACAB4", "#c0504d", "#8064a2"];
            let votecountchart1 = new Chart(myChart1, {
              type:'pie', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
              data:{
                labels:labelss,
                datasets:[{
                  label:'Vote Count',
                  data:datas,
                  backgroundColor:bgColor,
                  borderWidth:1,
                  borderColor:'#777',
                  hoverBorderWidth:3,
                  hoverBorderColor:'#000'
                }]
              },
              options:{
                title:{
                  display:true,
                  text:'Votes Count',
                  fontSize:25
                },
                legend:{
                  display:true,
                  position:'right',
                  labels:{
                    fontColor:'#000'
                  }
                },
                layout:{
                  padding:{
                    left:50,
                    right:0,
                    bottom:0,
                    top:0
                  }
                },
                tooltips:{
                  enabled:true
                },
                responsive:true,
              }
            });
             let votecountchart2 = new Chart(myChart2, {
              type:'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
              data:{
                labels:labelss,
                datasets:[{
                  label:'Vote Count',
                  data:datas,
                  backgroundColor:bgColor,
                  borderWidth:1,
                  borderColor:'#777',
                  hoverBorderWidth:3,
                  hoverBorderColor:'#000'
                }]
              },
              options:{
                title:{
                  display:true,
                  text:'Votes Count',
                  fontSize:25
                },
                legend:{
                  display:true,
                  position:'right',
                  labels:{
                    fontColor:'#000'
                  }
                },
                layout:{
                  padding:{
                    left:50,
                    right:0,
                    bottom:0,
                    top:0
                  }
                },
                tooltips:{
                  enabled:true
                },
                scales:{
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                responsive:true,
                maintainAspectRatio:false
              }
            });
            function getPDF(){

		var HTML_Width = $(".canvas_div_pdf").width();
		var HTML_Height = $(".canvas_div_pdf").height();
		var top_left_margin = 15;
		var PDF_Width = HTML_Width+(top_left_margin*2);
		var PDF_Height = (PDF_Width*1.5)+(top_left_margin*2);
		var canvas_image_width = HTML_Width;
		var canvas_image_height = HTML_Height;
		
		var totalPDFPages = Math.ceil(HTML_Height/PDF_Height)-1;
		

		html2canvas($(".canvas_div_pdf")[0],{allowTaint:true}).then(function(canvas) {
			canvas.getContext('2d');
			
			console.log(canvas.height+"  "+canvas.width);
			
			
			var imgData = canvas.toDataURL("image/jpeg", 1.0);
			var pdf = new jsPDF('p', 'pt',  [PDF_Width, PDF_Height]);
		    pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin,canvas_image_width,canvas_image_height);
			
			
			for (var i = 1; i <= totalPDFPages; i++) { 
				pdf.addPage(PDF_Width, PDF_Height);
				pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
			}
			
		    pdf.save("Election-Result.pdf");
                });
            };
        </script>
    </body>
</html>
