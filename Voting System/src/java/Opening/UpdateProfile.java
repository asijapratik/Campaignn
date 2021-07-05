/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Opening;

import java.util.Base64;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author KC
 */
@MultipartConfig(maxFileSize = 16177215)
public class UpdateProfile extends HttpServlet {

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
        UserDetails ud=(UserDetails) session.getAttribute("ud");
        String Name=(String) session.getAttribute("Name");
        String email=(String) session.getAttribute("email");
        String hidden=request.getParameter("hiddeninput");
        if(hidden!=null)
        {
            boolean picexists=(boolean) session.getAttribute("picexists");
            String photoexists=request.getParameter("photouploaded");
//            System.out.println(photoexists);
            boolean photexists=photoexists.equals("false")?false:true;
            String gender=request.getParameter("gender");
            if(ud.getGender()!=null&&gender==null)
                gender=ud.getGender();
            String dob=request.getParameter("date");
            if(ud.getDob()!=null&&dob==null)
                dob=ud.getDob();
            if(dob.equals(""))
                dob=null;
            String phoneno=request.getParameter("phno");
            if(phoneno.equals(""))
                phoneno=null;
            String profession=request.getParameter("profession");
            if(profession.equals(null))
                profession=null;
            InputStream inputstream=null;
            Part part=request.getPart("profilephoto");
            if(part!=null)
            {
                inputstream=part.getInputStream();
            }
            if(!photexists&&picexists)
            {
                String profilepic=ud.getProfilepic();
                String imageDataBytes=profilepic.substring(profilepic.indexOf(",")+1);
                inputstream=new ByteArrayInputStream(Base64.getDecoder().decode(imageDataBytes.getBytes()));
            }
            else if(!picexists&&!photexists)
                    inputstream=null;
            Connection conn=null;
            String url="jdbc:mysql://localhost:3306/votingsystem?autoReconnect=true&useSSL=false";
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn=DriverManager.getConnection(url,"root","root");
                String query="Update users set gender=?,dob=?,phone_no=?,profession=?,profile_pic=? where email=?";
                PreparedStatement ps=conn.prepareStatement(query);
                ps.setString(1,gender);
                ps.setString(2,dob);
                ps.setString(3,phoneno);
                ps.setString(4,profession);
                ps.setBlob(5,inputstream);
                ps.setString(6,email);
                int row=ps.executeUpdate();
                ps.close();
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
                    catch(Exception e)
                    {
                       e.printStackTrace();
                    }
                }
            }
        }
        else
        {
            boolean passchange=false;
            Connection conn=null;
            String url="jdbc:mysql://localhost:3306/votingsystem?autoReconnect=true&useSSL=false";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conn=DriverManager.getConnection(url,"root","root");
                Statement st=conn.createStatement();
                String query="Select password from users where email='"+email+"'";
                String oldpass="";
                ResultSet rs=st.executeQuery(query);
                if(rs.next())
                {
                    oldpass=rs.getString(1);
                }
                rs.close();
                String oldpassinput=request.getParameter("oldpassword");
                System.out.println(oldpassinput);
                String newpass=request.getParameter("newpassword");
                if(oldpass.equals(oldpassinput))
                {
                    String query1="Update users set password='"+newpass+"' where email='"+email+"'";
                    st.executeUpdate(query1);
                    passchange=true;
                }
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
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                }
            }
            String passchangeornot="";
            if(passchange)
                passchangeornot="<p class='m-2 p-2 bg-success'>Password Updated Successfully.</p>";
            else
                passchangeornot="<p class='m-2 p-2 bg-warning'>Wrong Password Entered. Password could not be updated.</p>";
            request.setAttribute("passchangeornot",passchangeornot);
            RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");
            rd.forward(request,response);
            return;
        }
        response.sendRedirect("LoadProfile");
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
