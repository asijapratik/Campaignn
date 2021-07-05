package Surveys;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FilledSurvey extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection con=(java.sql.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/votingsystem?useSSL=false&allowPublicKeyRetrieval=true","root","root");
            String Title=request.getParameter("Title");
            PrintWriter pw=response.getWriter();
            HttpSession session= request.getSession();
            String login_id=(String) session.getAttribute("Name");
            int count=Integer.parseInt(request.getParameter("count"));
            System.out.println(count);
            String answers="";
            for (int i=1;i<=count;i++)
            {
                String s="";
                String []v=request.getParameterValues(String.valueOf(i));
                if (v.length==1)
                {
                    s+=v[0];
                    
                }
                else
                {
                    for (int a=0;a<v.length;a++)
                    {
                        s+=v[a];
                        if (a<v.length-1)
                            s+="#";
                        
                    }
                }
                if (i<count)
                        s+="%";
                answers+=s;
            }
            System.out.println(answers);
            Statement stm=con.createStatement();
                
                String s="insert into responses(login_id,Title,Answers,Count) Values('"+login_id+"','"+Title+"','"+answers+"','"+count+"')";
                
                stm.executeUpdate(s);
                //rs.close();
                stm.close();
            
            con.close();
        }
        catch(Exception e){
             e.printStackTrace();
             
         }
        response.sendRedirect("thanks.jsp");
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
