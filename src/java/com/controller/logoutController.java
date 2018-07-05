/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import com.util.DBConnection;

/**
 *
 * @author CC-005
 */
public class logoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ipAddr = "";
        if (request != null) {
            ipAddr = request.getHeader("X-FORWARDED-FOR");
            if (ipAddr == null || "".equals(ipAddr)) {
                ipAddr = request.getRemoteAddr();
            }
        }
        HttpSession session = request.getSession();
        String pid = (String) session.getAttribute("pid");
        try
        {
        String sql = "insert into emplogs values (?,?,?,NOW())";
        Connection con = DBConnection.createConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, pid);
        ps.setString(2, "2");
        ps.setString(3, ipAddr);
        int kk = ps.executeUpdate();
        session.invalidate();
        response.sendRedirect("emp/index.jsp");
        con.close();
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
    }

}
