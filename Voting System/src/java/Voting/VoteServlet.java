/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Voting;

import Conducting.PartyDetails;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
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
public class VoteServlet extends HttpServlet {

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
        String Electionname=request.getParameter("Electionname");
        String organization=request.getParameter("organization");
        String hostname = request.getParameter("hostname");
        String voterId = request.getParameter("voterid");
        String voterpass = request.getParameter("voterpass");
        ArrayList<PartyDetails> parties=new ArrayList<PartyDetails>();
        DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime ld=LocalDateTime.now();
        String currdate=dtf.format(ld);
        String sdate=null;
        String edate=null;
        boolean forward=false;
        String msg="";
        
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/votingsystem?autoReconnect=true&useSSL=false";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url,"root","root");
            Statement st=conn.createStatement();
            String query1="Select * from voters where election_name='"+Electionname+"' and host_name='"+hostname+"' and voterId='"+voterId+"' and voterPass='"+voterpass+"' collate utf8mb4_bin;";
            ResultSet rsv=st.executeQuery(query1);
            if(rsv.next())
            {
                int voted=rsv.getInt("Voted");
                if(voted==0)
                {
                    forward=true;
                    Statement s=conn.createStatement();
                    String query2="Select * from party where election_name='"+Electionname+"' and host_name='"+hostname+"' and verified=1";
                    ResultSet rs=s.executeQuery(query2);
                    while(rs.next())
                    {
                        PartyDetails pd=new PartyDetails();
                        String partyowner=rs.getString("firstname")+" "+rs.getString("lastname");
                        String partyname=rs.getString("party_name");
                        String candidates=rs.getString("candidates");
                        String address=rs.getString("address");
                        Blob blob=rs.getBlob("logo");
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

                        pd.setPartylogo(base64Image);
                        pd.setPartyname(partyname);
                        pd.setPartyowner(partyowner);
                        pd.setCandidates(candidates);
                        pd.setAddress(address);

                        parties.add(pd);
                    }
                    rs.close();
                    s.close();
                }
                else
                {
                    msg+="<div class='alert alert-danger alert-dismissible'>";
                    msg+="<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                    msg+="<p>You Have Already Voted.</p>";
                    msg+="</div>";
                }
            }
            else
            {
                msg+="<div class='alert alert-danger alert-dismissible'>";
                msg+="<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                msg+="<p>Incorrect VoterId or VoterPass.</p>";
                msg+="</div>";
            }
            rsv.close();
            String query="Select * from Elections where Name='"+Electionname+"' and host_name='"+hostname+"'";
            ResultSet rsp=st.executeQuery(query);
            if(rsp.next())
            {
                sdate=rsp.getString("sdate")+" "+rsp.getString("stime");
                edate=rsp.getString("edate")+" "+rsp.getString("etime");
            }
            System.out.println(sdate+" "+edate);
            if(sdate.compareTo(currdate)>0)
            {
                msg="";
                msg+="<div class='alert alert-danger alert-dismissible'>";
                msg+="<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                msg+="<p>Election has not started yet.</p>";
                msg+="</div>";
            }
            else if(edate.compareTo(currdate)<0)
            {
                msg="";
                msg+="<div class='alert alert-danger alert-dismissible'>";
                msg+="<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                msg+="<p>Election has ended. You cannot vote now</p>";
                msg+="</div>";
            }
            rsp.close();
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
                catch(Exception ex)
                {
                    ex.printStackTrace();
                }
            }
        }
        if(forward)
        {
            HttpSession session=request.getSession(true);
            session.setAttribute("Electionname",Electionname);
            session.setAttribute("organization",organization);
            session.setAttribute("voterid",voterId);
            session.setAttribute("voterpass",voterpass);
            session.setAttribute("extra","extra");
            session.setAttribute("parties",parties);
            session.setAttribute("hostname",hostname);
            RequestDispatcher rd=request.getRequestDispatcher("votehere.jsp");
            rd.forward(request,response);
        }
        else
        {
            request.setAttribute("msg",msg);
            RequestDispatcher rd=request.getRequestDispatcher("UserVoting.jsp?Electionname="+Electionname+"&organization="+organization+"&hostname="+hostname);
            rd.forward(request,response);
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
