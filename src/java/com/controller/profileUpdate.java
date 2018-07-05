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
import com.model.profileUpdtBean;
import com.dao.profileUpdtDAO;

/**
 *
 * @author CC-005
 */
public class profileUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String ipAddr = "";
        if (request != null) {
            ipAddr = request.getHeader("X-FORWARDED-FOR");
            if (ipAddr == null || "".equals(ipAddr)) {
                ipAddr = request.getRemoteAddr();
            }
        }
        String pid = request.getParameter("pid");        
        String name = request.getParameter("name");
        String desig = request.getParameter("desig");
        String father = request.getParameter("father");
        String mother = request.getParameter("mother");
        String birthPlace = request.getParameter("birthPlace");
        String marital = request.getParameter("marital");
        String nationality = request.getParameter("nationality");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String emailPri = request.getParameter("emailPri");
        String emailSec = request.getParameter("emailSec");
        String mobilePri = request.getParameter("mobilePri");
        String mobileSec = request.getParameter("mobileSec");
        String telephone = request.getParameter("telephone");
        String thrust = request.getParameter("thrust");
        String profile = request.getParameter("profile");
        String emContact = request.getParameter("emContact");
        String emContactName = request.getParameter("emContactName");
        String emContactMob = request.getParameter("emContactMob");
        String emContactAddress = request.getParameter("emContactAddress");
        String empcat = request.getParameter("empcat");
        String gScholarID = request.getParameter("gScholarID");
        profileUpdtBean profileBean = new profileUpdtBean();
        profileBean.setName(name);
        profileBean.setDesig(desig);
        profileBean.setFather(father);
        profileBean.setMother(mother);
        profileBean.setBirthPlace(birthPlace);
        profileBean.setMarital(marital);
        profileBean.setNationality(nationality);
        profileBean.setDob(dob);
        profileBean.setAddress(address);
        profileBean.setEmailPri(emailPri);
        profileBean.setEmailSec(emailSec);
        profileBean.setMobilePri(mobilePri);
        profileBean.setMobileSec(mobileSec);
        profileBean.setTelephone(telephone);
        profileBean.setThrust(thrust);
        profileBean.setProfile(profile);
        profileBean.setEmContact(emContact);
        profileBean.setEmContactName(emContactName);
        profileBean.setEmContactMob(emContactMob);
        profileBean.setEmContactAddress(emContactAddress);
        profileBean.setEmpcat(empcat);
        profileBean.setgScholarID(gScholarID);
        profileBean.setIpAddress(ipAddr);
        profileBean.setPid(pid);
        
        String updtProfile = profileUpdtDAO.updtProfile(profileBean);
        if(updtProfile.equals("success"))
        {
        String message = "Your Profile has been Successfully Updated !";
        response.sendRedirect("emp/profileUpdt.jsp?msg="+message);
        }
        else
        {
        String message = "Your request can not be fulfilled at this point in time, Please Try again or contact at webmaster@amu.ac.in";
        response.sendRedirect("emp/profileUpdt.jsp?msg="+message);
        }
    }
}
