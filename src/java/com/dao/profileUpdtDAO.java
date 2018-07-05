/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.profileUpdtBean;
import com.util.DBConnection;
import java.sql.*;

/**
 *
 * @author CC-005
 */
public class profileUpdtDAO {

    public static String updtProfile(profileUpdtBean profileBean) {
        String pid = profileBean.getPid();
        String name = profileBean.getName();
        String desig = profileBean.getDesig();
        String father = profileBean.getFather();
        String mother = profileBean.getMother();
        String birthPlace = profileBean.getBirthPlace();
        String marital = profileBean.getMarital();
        String nationality = profileBean.getNationality();
        String dob = profileBean.getDob();
        String address = profileBean.getAddress();
        String emailPri = profileBean.getEmailPri();
        String emailSec = profileBean.getEmailSec();
        String mobilePri = profileBean.getMobilePri();
        String mobileSec = profileBean.getMobileSec();
        String telephone = profileBean.getTelephone();
        String thrust = profileBean.getThrust();
        String profile = profileBean.getProfile();
        String emContact = profileBean.getEmContact();
        String emContactName = profileBean.getEmContactName();
        String emContactMob = profileBean.getEmContactMob();
        String emContactAddress = profileBean.getEmContactAddress();
        String empcat = profileBean.getEmpcat();
        String gScholarID = profileBean.getgScholarID();
        String ipAddress = profileBean.getIpAddress();
        try
        {
        Connection con = DBConnection.createConnection();
        String sql = "update empprofile1 set fathername=?,mothername=?,birthPlace=?,maritalsts=?,nationality=?,dob=?,address=?,emailPri=?,emailSec=?,mobilePri=?,mobileSec=?,telephone=?,thrust=?,"
                + "profile=?,emContact=?,emContactName=?,emContactMob=?,emContactAddress=?,googlScholarID=?,ipUpdt=?,updated_at=NOW()";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, father);
        ps.setString(2, mother);
        ps.setString(3, birthPlace);
        ps.setString(4, marital);
        ps.setString(5, nationality);
        ps.setString(6, dob);
        ps.setString(7, address);
        ps.setString(8, emailPri);
        ps.setString(9, emailSec);
        ps.setString(10, mobilePri);
        ps.setString(11, mobileSec);
        ps.setString(12, telephone);
        ps.setString(13, thrust);
        ps.setString(14, profile);
        ps.setString(15, emContact);
        ps.setString(16, emContactName);
        ps.setString(17, emContactMob);
        ps.setString(18, emContactAddress);
        ps.setString(19, gScholarID);
        ps.setString(20, ipAddress);
        
        int i = ps.executeUpdate();
        if(i>0)
        {
        String sql1 = "insert into emplogs values(?,?,?,NOW())";
            ps = con.prepareStatement(sql1);
            ps.setString(1, pid);
            ps.setString(2, "11");
            ps.setString(3, ipAddress);
            int ii = ps.executeUpdate();
            if (ii <= 0) {
                return "failure";
            }   
        return "success";
        }
        else
        {
        return "failure";
        }
        }
        catch(Exception e)
                {
                    return e.toString();
                }
    }

}
