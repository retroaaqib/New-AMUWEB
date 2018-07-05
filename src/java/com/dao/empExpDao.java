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
public class empExpDao {
    public static String expUpdt(empExpBean empExp)
    {
    String desig = empExp.getDesig();
    String from = empExp.getFrom();
    String to = empExp.getTo();
    String wrkDesc = empExp.getWrkDesc();
    String current = empExp.getCurrent();
    String ipAddr = empExp.getIpAddress();
    String pid = empExp.getPid();
    String org = empExp.getOrg();
    String sql ="";
    Connection con = DBConnection.createConnection();
    PreparedStatement ps = null;
    PreparedStatement ps1 = null;
    ResultSet rs = null;
    
    if(current.equals("1"))
    {
        try
    {
    sql = "select * from empexp1 where pid=? and currentDesig=1";
    ps = con.prepareStatement(sql);
    ps.setString(1, pid);
    rs = ps.executeQuery();
    if(!rs.next())
    {
        System.out.println("Hello World");
        try
        {
    String sql2 = "insert into empexp1 (pid,org,desig,desigFrm,desigTo,workDesc,currentDesig,updtIP,updated_at) values(?,?,?,?,?,?,?,?,NOW())";
    ps1 =con.prepareStatement(sql2);
    ps1.setString(1, pid);
    ps1.setString(2, org);
    ps1.setString(3, desig);
    ps1.setString(4, from);
    ps1.setString(5, to);
    ps1.setString(6, wrkDesc);
    ps1.setString(7, current);
    ps1.setString(8, ipAddr);
    int i = ps1.executeUpdate();
    ps1.close();
    if(i>0)
    {
    String sql1 = "insert into emplogs values(?,?,?,NOW())";
            ps1 = con.prepareStatement(sql1);
            ps1.setString(1, pid);
            ps1.setString(2, "12");
            ps1.setString(3, ipAddr);
            int ii = ps1.executeUpdate();
            if (ii <= 0) {
                
                return "logFailure";
            }
            
    return "success";
    }
    else
    {
        System.out.println("Hello");
    return "failure";
    }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
    else
    {
    rs.beforeFirst();
    return "duplicate";
    }
    }
        catch (SQLException e)
    {
    String ex = e.toString();
    return ex;
    }
    }
    else
    {
        try
        {
    String sql2 = "insert into empexp1 (pid,org,desig,desigFrm,desigTo,workDesc,currentDesig,updtIP,updated_at) values(?,?,?,?,?,?,?,?,NOW())";
    ps1 =con.prepareStatement(sql2);
    ps1.setString(1, pid);
    ps1.setString(2, org);
    ps1.setString(3, desig);
    ps1.setString(4, from);
    ps1.setString(5, to);
    ps1.setString(6, wrkDesc);
    ps1.setString(7, "0");
    ps1.setString(8, ipAddr);
    int i = ps1.executeUpdate();
    ps1.close();
    if(i>0)
    {
      String sql1 = "insert into emplogs values(?,?,?,NOW())";
            ps1 = con.prepareStatement(sql1);
            ps1.setString(1, pid);
            ps1.setString(2, "12");
            ps1.setString(3, ipAddr);
            int ii = ps1.executeUpdate();
            if (ii <= 0) {
                
                return "logFailure";
            }  
    return "success";
    }
        }
        catch(Exception e)
        {
        String ex = e.toString();
        return ex;
        }
    }
    
    return "";
        
    }
}
