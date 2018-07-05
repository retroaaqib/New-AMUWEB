/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.model.resetPassBean;
import com.util.DBConnection;
import java.sql.*;
/**
 *
 * @author CC-005
 */
public class resetPassDao {
public static String rstPass(resetPassBean resetPass)
{
String pid = resetPass.getPid();
String ipAddress = resetPass.getIpAddress();
String password = resetPass.getPassword();
String sql = "";
Connection con = DBConnection.createConnection();
PreparedStatement ps = null;
int i = 0;
int j = 0;
    try {
        sql = "update emplogin set passwd=?, updtIp=? where pid=?";
        ps = con.prepareStatement(sql);
        ps.setString(1,password);
        ps.setString(2,ipAddress);
        ps.setString(3,pid);
        i = ps.executeUpdate();
        if(i>0)
        {
        sql = "insert into emplogs values(?,?,?,NOW())";
                        ps = con.prepareStatement(sql);
                        ps.setString(1, pid);
                        ps.setString(2, "20");
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
