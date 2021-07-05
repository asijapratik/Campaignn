package Opening;

import java.io.Serializable;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class OTPsending implements Serializable{
    
    String toemail;
    String OTP;
    String message="Your One Time Authentication Password is as shown below. Do Not share this OTP with anyone.\n";    
    String fromemail="campaignn3@gmail.com";
    String pass="Campaignner@3";
    String subject="Campaignn Verification: OTP Authentication";
    public OTPsending(String toemail,String OTP) {
        this.toemail=toemail;
        this.OTP=OTP;
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
        message+="<h2>"+OTP+"</h2>";
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
