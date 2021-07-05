
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Fetch Questions</title>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

        <style>
            #div1{
                width:50%;
                height:auto;
                margin:auto;
                margin-top:5%;
                border-radius:20px;
            }
        </style>
        <script>
            function preback(){window.history.forward();}
            setTimeout("preback()",0);
            window.onunload=function(){null};
            </script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            if(session.getAttribute("Name")==null)
                response.sendRedirect("login.jsp?redo=fetchdetails.jsp");
        %>
        <%!
            int total;
        %>
        <%
            String title=request.getParameter("title");
            System.out.println(title);
            int count=1;
            total=0;
        %>
        <sql:setDataSource driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/votingsystem?useSSL=false" user="root" password="root"/>
        <%String q3="select * from questiondetails where Title='"+title+"';";%>
        <sql:query var="result" sql="<%=q3%>">
        </sql:query>
        <c:forEach var="x" items="${result.rows}">
            <%total+=1;%>
        </c:forEach>
        <%System.out.println("total "+total);%>
        <form action="FilledSurvey?Title=<%=title%>&count=<%=total%>" method="post">
            <div id="div1" style="box-shadow:0px 0px 8px 6px red">
                <br><p class="text-primary fw-bold " style="margin-left:170px;text-shadow:2px 2px yellow;font-size:50px">Survey Form</p>
            
            
            <c:forEach var="x" items="${result.rows}">
                <div>
                    <div style="width:40px;height:40px;border-radius:50%;margin:15px;font-size:25px;display:inline-block" class="shadow fw-bold text-secondary"><span style="margin-left:10px"><%=count%></span></div>
                    <span class="fs-3 text-info" style="font-weight:600"><c:out value='${x.Question}'/>?</span>
                    <c:set var="Type" scope="session" value="${x.AnswerType}"/>
                    
                    
                    
                    
                    <c:choose>
                         
                        <c:when test="${Type=='Single'}"> 
                            <%--<c:out value="Hello"/>--%>
                            <c:set var="ocount" scope="session" value="${x.OptionCount}"/>
                            <%--<c:out value="${x.Options}"></c:out>--%>
                            <p><c:forTokens items="${x.Options}" delims="," var="name">  
                                    <input type="radio" name=<%=count%> value="${name}" style="margin-left:70px;height:18px;width:18px" class="shadow-sm"><span class="fs-4 text-warning ms-2"><c:out value="${name}"/></span><br>  
                                </c:forTokens>  </p> <br>
                           
                        </c:when>  
                        <c:when test="${Type=='Multiple'}">  
                              <p><c:forTokens items="${x.Options}" delims="," var="name">  
                                      <input type="checkbox" name=<%=count%> value="${name}" style="margin-left:70px;height:18px;width:18px" class="shadow-sm" ><span class="fs-4 text-danger ms-2"><c:out value="${name}"/></span><br>  
                                  </c:forTokens>  </p> 
                        </c:when>  
                        <c:otherwise>  
                        <br><input type="text" name=<%=count%> class="shadow" style="margin-left:70px;border-radius:10px;width:80%;font-size:20px;padding:5px">
                        </c:otherwise>  
                    </c:choose> 
                </div>
                    <%count+=1;%>
            </c:forEach>
            <div class=" mt-3" style="margin-left:35%">
					<button class="btn btn-warning m-3 " value="submit" type="submit" >Save</button>
					<a class="btn btn-info m-3" href="Surveys.jsp" role="button">Cancel</a>
				</div>
            <br><br>
            
        </div>
        </form>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    </body>
</html>
