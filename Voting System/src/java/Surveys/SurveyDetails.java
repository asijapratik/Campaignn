/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Surveys;

//import java.beans.Statement;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Date;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Arora computers
 */
public class SurveyDetails extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        String titles=request.getParameter("title");
        
        String startdate = request.getParameter("startdate");
        HttpSession session =request.getSession();
        String login_id=(String) session.getAttribute("Name");
        
        
       String enddate = request.getParameter("enddate"); 
        
       String ques=request.getParameter("questions");
        
       
        String details=request.getParameter("detail");
        request.setAttribute("title",titles );
        request.setAttribute("ques",ques);
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/votingsystem?useSSL=false&allowPublicKeyRetrieval=true","root","root");
            Statement stm=con.createStatement();
            //String s="select * from temp";
            //ResultSet rs=stm.executeQuery(s);
            //String url=rs.getString("url");
            String s="insert into surveydetails(Title,StartDate,EndDate,Questions,Details,login_id) Values('"+titles+"','"+startdate+"','"+enddate+"','"+ques+"','"+details+"','"+login_id+"')";
            stm.executeUpdate(s);
            //rs.close();
            stm.close();
            con.close();
            
         }
         catch(Exception e){
             e.printStackTrace();             
         }
        RequestDispatcher rd=request.getRequestDispatcher("addquestions.jsp");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(SurveyDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(SurveyDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
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
