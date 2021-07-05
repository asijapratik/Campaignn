
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Fetch Details</title>
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
            .slanted{
                transform: rotate(-5deg)
                            skew(-5deg);
            }
        </style>
    </head>
    <body>
        <%! HashSet<String> hs=new HashSet<String>();
            String Title="";
        %>
        <%
            DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
            Date today=new Date();
            String currdate=df.format(today);
            if(session.getAttribute("Name")==null)
            {
                response.sendRedirect("login.jsp?redo=fetchdetails.jsp");
                return;
            }
            String login=(String)session.getAttribute("Name");
            Connection conn=null;
            String url="jdbc:mysql://localhost:3306/votingsystem?useSSL=false";
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn=DriverManager.getConnection(url,"root","root");
                Statement st=conn.createStatement();
                String query="Select Title from responses where login_id='"+login+"'";
                ResultSet rs=st.executeQuery(query);
                while(rs.next()){
                    hs.add(rs.getString(1));
                }
                rs.close();
                st.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            finally{
                if(conn!=null){
                    try{
                        conn.close();
                    }
                    catch(Exception e){
                        e.printStackTrace();
                    }
                }
            }
        %>
        <div class="container ">
            <div class="row mt-2 mb-2">
                <div class="col-4 mr-auto slanted">
                    <img src="assets/img/logo.png" style="float:left" width="40" height="40">
                    <h3 class="text-secondary font-italic">Campaignn</h3>
                </div>
                <div class="col-7 mx-auto">
                    <h1>Fill Surveys</h1>
                    <div style="float:right" class="text-dark">
                        <a target="blank" href="LoadProfile">My Profile</a>&nbsp;
                        <a href="LogoutServlet?redo=Surveys.jsp">Logout</a>
                    </div>
                </div>
            </div>
            <hr>
        </div>
        <sql:setDataSource driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/votingsystem?useSSL=false" user="root" password="root"/>
        <%String q3="select * from surveydetails";%>
        <%--Fetch that table whose login_id is not maurya--%>
        <sql:query var="result" sql="<%=q3%>">
        </sql:query>
        <table class="table table-hover table-success table-striped table-bordered border-white" style="width:60%;margin:auto;margin-top:10%">
                        <thead>
                            <tr style="font-size:20px">
                                <th scope="col" style="margin:auto">SNo.</th>
                                <th scope="col">Title</th>
                                <th scope="col">Start Date</th>
                                <th scope="col">End Date</th>
                                <th scope="col">Questions</th>
                                <th scope="col">Details</th>
                                <th scope="col">View</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            
                            <c:forEach var="x" items="${result.rows}">
                                <c:set var="q" value="${x.login_id}"></c:set>
                                <c:set var="w" value="${x.StartDate}"></c:set>
                                <c:set var="z" value="${x.EndDate}"></c:set>
                                <%
                                    String startdate=(String)pageContext.getAttribute("w");
                                    String enddate=(String)pageContext.getAttribute("z");
                                    String surveyhostname=(String)pageContext.getAttribute("q");
                                    String firstname=surveyhostname.split(" ")[0];
                                    String lastname=surveyhostname.split(" ")[1];
                                    String email=(String)session.getAttribute("email");
                                    String emailending=email.split("@")[1];
                                    String hostemail="";
                                    Connection conn1=null;
                                    String url1="jdbc:mysql://localhost:3306/votingsystem?useSSL=false";
                                    try{
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        conn1=DriverManager.getConnection(url1,"root","root");
                                        Statement st1=conn1.createStatement();
                                        String query1="Select email from users where firstname='"+firstname+"' and lastname='"+lastname+"'";
                                        ResultSet rs1 = st1.executeQuery(query1);
                                        rs1.next();
                                        hostemail=rs1.getString(1);
                                        rs1.close();
                                        st1.close();
                                    }
                                    catch(Exception e)
                                    {
                                        e.printStackTrace();
                                    }
                                    finally{
                                        if(conn1!=null)
                                            try{
                                                conn1.close();
                                            }
                                            catch(Exception es)
                                            {
                                                es.printStackTrace();
                                            }
                                    }
                                    String hostemailending=hostemail.split("@")[1];
                                    if(emailending.equals(hostemailending)&&startdate.compareTo(currdate)<=0&&enddate.compareTo(currdate)>=0)
                                    {
                                %>
                                <tr>
                                    <td><c:out value="${x.SNo}"/></td>
                                    <td><c:out value="${x.Title}"/></td>
                                    <td><c:out value="${x.StartDate}"/></td>
                                    <td><c:out value="${x.EndDate}"/></td>
                                    <td><c:out value="${x.Questions}"/></td>
                                    <td style="max-width:220px">
                                        <c:out value="${x.Details}"/>
                                    </td>
                                    <c:set var="y" value="${x.Title}"></c:set>
                                    <%  Title=(String)pageContext.getAttribute("y");
                                        System.out.println(Title);
                                        if(hs.contains(Title))
                                        {
                                    %>
                                    <td><a href="fetchquestions.jsp?title=${x.Title}" style="pointer-events:none"><i class="fa fa-eye" style="font-size:25px;margin:auto"></i></a></td>
                                    <%}
                                        else
                                        {   
                                    %>
                                    <td><a href="fetchquestions.jsp?title=${x.Title}"><i class="fa fa-eye" style="font-size:25px;margin:auto"></i></a></td>
                                    <%
                                        }
                                    %>
                                </tr>
                                <%
                                    }
                                %>
                            </c:forEach>
                        </tbody>
                    </table>
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    
    

</body>
</html>