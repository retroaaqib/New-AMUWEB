<%-- 
    Document   : header
    Created on : May 8, 2018, 4:14:51 PM
    Author     : aaqibkhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" session="True"%>
<%@page import="com.util.DBConnection"%>
<%@page import="com.controller.logoutController"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>

    <body>
        <div id="navbar" class="navbar navbar-default ace-save-state" style="background-color: #730606">
            <div class="navbar-container ace-save-state" id="navbar-container">
                <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
                    <span class="sr-only">Toggle sidebar</span>

                    <span class="icon-bar"></span>

                    <span class="icon-bar"></span>

                    <span class="icon-bar"></span>
                </button>

                <div class="navbar-header">
                    <a href="dashboard.jsp" class="navbar-brand">                       
                        <img src="img/login_logo.png" alt="AMU Logo"/>                       
                    </a>


                </div><br>
                <ul class="pull-right">
                    <li class="light-blue dropdown-modal-right">
                        <a data-toggle="dropdown" href="#" class="dropdown-toggle ">
                            <%
                                String pid = (String) session.getAttribute("pid");
                                if (pid == null) {
                                    response.sendRedirect("index.jsp");
                                }
                            %>
                            <img class="nav-user-photo responsive" src="assets/images/avatars/user.jpg" alt="Jason's Photo" />
                            <span class="user-info " style="color: #fff">
                                <%
                                    Connection con = DBConnection.createConnection();
                                    String sql = "select pref, name from empprofile1 where pid=? limit 1";
                                    PreparedStatement ps = con.prepareStatement(sql);
                                    ps.setString(1, pid);
                                    ResultSet rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                <small>Welcome,</small>
                                <%=rs.getString(1)%> <%=rs.getString(2)%>
                                <%
                                    }
                                    rs.close();
                                    ps.close();
                                    
                                %>
                            </span>

                            <i class="ace-icon fa fa-caret-down"></i>
                        </a>

                        <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

<!--                            <li>
                                <a href="profile.html">
                                    <i class="ace-icon fa fa-user"></i>
                                    Profile
                                </a>
                            </li>-->

                            <li>
                                <a href="resetPass.jsp">
                                    <i class="ace-icon fa fa-user-secret"></i>
                                    Change Password
                                </a>
                            </li>
                            
                            <li class="divider"></li>

                            <li>
                                <a href="../logoutController">
                                    <i class="ace-icon fa fa-power-off"></i>
                                    Logout
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>

            </div>

        </div><!-- /.navbar-container -->

        <!--        <div class="main-container" id="main-container">
                </div>-->
        <div class="navbar-container subheader" id="navbar-container">

            <h2 style="color: #fff; font-family: Cambria;">Employee Profile Management Control Panel</h2>
        </div>        
    </body>
</html>
