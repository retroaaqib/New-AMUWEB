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
 * @author CC-005
 */
public class qualifAddDao {

    public static String qualifAdd(qualifAddBean qualAdd) {
        Connection con = DBConnection.createConnection();
        String pid = qualAdd.getPid();
        String ipAddress = qualAdd.getIpAddress();
        String lvl = qualAdd.getLvl();
        String course = qualAdd.getCourse();
        String subj = qualAdd.getSubj();
        String division = qualAdd.getDivision();
        String percent = qualAdd.getPercent();
        String univ = qualAdd.getUniv();
        String passout = qualAdd.getPassout();
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        ResultSet rs = null;
        int i = 0;
        int j = 0;
        String sql = "";
        String sql2 = "";

        sql = "select * from empQualif where pid = ? and eduLevel =?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, pid);
            ps.setString(2, lvl);
            rs = ps.executeQuery();
            if (rs.next()) {
                return "duplicate";
            } else {
                rs.beforeFirst();
                sql = "insert into empQualif (pid,eduLevel,course,subjects,division,percent,board,passoutYr,ipAddress,updated_at) values(?,?,?,?,?,?,?,?,?,NOW())";
                try {
                    ps1 = con.prepareStatement(sql);
                    ps1.setString(1, pid);
                    ps1.setString(2, lvl);
                    ps1.setString(3, course);
                    ps1.setString(4, subj);
                    ps1.setString(5, division);
                    ps1.setString(6, percent);
                    ps1.setString(7, univ);
                    ps1.setString(8, passout);
                    ps1.setString(9, ipAddress);
                    i = ps1.executeUpdate();
                    ps1.close();
                    if (i > 0) {
                        sql2 = "insert into emplogs values(?,?,?,NOW())";
                        ps1 = con.prepareStatement(sql2);
                        ps1.setString(1, pid);
                        ps1.setString(2, "15");
                        ps1.setString(3, ipAddress);
                        int ii = ps1.executeUpdate();
                        if (ii <= 0) {
                            return "failure";
                        }
                        return "success";
                    }
                } catch (Exception e) {
                    System.out.println(e);
                    ps1.close();
                    rs.close();
                    ps.close();
                    con.close();
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return "";
    }
}
