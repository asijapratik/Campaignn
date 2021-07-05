/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conducting;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
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
public class AdminServlet extends HttpServlet {

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
        boolean picexists=false;
        HttpSession session=request.getSession();
        if(session.getAttribute("Name")==null){
            response.sendRedirect("login.jsp?redo=AdminServlet");
            return;
        }
        String name=(String) session.getAttribute("Name");
        String email=(String) session.getAttribute("email");
        ArrayList<ElectionDetails> conducting = new ArrayList<ElectionDetails>();
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date today=new Date();
        String currdate=df.format(today);
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/VotingSystem?autoReconnect=true&useSSL=false";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url,"root","root");
            Statement st=conn.createStatement();
            String query1="Select profile_pic from users where email='"+email+"'";
            ResultSet rs=st.executeQuery(query1);
            if(rs.next())
            {
                Blob blob=rs.getBlob(1);
                if(blob!=null)
                {
                    picexists=true;
                    InputStream inputstream=blob.getBinaryStream();
                    ByteArrayOutputStream outputstream=new ByteArrayOutputStream();
                    byte[] buffer=new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputstream.read(buffer)) != -1) {
                        outputstream.write(buffer, 0, bytesRead);                  
                    }
                    byte[] imageBytes = outputstream.toByteArray();
                    String base64Image=Base64.getEncoder().encodeToString(imageBytes);
                    inputstream.close();
                    outputstream.close();
                    session.setAttribute("profilepic",base64Image);
                }
            }
            rs.close();
            String query="Select * from elections where host_name='"+name+"'";
            ResultSet rs1=st.executeQuery(query);
            while(rs1.next())
            {
                ElectionDetails ed=new ElectionDetails();
                ed.setHostname(name);
                String org=rs1.getString(2);
                //System.out.println(org);
                ed.setOrganization(org);
                String orgURL=rs1.getString(3);
                ed.setOrganizationURL(orgURL);
                String electionname=rs1.getString(4);
                ed.setElectionname(electionname);
                String sdate=rs1.getString(5);
                ed.setStartDate(sdate);
                String edate=rs1.getString(6);
                ed.setEndDate(edate);
                String stime=rs1.getString(7);
                ed.setStartTime(stime);
                String etime=rs1.getString(8);
                ed.setEndTime(etime);
                String positions=rs1.getString(9);
                ed.setPositions(positions);
                String edesc=rs1.getString(10);
                ed.setDescription(edesc);
                String result=rs1.getString(11);
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
                conducting.add(ed);
            }
            st.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally{
            if(conn!=null)
            {
                try{
                    conn.close();
                }
                catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        session.setAttribute("conducting",conducting);
        session.setAttribute("picexists",picexists);
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
