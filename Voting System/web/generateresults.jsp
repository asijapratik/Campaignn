<%-- 
    Document   : generateresults
    Created on : 23 Jun, 2021, 5:32:30 PM
    Author     : Arora computers
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Generated Results</title>
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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <style>
            #div1{
                width:50%;
                height:auto;
                margin:auto;
               
                border-radius:20px;
            }
            .slanted{
                transform: rotate(-5deg)
                            skew(-5deg);
            }
        </style>
    </head>
    <body>
        <%
            if(session.getAttribute("Name")==null)
                response.sendRedirect("login.jsp?redo=choosesurvey.jsp");
        %>
        <%!
            ArrayList<ArrayList<String>> result1= new ArrayList<ArrayList<String> >();
            ArrayList<ArrayList<String>> result2= new ArrayList<ArrayList<String> >();
            ArrayList<HashMap<String, Integer>> diffoptions = new ArrayList<HashMap<String, Integer>>();
            int count;
            int total;
            int counti;
            int totalresponses;
            String questions="";
            String alloptions="";
            String responsescount="";
            String optiontypes="";
        %>
        <%
            try{
                String title=request.getParameter("title");
                
                int rcount=0;
                Class.forName("com.mysql.cj.jdbc.Driver");
                java.sql.Connection con=(java.sql.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/votingsystem?useSSL=false&allowPublicKeyRetrieval=true","root","root");
                Statement stm=con.createStatement();
                String q3="select * from questiondetails where Title='"+title+"';";
                
                ResultSet rs1=stm.executeQuery(q3);
               
                while(rs1.next())
                {
                    ArrayList<String> resul1=new ArrayList<String>();
                     resul1.add(rs1.getString(4));
                    resul1.add(rs1.getString(5));
                    resul1.add(Integer.toString(rs1.getInt(6)));
                    resul1.add(rs1.getString(7));
                    result1.add(resul1);
                }
                
                
                String q4="select * from responses where Title='"+title+"';";
                ResultSet rs2=stm.executeQuery(q4);
                
                while(rs2.next())
                {
                    totalresponses++;
                    ArrayList<String> resul1=new ArrayList<String>();
                    String temp1=(String)rs2.getString(3);
                    String[] temp2=temp1.split("%");
                    for (int i=0;i<temp2.length;i++)
                    {
                        resul1.add(temp2[i]);
                    }
                    result2.add(resul1);
                }
                for (int i=0;i<result2.size();i++)
                {
                for (int j=0;j<result2.get(i).size();j++) {
		    System.out.println(result2.get(i).get(j));
		}
                }
                for (int a=0;a<result1.size();a++)
                {
                    HashMap<String, Integer> temp = new HashMap<String, Integer>();
                    String abc=result1.get(a).get(1);
                    String s1="Single";
                    String s2="Multiple";
                    if (abc.equals(s1) || abc.equals(s2))
                    {
                        String options=result1.get(a).get(3);
                        String []option=options.split(",");
                        for (int f=0;f<option.length;f++)
                        {
                            temp.put(option[f], 0);
                        }
                        if (abc.equals(s1))
                        {
                            for (int t=0;t<result2.size();t++)
                            {
                                int c1=temp.get(result2.get(t).get(a));
                                temp.put(result2.get(t).get(a), c1+1);
                            }
                        }
                        else{
                            for (int t=0;t<result2.size();t++)
                            {
                                String def=result2.get(t).get(a);
                                String[] de=def.split("#");
                                for (int u=0;u<de.length;u++)
                                {
                                    int c1=temp.get(de[u]);
                                    temp.put(de[u], c1+1);
                                }
                            }
                        }
                    }
                    else
                    {
                       temp.put("", -1);
                    }
                    
                    diffoptions.add(temp);
                }
                for (int i=0;i<result1.size();i++)
                {
                   questions+=result1.get(i).get(0);
                   if(i<result1.size()-1)
                       questions+="&";
                }
                for (int i=0;i<diffoptions.size();i++)
                {
                    int g=0;
                    for (HashMap.Entry<String,Integer> set : diffoptions.get(i).entrySet()) 
                    {
                        String temp1=set.getKey();
                        String temp2="";
                        if(temp1.equals(temp2))
                        {
                            for (int j=0;j<result2.size();j++)
                            {
                                responsescount+=result2.get(j).get(i);
                                if(j<result2.size()-1)
                                    responsescount+="#";
                            }
                        }
                        else{
                            alloptions+=set.getKey();
                            if (g<diffoptions.get(i).size()-1)
                                alloptions+="#";
                            responsescount+=set.getValue();
                            if (g<diffoptions.get(i).size()-1)
                                responsescount+="#";
                        }
                        g++;
                        //System.out.println(set.getKey() + " = " + set.getValue());
                    }
                    if(i<diffoptions.size()-1)
                    {
                        alloptions+="%";
                        responsescount+="%";
                   
                    }
                    
                }
                for(int y=0;y<result1.size();y++)
                {
                    optiontypes+=result1.get(y).get(1);
                    if(y<result1.size()-1)
                        optiontypes+="&";
                }
                
                
                for (int i=0;i<result1.size();i++)
                {
                for (int j=0;j<result1.get(i).size();j++) {
		    System.out.println(result1.get(i).get(j));
		}
                }
                
            }
            catch(Exception a){
             a.printStackTrace();
         }
            %>
        <div class="container mb-2">
            <button style="float:right" onclick="getPDF()">Download as PDF</button>
        </div>
        <div class="canvas_div_pdf">
        <div class="container mt-2" id="div1">
        <div class="mr-auto slanted">
            <img src="assets/img/logo.png" style="float:left" width="40" height="40">
            <h3 class="text-secondary font-italic">Campaignn</h3>
        </div>
        <p style="margin-left:40%;display:inline-block;font-size:50px;font-weight:700;text-shadow:2px 2px yellow;padding:10px" class="text-warning ">Responses</p>
        <h5 class="mb-2 text-right" >Total Responses - (<%=totalresponses%>)</h5>
        <hr>
        <%
            System.out.println(total);
            total=result1.size();
            for (count=0;count<total;count++)
            {
                
        %>
            <div>
                <div style="width:40px;height:40px;border-radius:50%;margin:15px;font-size:25px;display:inline-block" class="shadow fw-bold text-secondary"><span style="margin-left:10px"><%=count+1%></span></div>
                <span class="fs-3 text-info" style="font-weight:600"><%=result1.get(count).get(0)%></span><br>
                <canvas  id="myChart<%=count%>"></canvas>
                <p id="<%=count%>" style="margin-top:-25px" class="text-secondary"></p>
            </div>
        <%    
            }
        %>
        </div>
        </div>
        <a href="Surveys.jsp"><button type="button" class="btn btn-danger mt-4" style="font-size:20px;margin-left:45%;margin-bottom:50px;">Close</button></a>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <script src="https://kit.fontawesome.com/fa6bbc7d37.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
        <script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
        <script>
      var total=<%=total%>;
      var count=0;
      var question='<%=questions%>';
      var questions=question.split("&");
      
      var optiontype='<%=optiontypes%>';
      var optiontypes=optiontype.split("&");
      var alloption='<%=alloptions%>';
      var alloptions=alloption.split("%");
      var responsecount='<%=responsescount%>';
      var responsescount=responsecount.split("%");
    
     for (var i=0;i<total;i++)
      {
          if(optiontypes[i]=='Single' || optiontypes[i]=='Multiple')
          {
            let myChart= document.getElementById('myChart'+i).getContext('2d');
            // Global Options
            Chart.defaults.global.defaultFontFamily = 'Lato';
            Chart.defaults.global.defaultFontSize = 18;
            Chart.defaults.global.defaultFontColor = '#777';

            if(optiontypes[i]=='Single')
            {
                let massPopChart = new Chart(myChart, {
              type:'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
              data:{
                labels:alloptions[i].split("#"),
                datasets:[{
                  label:questions[i].split("?"),
                  data:responsescount[i].split("#"),
                  //backgroundColor:'green',
                  backgroundColor:[
                      
                      'orange',
                      'blue',
                      'pink',
                      'yellow',
                    'rgba(255, 99, 132, 0.6)',
                    'rgba(54, 162, 235, 0.6)',
                    'rgba(255, 206, 86, 0.6)',
                    'rgba(75, 192, 192, 0.6)',
                    'rgba(153, 102, 255, 0.6)',
                    'rgba(255, 159, 64, 0.6)',
                    'rgba(255, 99, 132, 0.6)'
                  ],
                  borderWidth:1,
                  borderColor:'#777',
                  hoverBorderWidth:3,
                  hoverBorderColor:'#000'
                }]
              },
              options:{
                title:{
                  display:false,
                  text:'Largest Cities In Massachusetts',
                  fontSize:25
                },
                legend:{
                  display:false,
                  position:'right',
                  color:'rgba(255, 159, 64, 0.6)',
                  labels:{
                    fontColor:'#000'
                  }
                },
                layout:{
                  padding:{
                    left:100,
                    right:0,
                    bottom:0,
                    top:0
                  }
                },
                tooltips:{
                  enabled:true
                },
                responsive:true
                }
            }); 
            }
            else
            {
                let massPopChart = new Chart(myChart, {
              type:'pie', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
              data:{
                labels:alloptions[i].split("#"),
                datasets:[{
                  label:questions[i].split("?"),
                  data:responsescount[i].split("#"),
                  //backgroundColor:'green',
                  backgroundColor:[
                      'yellow',
                    'rgba(255, 99, 132)',
                    'rgba(54, 162, 235)',
                    'rgba(255, 206, 86)',
                    'rgba(75, 192, 192)',
                    'rgba(153, 102, 255)',
                    'rgba(255, 159, 64)',
                    'rgba(255, 99, 132)'
                  ],
                  borderWidth:1,
                  borderColor:'#777',
                  hoverBorderWidth:3,
                  hoverBorderColor:'#000'
                }]
              },
              options:{
                title:{
                  display:false,
                  text:'Largest Cities In Massachusetts',
                  fontSize:25
                },
                legend:{
                  display:true,
                  position:'right',
                  color:'rgba(255, 159, 64, 0.6)',
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
                responsive:true
            }
        }); 
            }    
        }
        else{
            document.getElementById('myChart'+i).height='0';
            var d='';
             var rescount=responsescount[i].split("#");
             for (var w=0;w<rescount.length;w++)
             {
                 d+='<p style="font-size:25px;font-weight:500;font-color:red;margin-left:70px"><i class="fas fa-arrow-right" style="font-size:20px;padding:8px"></i>'+rescount[w]+'</p>';
             }
             document.getElementById(i).innerHTML=d;
        }    
      }
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
			
		    pdf.save("Survey Responses.pdf");
                });
            };
      </script>
        
           
        <%
            result1.clear();
            result2.clear();
            diffoptions.clear();
            count=0;
            total=0;
            counti=0;
            questions="";
            alloptions="";
            responsescount="";
            optiontypes="";
        %>
    </body>
</html>
