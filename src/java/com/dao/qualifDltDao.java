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
public class qualifDltDao {
public static String qualifDlt(qualifAddBean qualifDlt)
{
    String id = qualifDlt.getId();
    String ipAddr = qualifDlt.getIpAddress();
    String pid = qualifDlt.getPid();
    String sql = "";
    Connection con = DBConnection.createConnection();
    PreparedStatement ps = null;
    PreparedStatement ps1 = null;
    int i = 0 ;
    
    try
    {
     sql = "update empqualif set ipAddress=?, updated_at=NOW() where qualif_id=?";
     ps = con.prepareStatement(sql);
     ps.setString(1,ipAddr);
     ps.setString(2,id);
     i = ps.executeUpdate();
     if(i<=0)
     {
     return "updtFailed";
     }
     ps.close();
     try
     {
     sql = "insert into deleteEmpQualif select * from empQualif where qualif_id=?";
     ps = con.prepareStatement(sql);
     ps.setString(1,id);
     i = ps.executeUpdate();
      if(i<=0)
      {
      return "insrtFailed";
      }
      ps.close();
     }
     catch(Exception e)
     {
     System.out.print(e);
     }
     
      sql = "delete from empQualif where qualif_id=?";
      ps = con.prepareStatement(sql);
      ps.setString(1,id);
      i = ps.executeUpdate();
      if(i>0)
      {
      String sql1 = "insert into emplogs values(?,?,?,NOW())";
            ps1 = con.prepareStatement(sql1);
            ps1.setString(1, pid);
            ps1.setString(2, "17");
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
    }
return "";
}
}
