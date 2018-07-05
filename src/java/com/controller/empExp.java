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
import com.model.empExpBean;
import javax.servlet.http.HttpSession;
import com.dao.empExpDao;

/**
 *
 * @author CC-005
 */
public class empExp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String desig = request.getParameter("desig");
        String org = request.getParameter("org");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String wrkDesc = request.getParameter("wrkDesc");
        String current = request.getParameter("current");
        PrintWriter out = response.getWriter();
        String pid = request.getParameter("pid");
        String err = "";
        if (current == null) {
            current = "0";
        }
        String ipAddr = "";
        if (request != null) {
            ipAddr = request.getHeader("X-FORWARDED-FOR");
            if (ipAddr == null || "".equals(ipAddr)) {
                ipAddr = request.getRemoteAddr();
            }
        }
        empExpBean empExp = new empExpBean();
        empExp.setDesig(desig);
        empExp.setFrom(from);
        empExp.setTo(to);
        empExp.setWrkDesc(wrkDesc);
        empExp.setCurrent(current);
        empExp.setIpAddress(ipAddr);
        empExp.setPid(pid);
        empExp.setOrg(org);

        String empExpAdd = empExpDao.expUpdt(empExp);
        switch (empExpAdd) {
            case "success":
                err = "Professional experience has been Successfully Added!";
                response.sendRedirect("emp/profileUpdt.jsp?msg=" + err);
                break;
            case "failure":
            case "logFailure":
                err = "Your request can not be completed at this point in time, Please try again or contact at webmaster@amu.ac.in";
                response.sendRedirect("emp/profileUpdt.jsp?msg=" + err);
                break;
            case "duplicate":
                err = "Current Designation is already been added, Please try updation your qualifications.";
                response.sendRedirect("emp/profileUpdt.jsp?msg=" + err);
                break;
            default:
                err = "Some Error has Occured, Kindly contact at webmaster@amu.ac.in";
                response.sendRedirect("emp/profileUpdt.jsp?msg=" + err);
                break;
        }

    }

}
