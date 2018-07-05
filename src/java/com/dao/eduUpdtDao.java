/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.qualifAddBean;
import com.util.DBConnection;
import java.sql.*;

/**
 *
 * @author Aaqib Khan
 */
public class eduUpdtDao {

    public static String eduUpdt(qualifAddBean qualifAdd) {
        Connection con = DBConnection.createConnection();
        String pid = qualifAdd.getPid();
        String ipAddress = qualifAdd.getIpAddress();
        String course = qualifAdd.getCourse();
        String subj = qualifAdd.getSubj();
        String division = qualifAdd.getDivision();
        String percent = qualifAdd.getPercent();
        String univ = qualifAdd.getUniv();
        String passout = qualifAdd.getPassout();
        String id = qualifAdd.getId();
        PreparedStatement ps = null;
        int i = 0;
        int j = 0;
        String sql = "";
        String sql2 = "";
        sql = "update empQualif set course=?,subjects=?,division=?,percent=?,board=?,passoutYr=?,ipAddress=?,updated_at=NOW() where qualif_id=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,course);
            ps.setString(2,subj);
            ps.setString(3,division);
            ps.setString(4,percent);
            ps.setString(5,univ);
            ps.setString(6,passout);
            ps.setString(7,ipAddress);
            ps.setString(8,id);
            i = ps.executeUpdate();
            if(i>0)
            {
                sql2 = "insert into emplogs values(?,?,?,NOW())";
                        ps = con.prepareStatement(sql2);
                        ps.setString(1, pid);
                        ps.setString(2, "16");
                        ps.setString(3, ipAddress);
                        int ii = ps.executeUpdate();
                        if (ii <= 0) {
                            return "failure";
                        }
                        
                    ps.close();
                    con.close();
            return "success";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return "";
    }
}
