package Conducting;

import java.io.Serializable;


public class PartyDetails implements Serializable{
    String partylogo;
    String partyname;
    String partyowner;
    String candidates;
    String address;
    boolean verified;
    
    public String getPartylogo() {
        return partylogo;
    }

    public void setPartylogo(String partylogo) {
        this.partylogo = partylogo;
    }

    public String getPartyname() {
        return partyname;
    }

    public void setPartyname(String partyname) {
        this.partyname = partyname;
    }

    public String getPartyowner() {
        return partyowner;
    }

    public void setPartyowner(String partyowner) {
        this.partyowner = partyowner;
    }

    public String getCandidates() {
        return candidates;
    }

    public void setCandidates(String candidates) {
        this.candidates = candidates;
    }
    
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public boolean isVerified() {
        return verified;
    }

    public void setVerified(boolean verified) {
        this.verified = verified;
    }    
}
