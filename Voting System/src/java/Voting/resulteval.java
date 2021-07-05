/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Voting;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
public class resulteval extends HttpServlet {

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
        HttpSession session=request.getSession();
        String hostname=request.getParameter("hostname");
        String electionname=request.getParameter("Electionname");
        String partywon=null;
        String parties="";
        String counts="";
        int votersize=0;
        int partysize=0;
        int votersvoted=0;
        int votescounted=0;
        double turnout=0.0;
        boolean tie=false;
        int tiecount=0;
        int maxcount=0;
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/votingsystem?autoReconnect=true&useSSL=false";
        String positions=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url,"root","root");
            Statement st=conn.createStatement();
            String query2="Select count(*) from voters where election_name='"+electionname+"' and host_name='"+hostname+"' and voted=1";
            ResultSet rs2=st.executeQuery(query2);
            rs2.next();
            votersvoted=rs2.getInt(1);
            rs2.close();
            String query="Select count(*) from voters where election_name='"+electionname+"' and host_name='"+hostname+"'";
            ResultSet rs=st.executeQuery(query);
            rs.next();
            votersize=rs.getInt(1);
            rs.close();
            
            String query1="Select * from party where election_name='"+electionname+"' and host_name='"+hostname+"' and verified=1";
            ResultSet rsp=st.executeQuery(query1);
            while(rsp.next())
            {
                String party=rsp.getString("party_name");
                int count=rsp.getInt("count");
                votescounted+=count;
                if(count==maxcount&&maxcount!=0)
                {
                    tiecount=maxcount;
                    tie=true;
                }
                if(count>maxcount)
                {
                    maxcount=count;
                    partywon=party;
                    positions=rsp.getString("candidates");
                }
                parties+=party+",";
                counts+=Integer.toString(count)+",";
                partysize++;
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
                catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        turnout = ((double)votersvoted/(double)votersize)*100;
        turnout = (double)Math.round(turnout*100.0)/100.0;
        parties+="NOTA";
        counts+=Integer.toString(votersvoted-votescounted);
        if(tie&&tiecount==maxcount)
            request.setAttribute("tie","Yes");
        else
            request.setAttribute("tie","No");
        request.setAttribute("votersize",votersize);
        request.setAttribute("votersvoted",votersvoted);
        request.setAttribute("partywon",partywon);
        request.setAttribute("parties",parties);
        request.setAttribute("counts",counts);
        request.setAttribute("turnout",turnout);
        request.setAttribute("positions",positions);
        request.setAttribute("partysize",partysize);
        System.out.println(votersize+" "+votersvoted+" "+partywon+" "+parties+" "+counts+" "+turnout+" "+positions+" "+tie);
        RequestDispatcher rd=request.getRequestDispatcher("showresults.jsp");
        rd.forward(request, response);
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
