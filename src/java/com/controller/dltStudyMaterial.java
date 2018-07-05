/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.util.DBConnection;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CC-005
 */
public class dltStudyMaterial extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String pid = (String) session.getAttribute("pid");
        String id = request.getParameter("studymat");
        String fn = "";
        
        
        try {
            Connection con = DBConnection.createConnection();
            String sqt = "insert into deletedEmpStudym select * from empstudym where fn=?";
            PreparedStatement ps = con.prepareStatement(sqt);
            ps.setString(1,id);
            int xx = ps.executeUpdate();
            if(xx<=0)
            {
            PrintWriter out = new PrintWriter("Something went Wrong, Please contact at webmaster@amu.ac.in");
            out.write("Something went Wrong, Please contact at webmaster@amu.ac.in");
            }
            ps.close();
            

           
                
            String sql = "delete from empstudym where fn=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            xx = ps.executeUpdate();
            if(xx<=0)
            {
            PrintWriter out = new PrintWriter("Something went Wrong, Please contact at webmaster@amu.ac.in");
            out.write("Something went Wrong, Please contact at webmaster@amu.ac.in");
            }
            ServletContext cntct = request.getServletContext();
                String path = cntct.getRealPath("/emp/studym/");
            File f1 = new File(path+id);
            f1.delete();
            String ipAddr = "";
                                if (request != null) {
                                    ipAddr = request.getHeader("X-FORWARDED-FOR");
                                    if (ipAddr == null || "".equals(ipAddr)) {
                                        ipAddr = request.getRemoteAddr();
                                    }
                                }
            String sqll = "insert into emplogs values(?,?,?,NOW())";
                                ps = con.prepareStatement(sqll);
                                ps.setString(1, pid);
                                ps.setString(2, "8");
                                ps.setString(3, ipAddr);
                                int j = ps.executeUpdate();
                                if(j<=0)
            {
            PrintWriter out = new PrintWriter("Something went Wrong, Please contact at webmaster@amu.ac.in");
            out.write("Something went Wrong, Please contact at webmaster@amu.ac.in");
            }
                                ps.close();                                
                                con.close();
            
            
                
                String msg = "Your Study Material is successfully Deleted !";
                response.sendRedirect("emp/studyMat.jsp?msg="+msg);

            
        } catch (Exception e) {
            response.sendRedirect("emp/studyMat.jsp?msg="+e);
        }
    }

}
