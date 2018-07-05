/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.DataInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.model.empkpBean;
import com.dao.imgUploadDao;

/**
 *
 * @author Aaqib Khan
 */
public class imgUpload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String contentType = request.getContentType();
        HttpSession session = request.getSession();
        String pid = (String) session.getAttribute("pid");
        String fn = "";
        String ipAddr = "";
        if (request != null) {
            ipAddr = request.getHeader("X-FORWARDED-FOR");
            if (ipAddr == null || "".equals(ipAddr)) {
                ipAddr = request.getRemoteAddr();
            }
        }
        empkpBean imgUpload = new empkpBean();
        imgUpload.setPid(pid);
        imgUpload.setIpAddress(ipAddr);
        try {
            System.out.println("Hello 1");
            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                System.out.println("Hello y");
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
                System.out.println("Hello x");
                fn = pid + ".jpg";
                System.out.println("Hello 2");
                ServletContext cntct = request.getServletContext();
                String path = cntct.getRealPath("/empphoto/");
                FileOutputStream fileOut = new FileOutputStream(path + fn);
                fileOut.write(dataBytes, startPos, (dataBytes.length - startPos - boundary.length()));

                fileOut.flush();
                fileOut.close();
                String msg = "";
                String imgUpld = imgUploadDao.imageUpld(imgUpload);
                if (imgUpld.equals("success")) {
                    msg = "Your profile photo has been successfully Uploaded !";
                    response.sendRedirect("emp/profileUpdt.jsp?msg=" + msg);
                } else {
                    msg = "Your request can not be fulfilled at this point in time, Please try later or contact at webmaster@amu.ac.in";
                    response.sendRedirect("emp/profileUpdt.jsp?msg=" + msg);

                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
