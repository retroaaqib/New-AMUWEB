
<%@page import="java.io.File"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en" class="ie ie9"> <!--<![endif]-->






    <head>
        <meta content="text/html; charset=utf-8" http-equiv="content-type"/>
        <meta name="description" content=""/>
        <meta name="keywords" content=""/>

        <!-- Mobile Specific Metas
        +++++++++++++++++++++++++++ -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!--[if IE ]><meta http-equiv="X-UA-Compatible" content="IE=Edge"><![endif]-->
        <!-- <link rel="shortcut icon" href="img/favico.ico">
 
         <link rel="apple-touch-icon" href="img/apple_icons_57x57.png">
         <link rel="apple-touch-icon" sizes="72x72" href="img/apple_icons_72x72.png">
         <link rel="apple-touch-icon" sizes="114x114" href="img/apple_icons_114x114.png">-->

        <title>Aligarh Muslim University || Prof M.N. Farooqui Computer Centre</title>

        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700,800,400italic,600italic,700italic' rel='stylesheet'
              type='text/css'>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
        <link rel="stylesheet" type="text/css" href="css/plugins.css">
        <link rel="stylesheet" type="text/css" href="css/theme.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        <link rel="stylesheet" type="text/css" href="css/theme_settings.css">
        <link rel="stylesheet" type="text/css" href="css/rs-settings.css">
        <link rel="stylesheet" type="text/css" href="css/color_theme.css" id="theme_color">
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css"/>

        <script src="js/jquery.min.js" type="text/javascript"></script>

        <script src="js/bootstrap.min.js" type="text/javascript"></script>

    </head>
    <body>

        <!DOCTYPE html>
    <html>
        <head>
            <!-- Piwik -->

        </head>
        <body>

            <%@include file="mainHeader.jsp"%>
        </body>
    </html>


    <%
        String dname = "";
        String did = request.getParameter("did");
        String desig = "";
        String email = "";
        String mobile = "";
        String name = "";
        String father = "";
        String mother = "";
        String birthPlace = "";
        String marital = "";
        String nationality = "";
        String dob = "";
        String address = "";
        String emailPri = "";
        String emailSec = "";
        String mobilePri = "";
        String mobileSec = "";
        String telephone = "";
        String thrust = "";
        String profile = "";
        String emContact = "";
        String emContactName = "";
        String emContactMob = "";
        String emContactAddress = "";
        String gScholarID = "";
        String pid = request.getParameter("id");
        Connection con = DBConnection.createConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select dname from deptts where did=?";
        ps = con.prepareStatement(sql);
        ps.setString(1, did);
        rs = ps.executeQuery();
        while (rs.next()) {
            dname = rs.getString(1);
        }
        rs.close();
        ps.close();

    %>
    <%    sql = "select * from empprofile1 where pid=? and empcat=1 and status=1";
        ps = con.prepareStatement(sql);
        ps.setString(1, pid);
        rs = ps.executeQuery();
        if (rs.next()) {
            desig = rs.getString(5);
            email = rs.getString(14);
            mobile = rs.getString(16);
            father = rs.getString(6);
            mother = rs.getString(7);
            birthPlace = rs.getString(8);
            marital = rs.getString(9);
            nationality = rs.getString(10);
            dob = rs.getString(11);
            address = rs.getString(12);
            telephone = rs.getString(17);
            thrust = rs.getString(18);
            profile = rs.getString(20);
            emContact = rs.getString(21);
            emContactName = rs.getString(22);
            emContactMob = rs.getString(23);
            emContactAddress = rs.getString(24);
            gScholarID = rs.getString(27);
            String sqll = "select designation from empdesig where desig_id=?";
            PreparedStatement ps1 = con.prepareCall(sqll);
            ps1.setString(1, desig);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                desig = rs1.getString(1);
            }
            rs1.close();
            ps1.close();

            String eml = email.substring(0, email.indexOf("@"));
            String eml2 = email.substring(email.lastIndexOf("@") + 1);

            email = eml + "[at]" + eml2;
    %>


    <div class="main_wrapper">
        <!-- C O N T E N T -->
        <div class="content_wrapper">
            <div class="page_title_block">
                <div class="container">
                    <h1 class="title"><%=dname%></h1>
                    <div class="breadcrumbs"><a href="index.jsp">Home</a><a href="univService.jsp?did=<%=did%>"><%=dname%></a><span>Staff Members</span></div>
                </div>
            </div>        

            <div class="container">
                <div class="content_block right-sidebar row">
                    <div class="fl-container span9">
                        <div class="row">
                            <div class="posts-block span9">
                                <div class="container" style="width: 850px">
                                    <div class="row-fluid">
                                        <div class="span12 module_cont module_text_area module_small_padding">
                                            <div class="bg_title"><h4 class="headInModule">Staff Member</h4></div>
                                        </div>
                                    </div>
                                    <!-- .module_cont -->
                                    <!-- .row-fluid -->

                                    <div class="row-fluid">
                                        <div class="span9 module_cont module_text_area">




                                            <div class="ip">
                                                <div class="attributes_wrapper">
                                                    <h4><%=rs.getString(3)%> &nbsp; <%=rs.getString(4)%> </h4>
                                                    <table class="shop_attributes responsive">

                                                        <tr>
                                                            <th><strong>Designation</strong>&nbsp;&nbsp;&nbsp;:</th>
                                                            <td><%=desig%></td>
                                                        </tr>
                                                        <tr>
                                                            <th><strong>Email</strong>&nbsp;&nbsp;&nbsp;:</th>
                                                            <td><%=email%></td>
                                                        </tr>
                                                        <tr>
                                                            <th><strong>Mobile</strong>&nbsp;&nbsp;&nbsp;:</th>
                                                            <td><%=mobile%></td>
                                                        </tr>

                                                    </table>
                                                </div>                 
                                            </div>
                                        </div>
                                        <div class="span3 module_cont module_text_area">
                                            <%
                                                File f = null;

                                                ServletContext cntct = request.getServletContext();
                                                String path = cntct.getRealPath("/");
                                                f = new File(path + "empphoto/" + pid + ".jpg");
                                                if (f.isFile()) {
                                            %>

                                            <img class="responsive" width="200" height="200" src="empphoto/<%=rs.getString(1)%>.jpg" class="img-right" >

                                            <P>&nbsp;</P>
                                                <%
                                                } else {
                                                %>
                                            <img class="responsive" width="200" height="200" src="img/default-emp.png" class="img-right" >
                                            <%
                                                }
                                                f = new File(path + "empcv/" + pid + ".pdf");
                                                if (f.isFile()) {
                                            %>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a target="_blank" href="empcv/<%=rs.getString(1)%>.pdf" class="shortcode_button btn_normal btn_type1">Complete CV</a>

                                            <%
                                                }

                                                rs.close();
                                                ps.close();
                                            %>

                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="col-lg-12">

                                            <ul class="nav nav-tabs" style="list-style: none!important;">
                                                <li class="active"><a data-toggle="tab" href="#home">Profile</a></li>
                                                <li><a data-toggle="tab" href="#menu2">Personal Info</a></li>
                                                <li><a data-toggle="tab" href="#menu3">Key Publications</a></li>
                                                <li><a data-toggle="tab" href="#menu4">Work Experience</a></li>
                                                <li><a data-toggle="tab" href="#menu5">Educational Details</a></li>
                                            </ul>

                                            <div class="tab-content">
                                                <div id="home" class="tab-pane fade in active">
                                                    <p>&nbsp;</p>


                                                    <%
                                                        if (thrust.length() > 0) {
                                                    %>

                                                    <div class="row-fluid">
                                                        <div class="span12 module_cont module_text_area module_small_padding">
                                                            <div class="bg_title"><h4 class="headInModule">Thrust</h4></div>
                                                            <%=thrust%>
                                                        </div>
                                                    </div>

                                                    <br>

                                                    <%
                                                        }
                                                    %>
                                                    <div class="row-fluid">
                                                        <div class="span12 module_cont module_text_area module_small_padding">
                                                            <div class="bg_title"><h4 class="headInModule">Profile</h4></div>
                                                            <%=profile%>
                                                        </div>
                                                    </div>

                                                    
                                                    <div class="row-fluid">
                                                        <div class="span12 module_cont module_text_area module_small_padding">
                                                            <div class="bg_title"><h4 class="headInModule"><img src="emp/img/gs.png" alt="googleScholar-Icon" width="50px" height="50px"/></h4></div>
                                                            <%=gScholarID%>
                                                        </div>
                                                    </div>
                                                    

                                                </div>

                                                <div id="menu2" class="tab-pane fade">
                                                    <p>&nbsp;</p>
                                                    <div class="row-fluid">
                                                        <div class="span12 module_cont module_text_area module_small_padding">
                                                            <div class="bg_title"><h4 class="headInModule">Profile</h4></div>
                                                            <%=profile%>
                                                        </div>
                                                    </div>
                                                    <p>&nbsp;</p>
                                                    <div id="contentf"></div>
                                                </div>
                                                <div id="menu3" class="tab-pane fade">
                                                    <p>&nbsp;</p>
                                                    Key Publications
                                                    <p>&nbsp;</p>
                                                    <div id="content"></div>
                                                </div>
                                                <div id="menu4" class="tab-pane fade">
                                                    <p>&nbsp;</p>
                                                    Work Experience
                                                    <p>&nbsp;</p>
                                                    <div id="content"></div>
                                                </div>
                                                <div id="menu5" class="tab-pane fade">
                                                    <p>&nbsp;</p>
                                                    Educational Details
                                                    <p>&nbsp;</p>
                                                    <div id="content"></div>
                                                </div>
                                            </div>
                                            <%
                                            } else {
                                            %>
                                            <script type="text/javascript">
                                                alert("The Requested Employee Could not be found, Please try again through navigating with Employee list");
                                                window.history.back();
                                            </script> 
                                            <%
                                                }
                                            %>
                                        </div>


                                    </div>
                                    <!-- .row-fluid -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- .contentarea -->
                    <aside class="sidebar">
                        <div class="right-sidebar-block span3">



                            <div class="sidepanel widget_nav_menu">

                                <div class="bg_title"><h4 class="sidebar_header">Related Links</h4></div>

                                <ul class="menu">




                                    <li class="menu-item"><a href='univService.jsp?did=10010&lid=Home Page' >Home Page</a></li>



                                    <li class="menu-item"><a href='univService.jsp?did=10010&lid=Services' >Services</a></li>


                                    <li class="menu-item"><a href=univServicemission.jsp?did=10010 >Vision and Mission</a></li>

                                    <li class="menu-item"><a href=univServicefacultylist.jsp?did=10010 >Staff Members</a></li>
                                    <li class="menu-item"><a href=univServicenc.jsp?did=10010 >Notices and Circulars</a></li>       
                                    <li class="menu-item"><a href=univServicegallery.jsp?did=10010 >Photo Gallery</a></li>

                                    <li class="menu-item"><a href=univServicetraining.jsp?did=10010 >Training and Workshop</a></li>
                                    <li class="menu-item"><a href=univServicefaq.jsp?did=10010 >Policies, Procedures and FAQs</a></li>
                                    <li class="menu-item"><a href=ithelpdesk.jsp?did=10010 >IT-HelpDesk</a></li>
                                    <li class="menu-item"><a href=ithfocalpt.jsp?did=10010 >Details of IT-Focal Points</a></li>
                                    <li class="menu-item"><a href=wrkshp.jsp?did=10010 >Workshop Registration</a></li>
                                    <li class="menu-item"><a href="/pdf/cc/wifi-coodinators.pdf" target="_blank">Wi-Fi Service Coordinators of PMNFCC for Halls</a></li>



                                    <li class="menu-item"><a href='univService.jsp?did=10010&lid=OnlineService' >OnlineService</a></li>



                                    <li class="menu-item"><a href='univService.jsp?did=10010&lid=Useful Download' >Useful Download</a></li>



                                    <li class="menu-item"><a href='univService.jsp?did=10010&lid=Software Resourses' >Software Resourses</a></li>



                                    <li class="menu-item"><a href='univService.jsp?did=10010&lid=Test Link' >Test Link</a></li>



                                    <li class="menu-item"><a href='univService.jsp?did=10010&lid=Network Layout' >Network Layout</a></li>



                                    <li class="menu-item"><a href='univService.jsp?did=10010&lid=RTI Information' >RTI Information</a></li>



                                    <li class="menu-item"><a href='univService.jsp?did=10010&lid=<a target=_blank href="http://amu.ac.in/pdf/cc/FP_Coordinator.pdf">Details of Internet Service Coordinators</a>' ><a target=_blank href="http://amu.ac.in/pdf/cc/FP_Coordinator.pdf">Details of Internet Service Coordinators</a></a></li>



                                    <li class="menu-item"><a href='univService.jsp?did=10010&lid=Contact Us' >Contact Us</a></li>




                                </ul>
                            </div>
                            <div class="sidepanel widget_nav_menu">

                                <div class="bg_title"><h4 class="sidebar_header">Other University Services</h4></div>

                                <ul class="menu">

                                    <li><a href="univService.jsp?did=10010">Prof M.N. Farooqui Computer Centre</a></li>


                                    <li><a href="univService.jsp?did=10061">Universiy Health Services</a></li>


                                    <li><a href="univService.jsp?did=10066">Maulana Azad Library</a></li>


                                    <li><a href="univService.jsp?did=10072">Guest House</a></li>


                                    <li><a href="univService.jsp?did=10073">Telephone Department AMU</a></li>


                                    <li><a href="univService.jsp?did=10074">Central Automobile Workshop</a></li>


                                    <li><a href="univService.jsp?did=10075">Electricity Department</a></li>


                                    <li><a href="univService.jsp?did=10112">Building Department</a></li>


                                    <li><a href="univService.jsp?did=10115">University Sophisticated Instruments Facility (USIF)</a></li>


                                    <li><a href="univService.jsp?did=10119">AMU Gas Services</a></li>


                                    <li><a href="univService.jsp?did=10122">Medical Attendance Scheme</a></li>


                                    <li><a href="univService.jsp?did=10182">Internal Quality Assurance Cell</a></li>


                                    <li><a href="univService.jsp?did=10187">ALUMNI</a></li>


                                    <li><a href="univService.jsp?did=10198">University Health Office</a></li>






                                </ul>
                            </div>
                        </div>
                    </aside>
                </div> 
                <div class="clear">  </div>
            </div>
            <!-- .left-sidebar -->
        </div>
        <div class="clear">
            <!-- ClearFix -->
        </div>
    </div>
    <!-- .fl-container -->

    <!-- .right-sidebar -->
    <div class="clear">
        <!-- ClearFix -->
    </div>
</div>
</div>
</div><!-- .container -->
</div><!-- .content_wrapper -->

</div><!-- .main_wrapper -->
<%
    con.close();
%>
<%@include file="mainFooter.jsp"%>








</body>
</html>