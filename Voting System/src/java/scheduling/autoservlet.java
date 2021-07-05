package scheduling;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.BasicConfigurator;
import org.quartz.DateBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

@WebListener
public class autoservlet extends HttpServlet implements ServletContextListener{

    private Scheduler scheduler;
    private StdSchedulerFactory factory;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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

    @Override
    public void contextInitialized(ServletContextEvent sce) {
//        BasicConfigurator.configure();
//        try {
//            factory = new StdSchedulerFactory();
//            scheduler =factory.getScheduler();
//            scheduler.start();
//            JobDataMap data = new JobDataMap();
//            data.put("example", "Hello World job running");
//            JobDetail jobDetail = JobBuilder.newJob(ElectionsJob.class).usingJobData(data).withIdentity("ElectionsJob", "group1").build();
//            Trigger trigger = TriggerBuilder.newTrigger().withIdentity("myTrigger", "group1")
//            .startNow()
//            .withSchedule(SimpleScheduleBuilder.simpleSchedule ()
//            .repeatForever()
//            .withIntervalInHours(24))
//            .build();
//            scheduler.scheduleJob(jobDetail, trigger);
//        } 
//        catch (SchedulerException e) {
//            e.printStackTrace();
//        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
//        try {
//            scheduler.shutdown();
//        } catch (SchedulerException ex) {
//            Logger.getLogger(autoservlet.class.getName()).log(Level.SEVERE, null, ex);
//        }   
    }

}
