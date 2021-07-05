/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conducting;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javafx.util.Pair;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author KC
 */
public class VoterRegister extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String saveFile="C:/Users/KC/Documents/NetBeansProjects/Voting System/web/Uploads";
    ArrayList<Pair<String,String>> al=null;
    public String calcVoterPass(){
        String res="";
        String possible="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        for(int i=0;i<12;i++)
        {
            int y=(int) (Math.random()*62);
            res+=possible.charAt(y);
        }
        return res;
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
        ElectionDetails ed=(ElectionDetails)session.getAttribute("ed");
        String electionname=(String)ed.getElectionname();
        String hostname=(String)session.getAttribute("Name");
        String hidden=request.getParameter("hiddeninput");
        System.out.println(hostname+" "+electionname+" "+hidden);
        
        boolean error=false;
        String errmsg="";
        if(hidden!=null&&hidden.equals("manual"))
        {
            String votername=request.getParameter("Name");
            String voteremail=request.getParameter("EmailId");
            int x=(int)(Math.random()*10000);
            String voterid=votername+Integer.toString(x);
            voterid=voterid.toLowerCase();
            voterid=voterid.replaceAll("\\s","");
            String voterpass=calcVoterPass();
            
            Connection conn=null;
            String url="jdbc:mysql://localhost:3306/votingsystem?autoReconnect=true&useSSL=false";
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn=DriverManager.getConnection(url,"root","root");
                PreparedStatement ps=conn.prepareStatement("Insert into voters values(?,?,?,?,?,?,?)");
                ps.setString(1,votername);
                ps.setString(2,voteremail);
                ps.setString(3,electionname);
                ps.setString(4,hostname);
                ps.setString(5,voterid);
                ps.setString(6,voterpass);
                ps.setInt(7,0);
                ps.executeUpdate();
                ps.close();
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
            response.sendRedirect("LoadElection?Electionname="+electionname+"&redo=voters");
        }
        else
        {
            if(ServletFileUpload.isMultipartContent(request)){
                try {
                    List<FileItem> multiparts = new ServletFileUpload(
                                             new DiskFileItemFactory()).parseRequest(request);

                    for(FileItem item : multiparts){
                        if(!item.isFormField()){
                            String name = electionname+hostname+"voters";
                            name=name.replaceAll("\\s","");
                            item.write( new File(saveFile+ File.separator + name));
                            ReadFile rf=new ReadFile(saveFile+File.separator+name);
                            al=rf.fileread();
                            Voteremail ve=new Voteremail("Pratik2345","ab23eghKie90",ed.getStartDate(),ed.getStartTime(),ed.getEndDate(),ed.getEndTime(),ed.getElectionname(),ed.getOrganization(),"pratik.asija1234@gmail.com");
                            ve.sendEmail();
                            if(al!=null)
                            {
                                al.remove(0);
                                Connection conn=null;
                                String url="jdbc:mysql://localhost:3306/votingsystem?autoReconnect=true&useSSL=false";
                                try{
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    conn=DriverManager.getConnection(url,"root","root");
                                    PreparedStatement ps=conn.prepareStatement("Insert into voters values(?,?,?,?,?,?,?)");
                                    for(Pair<String,String> pr:al)
                                    {
                                        String votername=pr.getKey();
                                        String voteremail=pr.getValue();
                                        int x=(int) (Math.random()*10000);
                                        String voterid=votername+Integer.toString(x);
                                        voterid=voterid.toLowerCase();
                                        voterid=voterid.replaceAll("\\s","");
                                        String voterpass=calcVoterPass();
                                        ps.setString(1,votername);
                                        ps.setString(2,voteremail);
                                        ps.setString(3,electionname);
                                        ps.setString(4,hostname);
                                        ps.setString(5,voterid);
                                        ps.setString(6,voterpass);
                                        ps.setInt(7,0);
                                        ps.executeUpdate();
                                    }
                                    ps.close();
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
                                response.sendRedirect("LoadElection?Electionname="+electionname+"&redo=voters");
                            }
                            else
                            {
                                error=true;
                                errmsg="";
                                errmsg+="<div class='alert alert-danger alert-dismissible'>";
                                errmsg+="<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                                errmsg+="<p>Wrong File Syntax. Please Try Again.</p>";
                                errmsg+="</div>";
                            }
                        }
                    }

                   //File uploaded successfully
                   request.setAttribute("list",al);
                } catch (Exception ex) {
                    error=true;
                    errmsg="";
                    errmsg+="<div class='alert alert-danger alert-dismissible'>";
                    errmsg+="<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                    errmsg+="<p>File could not be uploaded. Check if it is empty.</p>";
                    errmsg+="</div>";
                    System.out.println("Failed");
                }          

            }
            else
            {
                error=true;
                errmsg="";
                errmsg+="<div class='alert alert-danger alert-dismissible'>";
                errmsg+="<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                errmsg+="<p>Some Error Occured</p>";
                errmsg+="</div>";
            }
            if(error==true)
            {
                request.setAttribute("message",errmsg);
                RequestDispatcher rd=request.getRequestDispatcher("buildElection.jsp?redo=voters");
                rd.forward(request, response);
            }
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
