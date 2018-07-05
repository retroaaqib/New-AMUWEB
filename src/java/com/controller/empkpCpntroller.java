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
import com.model.empkpBean;
import javax.servlet.http.HttpSession;
import com.dao.empkpDAO;

/**
 *
 * @author CC-005
 */
public class empkpCpntroller extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String content = request.getParameter("content");
        String pid = request.getParameter("pid");
        
        String ipAddr = "";
        if (request != null) {
            ipAddr = request.getHeader("X-FORWARDED-FOR");
            if (ipAddr == null || "".equals(ipAddr)) {
                ipAddr = request.getRemoteAddr();
            }
        }
        empkpBean empkp = new empkpBean();
        empkp.setContent(content);
        empkp.setPid(pid);
        empkp.setIpAddress(ipAddr);
        empkpDAO kp = new empkpDAO();
        String updateKP = empkpDAO.empkp(empkp);
        if(updateKP.equals("success"))
        {
        String message = "Your Key Publications Has been Successfully Updated !";
        response.sendRedirect("emp/empkp.jsp?msg="+message);
        }
        else
        {
        String message = "There is some error in updating your key Publications, Kindly Contact at webmaster@amu.ac.in";
        response.sendRedirect("emp/empkp.jsp?msg="+message);
        }
    }

    
}
