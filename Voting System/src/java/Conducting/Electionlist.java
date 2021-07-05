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
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KC
 */
public class Electionlist extends HttpServlet {

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
        String todayDate=df.format(today).split(" ")[0];
        String todayTime=df.format(today).split(" ")[1];
        ArrayList<ElectionDetails> al=new ArrayList<ElectionDetails>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/VotingSystem?autoReconnect=true&useSSL=false","root","root");
            Statement st=c.createStatement();
            String query="Select * from Elections order by sdate,stime;";
            ResultSet rs=st.executeQuery(query);
            //int count=0;
            while(rs.next())
            {
                ElectionDetails ed=new ElectionDetails();
                String host=rs.getString(1);
                ed.setHostname(host);
                String org=rs.getString(2);
                ed.setOrganization(org);
                String orgURL=rs.getString(3);
                ed.setOrganizationURL(orgURL);
                String name=rs.getString(4);
                ed.setElectionname(name);
                String sdate=rs.getString(5);
                ed.setStartDate(sdate);
                String edate=rs.getString(6);
                ed.setEndDate(edate);
                String stime=rs.getString(7);
                ed.setStartTime(stime);
                String etime=rs.getString(8);
                ed.setEndTime(etime);
                String positions=rs.getString(9);
                ed.setPositions(positions);
                String edesc=rs.getString(10);
                ed.setDescription(edesc);
                String result=rs.getString(11);
                ed.setResult(result);
                ed.setPre(false);
                ed.setLive(false);
                ed.setConducted(false);
                if(sdate.compareTo(todayDate)>0||(sdate.compareTo(todayDate)==0&&stime.compareTo(todayTime)>0))
                    ed.setPre(true);
                else if(edate.compareTo(todayDate)<0||(edate.equals(todayDate)&&etime.compareTo(todayTime)<0))
                    ed.setConducted(true);                    
                else
                    ed.setLive(true);
                al.add(ed);
            }
            rs.close();
            st.close();
            c.close();
            //System.out.println(al.size());
        }
        catch(Exception e){
            System.out.println(e);
        }
        request.setAttribute("ElectionsList",al);
        RequestDispatcher rd=request.getRequestDispatcher("Elections.jsp");
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
