/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.qualifAddBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.resUpdtDao;

/**
 *
 * @author Aaqib Khan
 */
public class resUpdt extends HttpServlet {

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String course = request.getParameter("course");
        String subj = request.getParameter("subj");
        String univ = request.getParameter("univ");
        String passout = request.getParameter("passout");
        String id = request.getParameter("id");
        String pid = request.getParameter("pid");
        String ipAddr = "";
        if (request != null) {
            ipAddr = request.getHeader("X-FORWARDED-FOR");
            if (ipAddr == null || "".equals(ipAddr)) {
                ipAddr = request.getRemoteAddr();
            }
        }
        qualifAddBean qualifAdd = new qualifAddBean();
        qualifAdd.setCourse(course);
        qualifAdd.setSubj(subj);
        qualifAdd.setUniv(univ);
        qualifAdd.setPassout(passout);
        qualifAdd.setId(id);
        qualifAdd.setPid(pid);
        qualifAdd.setIpAddress(ipAddr);
        
        String resUpdt = resUpdtDao.resUpdt(qualifAdd);
        switch (resUpdt) {
            case "success": {
                String message = "Your Research Qualifications has been Successfully Updated !";
                response.sendRedirect("emp/profileUpdt.jsp?msg=" + message);
                break;
            }
            default: {
                String message = "Your Resquest can not be fulfilled at this point in time, Please try later or contact at webmaste@amu.ac.in";
                response.sendRedirect("emp/profileUpdt.jsp?msg=" + message);
                break;
            }
        }
    }
}
