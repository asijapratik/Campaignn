/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Voting;

import Conducting.PartyDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KC
 */
public class VoteRecord extends HttpServlet {

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
        String choice=request.getParameter("hidden");
        HttpSession session=request.getSession();
        ArrayList<PartyDetails> pd=(ArrayList<PartyDetails>) session.getAttribute("parties");
        String hostname=(String) session.getAttribute("hostname");
        String electionname=(String) session.getAttribute("Electionname");
        String voterId=(String) session.getAttribute("voterid");
        String voterpass=(String) session.getAttribute("voterpass");
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/votingsystem?autoReconnect=true&useSSL=false";
        if(!choice.equals("NOTA"))
        {
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn=DriverManager.getConnection(url,"root","root");
                Statement st=conn.createStatement();
                String query="Update party set count=count+1 where election_name='"+electionname+"' and host_name='"+hostname+"' and party_name='"+choice+"'";
                st.executeUpdate(query);
                
                String query1="Update voters set voted=1 where election_name='"+electionname+"' and host_name='"+hostname+"' and voterId='"+voterId+"' and voterPass='"+voterpass+"'";
                st.executeUpdate(query1);
                
                st.close();
            }
            catch(Exception e){
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
            session.invalidate();
            response.sendRedirect("VoteConfirm.jsp");
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
