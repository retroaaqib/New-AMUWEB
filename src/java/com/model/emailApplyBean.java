/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author Aaqib Khan
 */
public class emailApplyBean {
    private String pid = "";
    private String ipAddress = "";
    private String email = "";
    private String did = "";
    private String applied_date = "";
    private String issuedordeclined_date = "";
    private String reqCat = "";
    private String verified_date = "";
    private String status = "";
    private String issued_email = "";
    private String decline_reason = "";
    private String lastActvityIP = "";
    private String updated_at = "";
    private String desig = "";

    public String getDesig() {
        return desig;
    }

    public void setDesig(String desig) {
        this.desig = desig;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    private String name = "";

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDid() {
        return did;
    }

    public void setDid(String did) {
        this.did = did;
    }

    public String getApplied_date() {
        return applied_date;
    }

    public void setApplied_date(String applied_date) {
        this.applied_date = applied_date;
    }

    public String getIssuedordeclined_date() {
        return issuedordeclined_date;
    }

    public void setIssuedordeclined_date(String issuedordeclined_date) {
        this.issuedordeclined_date = issuedordeclined_date;
    }

    public String getReqCat() {
        return reqCat;
    }

    public void setReqCat(String reqCat) {
        this.reqCat = reqCat;
    }

    public String getVerified_date() {
        return verified_date;
    }

    public void setVerified_date(String verified_date) {
        this.verified_date = verified_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIssued_email() {
        return issued_email;
    }

    public void setIssued_email(String issued_email) {
        this.issued_email = issued_email;
    }

    public String getDecline_reason() {
        return decline_reason;
    }

    public void setDecline_reason(String decline_reason) {
        this.decline_reason = decline_reason;
    }

    public String getLastActvityIP() {
        return lastActvityIP;
    }

    public void setLastActvityIP(String lastActvityIP) {
        this.lastActvityIP = lastActvityIP;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }
}
