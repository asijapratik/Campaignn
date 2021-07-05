package scheduling;

import Conducting.ElectionDetails;
import Conducting.VoterDetails;
import java.util.ArrayList;
import java.util.Properties;
import javafx.util.Pair;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class emailsendingjob implements Job{

    ElectionDetails ed;
    
    public void sendEmail(String toemail,String voterId,String voterPass,String startdate,String enddate,String starttime,String endtime,String electionname,String Organization){
        String message="You have been registered to vote in ";    
        String fromemail="campaignn3@gmail.com";
        String pass="Campaignner@3";
        String subject="Campaignn Voter Registration: ";
        
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
    @Override
    public void execute(JobExecutionContext jec) throws JobExecutionException {
        JobDetail jb=jec.getJobDetail();
        ArrayList<Pair<VoterDetails,String>> emails=(ArrayList<Pair<VoterDetails, String>>)jb.getJobDataMap().get("emails");
        ElectionDetails ed=(ElectionDetails)jb.getJobDataMap().get("electiondetails");
        System.out.println(emails.size());
        System.out.println(ed.getElectionname());
        int n=emails.size();
        for(int i=0;i<n;i++)
        {
            VoterDetails vd=emails.get(i).getKey();
            String voterId=vd.getVoterId();
            String toemail=vd.getEmail();
            String voterpass=emails.get(i).getValue();
            sendEmail(toemail, voterId, voterpass, ed.getStartDate(),ed.getEndDate(),ed.getStartTime(),ed.getEndTime(),ed.getElectionname(),ed.getOrganization());
        }
    }
}
