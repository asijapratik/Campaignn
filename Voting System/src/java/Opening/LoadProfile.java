package Opening;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import javafx.util.Pair;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoadProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ArrayList<Pair<String,String>> c=new ArrayList<>();
        ArrayList<Pair<String,String>> p=new ArrayList<>();
        ArrayList<Pair<String,String>> v=new ArrayList<>();
        ArrayList<String> sc=new ArrayList<>();
        ArrayList<String> sf=new ArrayList<>();
        UserDetails ud=new UserDetails();
        HttpSession session=request.getSession();
        String name=(String) session.getAttribute("Name");
        String firstname=name.split(" ")[0];
        String lastname=name.split(" ")[1];
        String email=(String) session.getAttribute("email");
        boolean picexists=false;
        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/votingsystem?autoReconnect=true&useSSL=false";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url,"root","root");
            Statement st=conn.createStatement();
            String query="Select * from users where firstname='"+firstname+"' and lastname='"+lastname+"' and email='"+email+"'";
            ResultSet rs=st.executeQuery(query);
            if(rs.next())
            {
//                System.out.println(rs.getString("gender")+"");
                String gender=rs.getString("gender");
                String dob=rs.getString("dob");
                String profession=rs.getString("profession");
                String phoneno=rs.getString("phone_no");
                ud.setDob(dob);
                ud.setGender(gender);
                ud.setPhoneno(phoneno);
                ud.setProfession(profession);
                Blob blob=rs.getBlob("profile_pic");
                if(blob!=null)
                {
                    picexists=true;
                    InputStream inputstream = blob.getBinaryStream();
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
                    ud.setProfilepic(base64Image);
                }
                //System.out.println(gender+" "+dob+" "+profession+" "+phoneno+" "+picexists);
            }
            rs.close();
            String query2="Select Name,Org from elections where host_name='"+name+"'";
            ResultSet rs2=st.executeQuery(query2);
            while(rs2.next())
            {
                c.add(new Pair(rs2.getString(1),rs2.getString(2)));
            }
            rs2.close();
            String query3="Select Name,Org from elections inner join party on party.election_name=elections.Name and party.host_name=elections.host_name where party.firstname='"+firstname+"' and party.lastname='"+lastname+"'";
            ResultSet rs3=st.executeQuery(query3);
            while(rs3.next())
            {
                p.add(new Pair(rs3.getString(1),rs3.getString(2)));
            }
            rs3.close();
            String query4="Select Elections.Name,Elections.Org from elections inner join voters on voters.election_name=elections.Name and voters.host_name=elections.host_name where voters.name='"+name+"' and voted=1";
            ResultSet rs4=st.executeQuery(query4);
            while(rs4.next())
            {
                v.add(new Pair(rs4.getString(1),rs4.getString(2)));
            }
            rs4.close();
            String query5="Select Title from surveydetails where login_id='"+name+"'";
            ResultSet rs5=st.executeQuery(query5);
            while(rs5.next())
            {
                sc.add(rs5.getString(1));
            }
            rs5.close();
            String query6="Select Title from responses where login_id='"+name+"'";
            ResultSet rs6=st.executeQuery(query6);
            while(rs6.next())
            {
                sf.add(rs6.getString(1));
            }
            rs6.close();
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
                catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        session.setAttribute("ud", ud);
        session.setAttribute("picexists",picexists);
        request.setAttribute("c",c);
        request.setAttribute("p",p);
        request.setAttribute("v",v);
        request.setAttribute("sc",sc);
        request.setAttribute("sf",sf);
        RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");
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
