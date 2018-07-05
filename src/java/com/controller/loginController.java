/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.Cipher;
import java.security.Key;
import com.util.DBConnection;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CC-005
 */
public class loginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("passwd");
        String algorithm = "AES";
        Connection con = null;
        try {
            byte[] keyValue = new byte[]{'A', 'S', 'e', 'c', 'u', 'r', 'e', 'S', 'e', 'c', 'r', 'e', 't', 'K', 'e', 'y', 'I', 's', 'A', 'V', 'e', 'r', 'y', 'G', 'o', 'o', 'd', 'T', 'h', 'i', 'n', 'g'};
            Key key = new SecretKeySpec(keyValue, "AES");
            Cipher chiper = Cipher.getInstance(algorithm);
            chiper.init(Cipher.ENCRYPT_MODE, key);
            byte[] encVal = chiper.doFinal(password.getBytes());
            password = new BASE64Encoder().encode(encVal);
            String sql = "select * from emplogin where pid=? and passwd=?";
            con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("pid", username);
                String ipAddr = "";
                if (request != null) {
                    ipAddr = request.getHeader("X-FORWARDED-FOR");
                    if (ipAddr == null || "".equals(ipAddr)) {
                        ipAddr = request.getRemoteAddr();
                    }
                }
                sql = "insert into emplogs values (?,?,?,NOW())";
                PreparedStatement ps1 = con.prepareStatement(sql);
                ps1.setString(1, username);
                ps1.setString(2, "1");
                ps1.setString(3, ipAddr);
                int kk = ps1.executeUpdate();
                response.sendRedirect("emp/dashboard.jsp");
            } else {
                String errMessage = "Invalid User Credentials, Please Try Again !";
//                request.setAttribute("errMessage", errMessage);
//                request.getRequestDispatcher("/emp/index.jsp").forward(request, response);
                response.sendRedirect("emp/index.jsp?em=" + errMessage);
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
}
