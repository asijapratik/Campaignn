package Conducting;

import java.io.Serializable;

public class ElectionDetails implements Serializable {
    String hostname;
    String Organization;
    String OrganizationURL;
    String Electionname;
    String startDate;
    String endDate;
    String startTime;
    String endTime;
    String positions;
    String description;
    String result;
    boolean pre;
    boolean live;
    boolean conducted;
    
    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

    public String getOrganization() {
        return Organization;
    }

    public void setOrganization(String Organization) {
        this.Organization = Organization;
    }

    public String getOrganizationURL() {
        return OrganizationURL;
    }

    public void setOrganizationURL(String OrganizationURL) {
        this.OrganizationURL = OrganizationURL;
    }

    public String getElectionname() {
        return Electionname;
    }

    public void setElectionname(String Electionname) {
        this.Electionname = Electionname;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getPositions() {
        return positions;
    }

    public void setPositions(String positions) {
        this.positions = positions;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public boolean isLive() {
        return live;
    }

    public void setLive(boolean live) {
        this.live = live;
    }
    public boolean isConducted(){
        return conducted;
    }
    public void setConducted(boolean conducted){
        this.conducted=conducted;
    }
    public boolean isPre(){
        return pre;
    }
    public void setPre(boolean pre){
        this.pre=pre;
    }
}
