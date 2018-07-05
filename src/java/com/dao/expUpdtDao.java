/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.empExpBean;
import com.util.DBConnection;
import java.sql.*;

/**
 *
 * @author CC-005
 */
public class expUpdtDao {

    public static String empExpUpdt(empExpBean expUpdt) {
        String id = expUpdt.getId();
        String org = expUpdt.getOrg();
        String desig = expUpdt.getDesig();
        String from = expUpdt.getFrom();
        String to = expUpdt.getTo();
        String wrkDesc = expUpdt.getWrkDesc();
        String ipAddr = expUpdt.getIpAddress();
        String pid = expUpdt.getPid();

        String sql = "update empexp1 set org=?,desig=?,desigFrm=?,desigTo=?,workDesc=?,updtIP=?,updated_at=NOW() where expid=?";
        Connection con = DBConnection.createConnection();
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, org);
            ps.setString(2, desig);
            ps.setString(3, from);
            ps.setString(4, to);
            ps.setString(5, wrkDesc);
            ps.setString(6, ipAddr);
            ps.setString(7, id);
            
            int i =ps.executeUpdate();
            ps.close();
                    if(i>0)
                    {
                    String sql1 = "insert into emplogs values(?,?,?,NOW())";
            ps1 = con.prepareStatement(sql1);
            ps1.setString(1, pid);
            ps1.setString(2, "13");
            ps1.setString(3, ipAddr);
            int ii = ps1.executeUpdate();
            if (ii <= 0) {
                
                return "logFailure";
            }
            ps1.close();
            con.close();
                    return "success";
                    }
                    else
                    {
                    return "failure";
                    }
                    
        } catch (Exception e) {
            String ex = e.toString();
            return ex;
        }
    }


    }
    
