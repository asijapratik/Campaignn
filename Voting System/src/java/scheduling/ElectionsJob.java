package scheduling;

import Conducting.ElectionDetails;
import Conducting.VoterDetails;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar.Builder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;
import org.quartz.DateBuilder;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.core.jmx.JobDetailSupport;
import org.quartz.impl.StdSchedulerFactory;

public class ElectionsJob implements Job {

    @Override
    public void execute(JobExecutionContext jec) throws JobExecutionException {
        StdSchedulerFactory ssf=new StdSchedulerFactory();
        Scheduler scheduler = null;
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date today=new Date();
        String currdate=df.format(today);
        Connection conn=null;
        HashMap<ElectionDetails,ArrayList<Pair<VoterDetails,String>>> electionemails=new HashMap<>();
        String url="jdbc:mysql://localhost:3306/votingsystem?autoReconnect=true&useSSL=false";
        try{
            scheduler = ssf.getScheduler();
            scheduler.start();
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url,"root","root");
            Statement st=conn.createStatement();
            Statement st1=conn.createStatement();
            String query="Select * from elections";
            ResultSet rs=st.executeQuery(query);
            while(rs.next())
            {
                ElectionDetails ed=new ElectionDetails();
                String sdate=rs.getString(5);
                ed.setStartDate(sdate);
                String stime=rs.getString(7);
                ed.setStartTime(stime);
                String electionname=rs.getString(4);
                ed.setElectionname(electionname);
                String hostname=rs.getString(1);
                ed.setHostname(hostname);
                String edate=rs.getString(6);
                ed.setEndDate(edate);
                String etime=rs.getString(8);
                ed.setEndTime(etime);
                String organization = rs.getString(2);
                ed.setOrganization(organization);
                if(sdate.equals(currdate.split(" ")[0]))
                {
                    System.out.println("Hello");
                    String query1="Select * from voters where election_name='"+electionname+"' and host_name='"+hostname+"'";
                    ResultSet rs1=st1.executeQuery(query1);
                    ArrayList<Pair<VoterDetails,String>> emails=new ArrayList<>();
                    while(rs1.next())
                    {                        
                        VoterDetails vd=new VoterDetails();
                        String email=rs1.getString(2);
                        vd.setEmail(email);
                        String voterid=rs1.getString(5);
                        vd.setVoterId(voterid);
                        String voterpass=rs1.getString(6);
                        Pair<VoterDetails,String> pr=new Pair<>(vd,voterpass);
                        emails.add(pr);
                    }
                    electionemails.put(ed,emails);
                    rs1.close();
                }
            }
            System.out.println("Hello"+electionemails.size());
            rs.close();
            st1.close();
            st.close();
            
            int n=electionemails.size();
            JobDataMap[] dataMaps=new JobDataMap[n];
            Trigger[] triggers=new Trigger[n];
            int i=0;
            for(Map.Entry<ElectionDetails,ArrayList<Pair<VoterDetails,String>>> mp : electionemails.entrySet())
            {
                ElectionDetails ed=mp.getKey();
                int h=Integer.parseInt(ed.getStartTime().split(":")[0]);
                int m=Integer.parseInt(ed.getStartTime().split(":")[1]);
                int s=0;
                dataMaps[i]=new JobDataMap();
                dataMaps[i].put("emails",mp.getValue());
                dataMaps[i].put("electiondetails", mp.getKey());
                JobDetail jobDetail = JobBuilder.newJob(emailsendingjob.class).usingJobData(dataMaps[i]).withIdentity("emailsendingjob", "group"+i).build();
                triggers[i]=TriggerBuilder.newTrigger().withIdentity("myTrigger"+i,"group"+i)
                .startAt(DateBuilder.todayAt(h,m,s))
                .withSchedule(SimpleScheduleBuilder.simpleSchedule()
                .withRepeatCount(0)
                .withIntervalInMinutes(10))
                .build();
                scheduler.scheduleJob(jobDetail, triggers[i]);
                i++;
            }
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
    
}
