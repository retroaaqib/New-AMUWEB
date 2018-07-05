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
import com.model.empExpBean;
import javax.servlet.http.HttpSession;
import com.dao.expDltDao;

/**
 *
 * @author CC-005
 */
public class expDlt extends HttpServlet {

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
        String err = "";
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        String pid = (String) session.getAttribute("pid");
        empExpBean expDlt = new empExpBean();
        expDlt.setId(id);
        expDlt.setPid(pid);
        expDlt.setIpAddress(ipAddr);
        String empExpDlt = expDltDao.empExpDlt(expDlt);
        switch (empExpDlt) {
            case "success":
                err = "Professional experience has been Successfully Deleted!";
                response.sendRedirect("emp/profileUpdt.jsp?msg=" + err);
                break;
            case "insrtFailed":
            case "logFailure":
            case "updtFailed":
                err = "Your request can not be completed at this point in time, Please try again or contact at webmaster@amu.ac.in";
                response.sendRedirect("emp/profileUpdt.jsp?msg=" + err);
                break;
            default:
                err = "Some Error has Occured, Kindly contact at webmaster@amu.ac.in";
                response.sendRedirect("emp/profileUpdt.jsp?msg=" + err);
                break;
        }
    }
}
