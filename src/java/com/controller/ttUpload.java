/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.util.DBConnection;
import java.io.DataInputStream;
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
public class ttUpload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String pid = (String) session.getAttribute("pid");
        String contentType = request.getContentType();
        String fn = "";
        try {
            Connection con = DBConnection.createConnection();
            String ipAddr = "";
            if (request != null) {
                ipAddr = request.getHeader("X-FORWARDED-FOR");
                if (ipAddr == null || "".equals(ipAddr)) {
                    ipAddr = request.getRemoteAddr();
                }
            }
            String sql = "select * from emptt where pid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pid);
            ResultSet rs = ps.executeQuery();
            if(!rs.next())
            {
            sql = "insert into emptt values(?,?,NOW())";
            
            PreparedStatement ps1 = con.prepareStatement(sql);
            ps1.setString(1, pid);
            ps1.setString(2, ipAddr);
            int i = ps1.executeUpdate();
            if (i <= 0) {
                PrintWriter out = new PrintWriter("Something went Wrong, Please contact at webmaster@amu.ac.in");
                out.write("Something went Wrong, Please contact at webmaster@amu.ac.in");
            }
            ps1.close();
            
            String sqll = "insert into emplogs values(?,?,?,NOW())";
            ps1 = con.prepareStatement(sqll);
            ps1.setString(1, pid);
            ps1.setString(2, "9");
            ps1.setString(3, ipAddr);
            int j = ps1.executeUpdate();
            if (j <= 0) {
                PrintWriter out = new PrintWriter("Something went Wrong, Please contact at webmaster@amu.ac.in");
                out.write("Something went Wrong, Please contact at webmaster@amu.ac.in");
            }
            ps1.close();
            
            }
            else
            {
            rs.beforeFirst();
            sql = "update emptt set ipAdrress=?, updated_at=NOW() where pid=?";
            PreparedStatement ps1 = con.prepareStatement(sql);
            ps1.setString(1, ipAddr);
            ps1.setString(2, pid);
            int kk = ps1.executeUpdate();
            if (kk <= 0) {
                PrintWriter out = new PrintWriter("Something went Wrong, Please contact at webmaster@amu.ac.in");
                out.write("Something went Wrong, Please contact at webmaster@amu.ac.in");
            }
            ps1.close();
            sql = "insert into emplogs values(?,?,?,NOW())";
            ps1 = con.prepareStatement(sql);
            ps1.setString(1, pid);
            ps1.setString(2, "9");
            ps1.setString(3, ipAddr);
            int j = ps1.executeUpdate();
            if (j <= 0) {
                PrintWriter out = new PrintWriter("Something went Wrong, Please contact at webmaster@amu.ac.in");
                out.write("Something went Wrong, Please contact at webmaster@amu.ac.in");
            }
            ps1.close();
            }
            con.close();

            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                DataInputStream in = new DataInputStream(request.getInputStream());
                //we are taking the length of Content type data
                int formDataLength = request.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                //this loop converting the uploaded file into byte code
                while (totalBytesRead < formDataLength) {
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;

                }

                String file = new String(dataBytes);
                //for saving the file name
                String saveFile = file.substring(file.indexOf("filename=\"") + 10);

                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
                fn = saveFile;
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1, contentType.length());
                int pos;
                //extracting the index of file 
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;

                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                fn = fn.substring(fn.indexOf(".") + 1);
                fn = pid + ".pdf";

                ServletContext cntct = request.getServletContext();
                String path = cntct.getRealPath("/emptt/");
                FileOutputStream fileOut = new FileOutputStream(path + fn);
                fileOut.write(dataBytes, startPos, (dataBytes.length - startPos - boundary.length()));

                fileOut.flush();
                fileOut.close();

                String msg = "Your Time Table is successfully Uploaded !";
                response.sendRedirect("emp/timeTable.jsp?msg=" + msg);

            }
        } catch (Exception e) {
            response.sendRedirect("emp/timeTable.jsp?msg=" + e);
        }
    }

}
