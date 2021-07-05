/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conducting;

import com.sun.xml.rpc.processor.ProcessorNotificationListener;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author KC
 */
@MultipartConfig(maxFileSize = 16177215)
public class PartyRegister extends HttpServlet {

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
        String ename=request.getParameter("ename");
        System.out.println(ename);
        String hname=request.getParameter("hname");
        HttpSession session = request.getSession();
        ArrayList<ElectionDetails> eligible=(ArrayList<ElectionDetails>)session.getAttribute("eligible");
        String name=(String) session.getAttribute("Name");
        String firstname=name.split(" ")[0];
        String lastname=name.split(" ")[1];
        String[] positions = null;
        boolean erroroccurs=false;
        for(int i=0;i<eligible.size();i++)
        {
            if(eligible.get(i).getElectionname().equals(ename)&&eligible.get(i).getHostname().equals(hname))
            {
                positions=eligible.get(i).getPositions().split(",");                
                break;
            }
        }
        String error="";
        String x=ename+" "+hname;
        String partyname=request.getParameter(x+"pname");
        String address=request.getParameter(x+"address");
        String a="";
        for(int i=0;i<positions.length;i++)
        {
            a+=positions[i]+"-"+request.getParameter(x+"pos_"+Integer.toString(i))+",";
        }
        InputStream inputstream=null;
        Part part=request.getPart(x+"plogo");
        if(part!=null)
        {
            inputstream = part.getInputStream();
        }
        a=a.substring(0,a.length()-1);
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/votingsystem?autoReconnect=true&useSSL=false";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url,"root","root");
            Statement st=conn.createStatement();
            String query="Select count(*) from party where election_name='"+ename+"' and host_name='"+hname+"' and party_name='"+partyname+"'";
            ResultSet rs=st.executeQuery(query);
            rs.next();
            int count=rs.getInt(1);
            if(count==0)
            {
                PreparedStatement ps=conn.prepareStatement("Insert into party values(?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1,firstname);
                ps.setString(2,lastname);
                ps.setString(3,ename);
                ps.setString(4,hname);
                ps.setString(5,partyname);
                if(inputstream!=null)
                    ps.setBlob(6,inputstream);
                ps.setString(7,a);
                ps.setString(8,address);
                ps.setInt(9,0);
                ps.setInt(10,0);
                int row = ps.executeUpdate();
                ps.close();
            }
            else
            {
                erroroccurs=true;
                error+="<div class='alert alert-danger alert-dismissible'>";
                error+="<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                error+="<strong>Please Try Again!</strong>A party is already registered by the name "+partyname+" for "+ename;
                error+="</div>";
            }
            rs.close();
            st.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally{
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }        
        if(erroroccurs==true)
        {
            request.setAttribute("errormessage",error);
            RequestDispatcher rd=request.getRequestDispatcher("Party.jsp");
            rd.forward(request, response);
        }
        else
        {
            response.sendRedirect("PartyServlet");
        }
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
