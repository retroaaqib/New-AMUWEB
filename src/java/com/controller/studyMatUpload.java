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
public class studyMatUpload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String desc = (String) session.getAttribute("desc");
        String pid = (String) session.getAttribute("pid");
        String contentType = request.getContentType();
        String fn = "";
        String id = "";
        int temp = 0;
        String fx = "";
        try {
            Connection con = DBConnection.createConnection();
            String sqt = "select MAX(stdymat_id) from empstudym";
            PreparedStatement ps = con.prepareStatement(sqt);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getString(1);
            }
            rs.close();
            ps.close();
            if (id == null || id.equals("0")) {
                id = "1";
                temp = Integer.parseInt(id);
                temp = ++temp;
                fx = Integer.toString(temp);
            } else {
                temp = Integer.parseInt(id);
                temp = ++temp;
                fx = Integer.toString(temp);

            }

            String sql = "insert into empstudym (pid,dsc,fn,ipAddress,uploaded_at) values(?,?,?,?,NOW())";
            String ipAddr = "";
            if (request != null) {
                ipAddr = request.getHeader("X-FORWARDED-FOR");
                if (ipAddr == null || "".equals(ipAddr)) {
                    ipAddr = request.getRemoteAddr();
                }
            }
            ps = con.prepareStatement(sql);
            ps.setString(1, pid);
            ps.setString(2, desc);
            ps.setString(3, fx + ".pdf");
            ps.setString(4, ipAddr);
            int i = ps.executeUpdate();
            if (i <= 0) {
                PrintWriter out = new PrintWriter("Something went Wrong, Please contact at webmaster@amu.ac.in");
                out.write("Something went Wrong, Please contact at webmaster@amu.ac.in");
            }
            ps.close();
            session.removeAttribute(desc);
            String sqll = "insert into emplogs values(?,?,?,NOW())";
            ps = con.prepareStatement(sqll);
            ps.setString(1, pid);
            ps.setString(2, "7");
            ps.setString(3, ipAddr);
            int j = ps.executeUpdate();
            if (j <= 0) {
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
                fn = fx.substring(fx.indexOf(".") + 1);
                fn = fn + ".pdf";

                ServletContext cntct = request.getServletContext();
                String path = cntct.getRealPath("/emp/studym/");
                FileOutputStream fileOut = new FileOutputStream(path + fn);
                fileOut.write(dataBytes, startPos, (dataBytes.length - startPos - boundary.length()));

                fileOut.flush();
                fileOut.close();

                String msg = "Your Study Material is successfully Uploaded !";
                response.sendRedirect("emp/studyMat.jsp?msg=" + msg);

            }
        } catch (Exception e) {
            response.sendRedirect("emp/studyMat.jsp?msg=" + e);
        }
    }

}
