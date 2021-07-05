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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KC
 */
public class forgotpassword extends HttpServlet {

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
        String redo=request.getParameter("redo");
        String email=request.getParameter("email");
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/VotingSystem?autoReconnect=true&useSSL=false";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url,"root","root");
            Statement st=conn.createStatement();
            String query="Select * from users where email='"+email+"'";
            ResultSet rs=st.executeQuery(query);
            if(rs.next())
            {
                //System.out.println("Success");
                String numbers="0123456789";
                String OTP="";
                for(int i=0;i<6;i++)
                {
                    int x=(int)(Math.random()*10);
                    OTP+=numbers.charAt(x);
                }
                OTPsending otp=new OTPsending(email,OTP);
                otp.sendEmail();
                request.setAttribute("generatedOTP",OTP);
                request.setAttribute("email",email);
                RequestDispatcher rd=request.getRequestDispatcher("EnterOTP.jsp?redo="+redo);
                rd.forward(request,response);
            }
            else
            {
                System.out.println("Failiure");
                String message="<p class='text-danger mt-2 mb-2'>You are not a registered user.Please Register First</p>";
                request.setAttribute("message",message);
                RequestDispatcher rd=request.getRequestDispatcher("signup.jsp?redo="+redo);
                rd.forward(request,response);
            }
            rs.close();
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
                catch(Exception ex){
                    ex.printStackTrace();
                }
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
