/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.DataInputStream;
import java.io.PrintWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.util.DBConnection;
import java.sql.*;

/**
 *
 * @author Aaqib Khan
 */
public class cvUpload extends HttpServlet {

   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String art = (String) session.getAttribute("artificat");
        String pid = (String) session.getAttribute("pid");
        String contentType = request.getContentType();
        String fn = "";
        
        try {
            Connection con = DBConnection.createConnection();
            String sql = "insert into empcv values(?,?,?,NOW())";
            String ipAddr = "";
            if (request != null) {
                ipAddr = request.getHeader("X-FORWARDED-FOR");
                if (ipAddr == null || "".equals(ipAddr)) {
                    ipAddr = request.getRemoteAddr();
                }
            }
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,pid);
            ps.setString(2,art);
            ps.setString(3,ipAddr);
            int i = ps.executeUpdate();
            if(i<=0)
            {
            PrintWriter out = new PrintWriter("Something went Wrong, Please contact at webmaster@amu.ac.in");
            }
            ps.close();
            
            String sqll = "insert into emplogs values(?,?,?,NOW())";
                                ps = con.prepareStatement(sqll);
                                ps.setString(1, pid);
                                ps.setString(2, "6");
                                ps.setString(3, ipAddr);
                                int j = ps.executeUpdate();
                                if(j<=0)
            {
            PrintWriter out = new PrintWriter("Something went Wrong, Please contact at webmaster@amu.ac.in");
            }
                                ps.close();                                
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
                    //out.println("ReadByte"+in.readByte());

                }

                String file = new String(dataBytes);
                //out.println("file"+file);
                //for saving the file name
                String saveFile = file.substring(file.indexOf("filename=\"") + 10);
                //out.println("savefiel1"+saveFile);

                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                //out.println("savefiel2"+saveFile);
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
                //out.println("savefiel3"+saveFile);
                fn = saveFile;
                int lastIndex = contentType.lastIndexOf("=");

                //out.println("Content type"+lastIndex);
                String boundary = contentType.substring(lastIndex + 1, contentType.length());
                //	out.println("boundary"+boundary);
                int pos;
                //extracting the index of file 
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                //out.println("Hi next");

                int boundaryLocation = file.indexOf(boundary, pos) - 4;
//out.println("Hi next1"+pos);
                int startPos = ((file.substring(0, pos)).getBytes()).length;
//out.println("Hi next2");
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                fn = fn.substring(fn.indexOf(".") + 1);
//fn=eid+"."+fn;
                fn = pid + ".pdf";

                ServletContext cntct = request.getServletContext();
                String path = cntct.getRealPath("/empcv/");
                FileOutputStream fileOut = new FileOutputStream(path + fn);
                fileOut.write(dataBytes, startPos, (dataBytes.length - startPos - boundary.length()));

                fileOut.flush();
                fileOut.close();
                
                String msg = "Your CV is successfully Uploaded !";
                response.sendRedirect("emp/empCV.jsp?msg="+msg);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
