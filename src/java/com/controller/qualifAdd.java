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
import com.model.qualifAddBean;
import com.dao.qualifAddDao;

/**
 *
 * @author CC-005
 */
public class qualifAdd extends HttpServlet {  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String lvl = request.getParameter("lvl");
      String course = request.getParameter("course");
      String subj = request.getParameter("subj");
      String division = request.getParameter("division");
      String percent = request.getParameter("percent");
      String univ = request.getParameter("univ");
      String passout = request.getParameter("passout");
      String ipAddr = "";
        if (request != null) {
            ipAddr = request.getHeader("X-FORWARDED-FOR");
            if (ipAddr == null || "".equals(ipAddr)) {
                ipAddr = request.getRemoteAddr();
            }
        }
        HttpSession Session = request.getSession();
     String pid = (String) Session.getAttribute("pid");
     
     qualifAddBean qualAdd = new qualifAddBean();
     qualAdd.setCourse(course);
     qualAdd.setDivision(division);
     qualAdd.setIpAddress(ipAddr);
     qualAdd.setLvl(lvl);
     qualAdd.setPassout(passout);
     qualAdd.setPercent(percent);
     qualAdd.setPid(pid);
     qualAdd.setSubj(subj);
     qualAdd.setUniv(univ);
     
     String qualifAdd = qualifAddDao.qualifAdd(qualAdd);
        switch (qualifAdd) {
            case "success":
                {
                    String message = "Your Educational Qualifications has been Successfully Updated !";
                    response.sendRedirect("emp/profileUpdt.jsp?msg="+message);
                    break;
                }
            case "duplicate":
                {
                    String message = "Course details for chosen level is already Added, Please Try Updating the Education!";
                    response.sendRedirect("emp/profileUpdt.jsp?msg="+message);
                    break;
                }
            default:
                {
                    String message = "Your reuqest can not be fulfilled at this point in time, Please try later or contact at webmaster@amu.ac.in";
                    response.sendRedirect("emp/profileUpdt.jsp?msg="+message);
                    break;
                }
        }
    }

    
}
