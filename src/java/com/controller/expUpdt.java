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
import com.dao.expUpdtDao;

/**
 *
 * @author CC-005
 */
public class expUpdt extends HttpServlet {

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String pid = request.getParameter("pid");
        String org = request.getParameter("org");
        String desig = request.getParameter("desig");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String wrkDesc = request.getParameter("wrkDesc");
        String ipAddr = "";
        if (request != null) {
            ipAddr = request.getHeader("X-FORWARDED-FOR");
            if (ipAddr == null || "".equals(ipAddr)) {
                ipAddr = request.getRemoteAddr();
            }
        }
        String err = "";
        empExpBean expUpdt = new empExpBean();
        expUpdt.setId(id);
        expUpdt.setOrg(org);
        expUpdt.setDesig(desig);
        expUpdt.setFrom(from);
        expUpdt.setTo(to);
        expUpdt.setWrkDesc(wrkDesc);
        expUpdt.setIpAddress(ipAddr);
        expUpdt.setPid(pid);
        String empExpUpdt = expUpdtDao.empExpUpdt(expUpdt);
        switch (empExpUpdt) {
            case "success":
                err = "Professional experience has been Successfully Updated!";
                response.sendRedirect("emp/profileUpdt.jsp?msg=" + err);
                break;
            case "failure":
            case "logFailure":
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
