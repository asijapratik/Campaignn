/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Opening;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
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
public class SignUpServlet extends HttpServlet {

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
        Map<String,String> info=new HashMap<String,String>();
        request.setAttribute("Info",info);
        String firstname=request.getParameter("firstname");
        String lastname=request.getParameter("lastname");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/VotingSystem?autoReconnect=true&useSSL=false","root","root");
            Statement st=c.createStatement();
            String check="Select count(1) from users where email='"+email+"'";
            ResultSet rs=st.executeQuery(check);
            rs.next();
            int count=rs.getInt(1);
            System.out.println(count);
            if(count==0)
            {
                String query="insert into users (firstname,lastname,email,password) values('"+firstname+"','"+lastname+"','"+email+"','"+password+"');";
                st.executeUpdate(query);
                info.put("success","Succesfully Registered! You can login now");
            }
            else
            {
                info.put("error","Email Already Registered.Please Login Here.");
            }
            rs.close();
            st.close();
            c.close();
        }
        catch(Exception e){
            System.out.println(e);
        }
//        if(email.equals("a@b.com"))
//        {
//            info.put("error","Email Already Registered.Please Login Here.");
//        }
//        else{
//            info.put("success","Succesfully Registered! You can login now");
//        }
        String redo=request.getParameter("redo");
        RequestDispatcher rd=request.getRequestDispatcher("login.jsp?redo="+redo);
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
