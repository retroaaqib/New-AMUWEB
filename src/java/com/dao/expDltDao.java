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
public class expDltDao {
    public static String empExpDlt(empExpBean expDlt)
    {
    String id = expDlt.getId();
    String pid = expDlt.getPid();
    String ipAddr = expDlt.getIpAddress();
    String sql = "";
    Connection con = DBConnection.createConnection();
    PreparedStatement ps = null;
    PreparedStatement ps1 = null;
    int i = 0 ;
    
    try
    {
     sql = "update empexp1 set updtIP=?, updated_at=NOW() where expid=?";
     ps = con.prepareStatement(sql);
     ps.setString(1,ipAddr);
     ps.setString(2,id);
     i = ps.executeUpdate();
     if(i<=0)
     {
     return "updtFailed";
     }
     ps.close();
     
     sql = "insert into deletedEmpExp select * from empexp1 where expid=?";
     ps = con.prepareStatement(sql);
     ps.setString(1,id);
     i = ps.executeUpdate();
      if(i<=0)
      {
      return "insrtFailed";
      }
      ps.close();
      
      sql = "delete from empexp1 where expid=?";
      ps = con.prepareStatement(sql);
      ps.setString(1,id);
      i = ps.executeUpdate();
      if(i>0)
      {
      String sql1 = "insert into emplogs values(?,?,?,NOW())";
            ps1 = con.prepareStatement(sql1);
            ps1.setString(1, pid);
            ps1.setString(2, "14");
            ps1.setString(3, ipAddr);
            int ii = ps1.executeUpdate();
            if (ii <= 0) {
                
                return "logFailure";
            }
            ps1.close();
      return "success";
      }
      ps.close();
      con.close();
    }
    
    catch(Exception e)
    {
        System.out.println(e);
    String ex = e.toString();
    return ex;
        
    }
    return "";
    }
    
}
