/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.empkpBean;
import com.util.DBConnection;
import java.sql.*;

/**
 *
 * @author Aaqib Khan
 */
public class imgUploadDao {

    public static String imageUpld(empkpBean imgUpload) {
        String pid = imgUpload.getPid();
        String ipAddress = imgUpload.getIpAddress();
        Connection con = DBConnection.createConnection();
        PreparedStatement ps = null;
        String sql = "";
        int i = 0;
        int j = 0;
        try {
            sql = "insert into empphoto values(?,?,NOW())";
            ps = con.prepareStatement(sql);
            ps.setString(1, pid);
            ps.setString(2, ipAddress);
            i = ps.executeUpdate();
            ps.close();
            if (i > 0) {
                sql = "insert into emplogs values(?,?,?,NOW())";
                ps = con.prepareStatement(sql);
                ps.setString(1, pid);
                ps.setString(2, "18");
                ps.setString(3, ipAddress);
                int ii = ps.executeUpdate();
                if (ii <= 0) {
                    return "failure";
                }
                return "success";

            }
            con.close();
        } catch (Exception e) {
        }
        return "";
    }

}
