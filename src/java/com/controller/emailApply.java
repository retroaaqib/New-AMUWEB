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
import com.model.emailApplyBean;
import com.dao.emailApplyDao;

/**
 *
 * @author Aaqib Khan
 */
public class emailApply extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String did = request.getParameter("did");
        String name = request.getParameter("name");
        String desig = request.getParameter("desig");
        String status = "Applied";
        String ipAddr = "";
        if (request != null) {
            ipAddr = request.getHeader("X-FORWARDED-FOR");
            if (ipAddr == null || "".equals(ipAddr)) {
                ipAddr = request.getRemoteAddr();
            }
        }
        String email = request.getParameter("email");
        emailApplyBean emlApply = new emailApplyBean();
        emlApply.setPid(pid);
        emlApply.setDid(did);
        emlApply.setLastActvityIP(ipAddr);
        emlApply.setEmail(email);
        emlApply.setStatus(status);
        emlApply.setName(name);
        emlApply.setDesig(desig);
        String msg = "";
        String emailApply = emailApplyDao.emailApply(emlApply);
        if (emailApply.equals("success")) {
            msg = "Your request has been submitted to your Head of the Department for online for verification. If you have not updated your email in the profile page, please update email to recieve the requested credentials.";
            response.sendRedirect("emp/applyEmail.jsp?msg=" + msg);
        } else {
            msg = "Your request cannot be fulfilled at this point in time, please try later or contact at webmaster@amu.ac.in";
            response.sendRedirect("emp/applyEmail.jsp?msg=" + msg);
        }
    }

}
