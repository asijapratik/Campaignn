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
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
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
public class LoadElection extends HttpServlet {

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
        ArrayList<PartyDetails> parties=new ArrayList<PartyDetails>();
        ArrayList<VoterDetails> voters=new ArrayList<VoterDetails>();
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date today=new Date();
        String currdate=df.format(today);
        HttpSession session=request.getSession();
        String hostname=(String) session.getAttribute("Name");
        String electionname=request.getParameter("Electionname");
        
        ElectionDetails ed=new ElectionDetails();
        ArrayList<ElectionDetails> conducting=(ArrayList<ElectionDetails>)session.getAttribute("conducting");
        for(int i=0;i<conducting.size();i++)
        {
            if(conducting.get(i).getElectionname().equals(electionname)&&conducting.get(i).getHostname().equals(hostname))
            {
                ed=(ElectionDetails)conducting.get(i);
                break;
            }
        }
        
        
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/votingsystem?autoReconnect=true&useSSL=false";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url,"root","root");
            Statement st=conn.createStatement();
            String query1="Select * from voters where host_name='"+hostname+"' and election_name='"+electionname+"'";
            ResultSet rs1=st.executeQuery(query1);
            while(rs1.next())
            {
                VoterDetails vd=new VoterDetails();
                String votername=rs1.getString("name");
                vd.setName(votername);
                String voteremail=rs1.getString("email");
                vd.setEmail(voteremail);
                String voterid=rs1.getString("VoterId");
                vd.setVoterId(voterid);
                voters.add(vd);
            }
            rs1.close();
            String query="Select * from party where host_name='"+hostname+"' and election_name='"+electionname+"'";
            ResultSet rs=st.executeQuery(query);
            while(rs.next()){
                PartyDetails pd=new PartyDetails();
                String partyowner=rs.getString("firstname")+" "+rs.getString("lastname");
                String partyname=rs.getString("party_name");
                String candidates=rs.getString("candidates");
                String address=rs.getString("address");
                boolean verified=rs.getInt("verified")==1?true:false;
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
                pd.setVerified(verified);
                
                parties.add(pd);
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
        String redo=request.getParameter("redo");
        session.setAttribute("currdate",currdate);
        session.setAttribute("voters",voters);
        session.setAttribute("parties",parties);
        session.setAttribute("ed", ed);
        RequestDispatcher rd=request.getRequestDispatcher("buildElection.jsp?redo="+redo);
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
