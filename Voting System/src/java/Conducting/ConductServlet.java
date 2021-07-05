/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conducting;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KC
 */
public class ConductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String pattern="yyyy-MM-dd HH:mm:ss";
        DateFormat df=new SimpleDateFormat(pattern);
        Date today=Calendar.getInstance().getTime();
        String currdate=df.format(today);
        
        HttpSession session = request.getSession();
        String host=(String) session.getAttribute("Name");
        String org=request.getParameter("org");
        String orgurl=request.getParameter("orgurl");
        String name=request.getParameter("election_name");
        String sdate=request.getParameter("start_date");
        String stime=request.getParameter("start_time");
        String edate=request.getParameter("end_date");
        String etime=request.getParameter("end_time");
        int positions=Integer.parseInt(request.getParameter("positions"));
        String position="";
        for(int i=1;i<=positions;i++)
        {
            String z=request.getParameter("Position_"+i);
            position+=z+',';
        }
        position=position.substring(0,position.length()-1);
        String desc=request.getParameter("description");
        String result=request.getParameter("result");
        
        ElectionDetails ed=new ElectionDetails();
        ed.setHostname(host);
        ed.setOrganization(org);
        ed.setOrganizationURL(orgurl);
        ed.setElectionname(name);
        ed.setStartDate(sdate);
        ed.setStartTime(stime);
        ed.setEndDate(edate);
        ed.setEndTime(etime);
        ed.setPositions(position);
        ed.setDescription(desc);
        ed.setResult(result);
        ed.setPre(false);
        ed.setLive(false);
        ed.setConducted(false);
        String electionsdate=sdate+" "+stime;
        String electionedate=edate+" "+etime;
        if(electionsdate.compareTo(currdate)>0)
            ed.setPre(true);
        else if(electionedate.compareTo(currdate)<0)
            ed.setConducted(true);
        else
            ed.setLive(true);
        
        ArrayList<ElectionDetails> conducting = (ArrayList<ElectionDetails>) session.getAttribute("conducting");
//
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/VotingSystem?autoReconnect=true&useSSL=false","root","root");
            Statement st=c.createStatement();
            String query1="Select count(1) from elections where host_name='"+host+"' and Name='"+name+"'";
            ResultSet rs=st.executeQuery(query1);
            rs.next();
            int count=rs.getInt(1);
            if(count!=0){
                rs.close();
                st.close();
                c.close();
                String error="<div class='bg-danger text-white p-2'><h4>Error!</h4><p>Could not create Election. You have already created an Election by this name. Please Try Again.</p></div>";
                request.setAttribute("Added",error);
            }
            else{
                conducting.add(ed);
                String query="Insert into Elections values('"+host+"','"+org+"','"+orgurl+"','"+name+"','"+sdate+"','"+edate+"','"+stime+"','"+etime+"','"+position+"','"+desc+"','"+result+"');";
                st.executeUpdate(query);
                st.close();
                c.close();
                String done="<div class='bg-warning p-2'><h4>Success!</h4><p>Your Election has been created. You can view and edit details of your created election by going to ongoing elections tab in the sidebar.</p></div>";
                request.setAttribute("Added",done);
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        System.out.println(host+" "+org+" "+orgurl+" "+name+" "+sdate+" "+edate+" "+stime+" "+etime+" "+position+" "+desc+" "+result);
        RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
        rd.forward(request,response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
