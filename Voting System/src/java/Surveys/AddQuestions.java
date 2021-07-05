
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

public class AddQuestions extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           java.sql.Connection con=(java.sql.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/votingsystem?useSSL=false&allowPublicKeyRetrieval=true","root","root");
           String title=request.getParameter("Title");
           String Count=request.getParameter("Ques");
           int count=Integer.parseInt(Count);
           for (int i=1;i<=count;i++)
            {
                String question=request.getParameter("textarea"+i);
                String anstype=request.getParameter("optiontype"+i);
                String st1="Single";
                String st2="Multiple";
                int ocount=0;
                String options="";
                if (anstype.equals(st1) || anstype.equals(st2))
                {
                    ocount=Integer.parseInt(request.getParameter("noofoptions"+i));
                    
                    for (int j=1;j<=ocount;j++)
                    {
                        if(j==ocount)
                        {
                            options+=request.getParameter("option"+i+"_"+j);
                        }
                        else{
                            options+=request.getParameter("option"+i+"_"+j);
                            options+=",";
                        }
                    }
                }
                
                Statement stm=con.createStatement();
                
                String s="insert into questiondetails(Title,QuestionCount,Question,AnswerType,OptionCount,Options) Values('"+title+"','"+count+"','"+question+"','"+anstype+"','"+ocount+"','"+options+"')";
                
                stm.executeUpdate(s);
                //rs.close();
                stm.close();
            }
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
