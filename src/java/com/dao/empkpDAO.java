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
 * @author CC-005
 */
public class empkpDAO {

    public static String empkp(empkpBean empkp) {
        String content = empkp.getContent();
        String pid = empkp.getPid();
        String ipAddress = empkp.getIpAddress();
        Connection con = DBConnection.createConnection();
        try {
            String sql = "select * from empkp where pid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pid);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) {
                sql = "insert into empkp (pid,keyPub,ipAddress,updated_at) values (?,?,?,NOW())";
                PreparedStatement ps1 = con.prepareStatement(sql);
                ps1.setString(1, pid);
                ps1.setString(2, content);
                ps1.setString(3, ipAddress);
                int kk = ps1.executeUpdate();
                String sqll = "insert into emplogs values(?,?,?,NOW())";
            ps = con.prepareStatement(sqll);
            ps.setString(1, pid);
            ps.setString(2, "10");
            ps.setString(3, ipAddress);
            int ii = ps.executeUpdate();
            if (ii <= 0) {
                return "failure";
            }
            ps.close();
                if (kk > 0) {
                    return "success";
                }
                ps1.close();
                ps.close();
                
            } else {
                rs.beforeFirst();
                sql = "update empkp set keyPub=?,ipAddress=?,updated_at=NOW() where pid=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, content);
                ps.setString(2, ipAddress);
                ps.setString(3, pid);
                int jj = ps.executeUpdate();
                ps.close();
                String sql1 = "insert into emplogs values(?,?,?,NOW())";
            ps = con.prepareStatement(sql1);
            ps.setString(1, pid);
            ps.setString(2, "10");
            ps.setString(3, ipAddress);
            int ii = ps.executeUpdate();
            if (ii <= 0) {
                return "failure";
            }
                if (jj > 0) {
                    return "success";
                }
                
            }
            ps.close();
            con.close();

            

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Some thing Went Wrong!";
    }
}
