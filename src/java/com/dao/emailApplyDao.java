/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.model.emailApplyBean;
import com.util.DBConnection;
import java.sql.*;

/**
 *
 * @author Aaqib Khan
 */
public class emailApplyDao {
public static String emailApply(emailApplyBean emlApply)
{
String pid = emlApply.getPid();
String did = emlApply.getDid();
String ipAddress = emlApply.getLastActvityIP();
String email = emlApply.getEmail();
String status = emlApply.getStatus();
String name = emlApply.getName();
String desig = emlApply.getDesig();
String reqCat = "Email";
Connection con = DBConnection.createConnection();
PreparedStatement ps = null;
String sql = "";
int i = 0;
int j = 0;
    try {
        sql = "insert into empictrequest (pid,name,desig,did,email,applied_date,reqCat,status,lastActvityIP,updated_at) values(?,?,?,?,?,NOW(),?,?,?,NOW())";
        ps = con.prepareStatement(sql);
        ps.setString(1, pid);
        ps.setString(2, name);
        ps.setString(3, desig);
        ps.setString(4, did);
        ps.setString(5, email);
        ps.setString(6, reqCat);
        ps.setString(7, status);
        ps.setString(8, ipAddress);
        i = ps.executeUpdate();
        if(i>0)
        {
            sql = "insert into emplogs values(?,?,?,NOW())";
                        ps = con.prepareStatement(sql);
                        ps.setString(1, pid);
                        ps.setString(2, "19");
                        ps.setString(3, ipAddress);
                        int ii = ps.executeUpdate();
                        if (ii <= 0) {
                            return "failure";
                        }
        return "success";
        }
        ps.close();
        con.close();
    } catch (Exception e) {
        System.out.println(e);
    }
return "";
}
}
