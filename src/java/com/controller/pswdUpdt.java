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
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.Cipher;
import java.security.Key;
import com.model.resetPassBean;
import com.dao.resetPassDao;
/**
 *
 * @author CC-005
 */
public class pswdUpdt extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    String pid = request.getParameter("pid");
    String password = request.getParameter("paswd");
    String algorithm = "AES";
        PrintWriter out = response.getWriter();
        String ipAddr = "";
        if (request != null) {
            ipAddr = request.getHeader("X-FORWARDED-FOR");
            if (ipAddr == null || "".equals(ipAddr)) {
                ipAddr = request.getRemoteAddr();
            }
        }
    try{
    byte[] keyValue = new byte[]{'A', 'S', 'e', 'c', 'u', 'r', 'e', 'S', 'e', 'c', 'r', 'e', 't', 'K', 'e', 'y', 'I', 's', 'A', 'V', 'e', 'r', 'y', 'G', 'o', 'o', 'd', 'T', 'h', 'i', 'n', 'g'};
            Key key = new SecretKeySpec(keyValue, "AES");
            Cipher chiper = Cipher.getInstance(algorithm);
            chiper.init(Cipher.ENCRYPT_MODE, key);
            byte[] encVal = chiper.doFinal(password.getBytes());
            password = new BASE64Encoder().encode(encVal);
            resetPassBean resetPass = new resetPassBean();
            resetPass.setPid(pid);
            resetPass.setPassword(password);
            resetPass.setIpAddress(ipAddr);
            String msg = "";
            String rstPass = resetPassDao.rstPass(resetPass);
            if(rstPass.equals("success"))
            {
            msg = "Your password has been sucessfully changed!";
            response.sendRedirect("emp/resetPass.jsp?msg="+msg);
            }
            else{
            msg = "Your request can not be fulfilled at this point in time, Please try later or contact at webmaster@amu.ac.in";
            response.sendRedirect("emp/resetPass.jsp?msg="+msg);
            }
    }
    catch(Exception e)
    {    
    out.write(e.toString());
    }
    }    
}
