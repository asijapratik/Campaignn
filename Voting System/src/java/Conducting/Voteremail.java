package Conducting;

import java.io.Serializable;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Voteremail implements Serializable{
    
    String toemail;
    String voterId;
    String voterPass;
    String electionname;
    String Organization;
    String startdate;
    String starttime;
    String enddate;
    String endtime;
    String message="You have been registered to vote in ";    
    String fromemail="campaignn3@gmail.com";
    String pass="Campaignner@3";
    String subject="Campaignn Voter Registration: ";
    
    public Voteremail(String voterId,String voterPass,String startdate,String starttime,String enddate,String endtime,String electionname,String organization,String toemail)
    {
        this.voterId=voterId;
        this.voterPass=voterPass;
        this.electionname=electionname;
        this.Organization=organization;
        this.toemail=toemail;
        this.startdate=startdate;
        this.starttime=starttime;
        this.enddate=enddate;
        this.endtime=endtime;
    }
    
    public void sendEmail(){
        String host="smtp.gmail.com";
        
        //get properties
        Properties properties=System.getProperties();
        System.out.println("PROPERTIES"+properties);
        
        //set host
        properties.put("mail.smtp.host",host);
        //set port
        properties.put("mail.smtp.port","465");
        //ssl Enable
        properties.put("mail.smtp.ssl.enable","true");
        //auth enable
        properties.put("mail.smtp.auth","true");
        
        Session session=Session.getInstance(properties,new Authenticator(){
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromemail,pass);
            }
        });
        session.setDebug(true);
        subject+=electionname;
        message+=electionname+" at "+Organization+"<br><strong>Voter Id :</strong> "+voterId+"<br><strong>Voter Pass :</strong> "+voterPass;
        message+="<br><br> Election starts <strong>"+startdate+" "+starttime+"</strong> and will be live until <strong>"+enddate+" "+endtime+"</strong>";
        message+="<br>Please Do not share this with anyone.";
        MimeMessage otpmessage=new MimeMessage(session);
        try{
            otpmessage.setFrom(new InternetAddress(fromemail));
            otpmessage.setRecipient(Message.RecipientType.TO,new InternetAddress(toemail));
            otpmessage.setSubject(subject);
            otpmessage.setContent(message,"text/html");
            Transport.send(otpmessage);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
