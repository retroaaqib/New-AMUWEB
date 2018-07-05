<%-- 
    Document   : epfProcess.jsp
    Created on : Jul 4, 2017, 1:47:11 PM
    Author     : sdc
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" session="True"%>
<%@page import="javax.servlet.http.*"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title>PF Statement - Employee</title>
        <link rel="shortcut icon" href="assets/images/favicon.ico" />


        <meta name="description" content="overview &amp; stats" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <!-- bootstrap & fontawesome -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />

        <!-- page specific plugin styles -->

        <!-- text fonts -->
        <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

        <!-- ace styles -->
        <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
        <!--[if lte IE 9]>
                <link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
        <![endif]-->
        <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

        <!--[if lte IE 9]>
          <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
        <![endif]-->

        <!-- inline styles related to this page -->

        <!-- ace settings handler -->
        <script src="assets/js/ace-extra.min.js"></script>

        <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

        <!--[if lte IE 8]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->
        <script>
            function printContent(el) {
                var restorepage = $('body').html();
                var printcontent = $('#' + el).clone();
                $('body').empty().html(printcontent);
                window.print();
                $('body').html(restorepage);
            }
        </script>
    </head>

    <body class="no-skin">
        <%@include file="header.jsp"%>

        <script type="text/javascript">
            try {
                ace.settings.loadState('main-container')
            } catch (e) {
            }
        </script>

        <div id="sidebar" class="sidebar responsive ace-save-state">
            <script type="text/javascript">
                try {
                    ace.settings.loadState('sidebar')
                } catch (e) {
                }
            </script>

            <%@include file="emplinks.jsp"%>

        </div>

        <div class="main-content">



            <div class="page-content">
                <!--                <div class="ace-settings-container" id="ace-settings-container">
                                    <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                                        <i class="ace-icon fa fa-cog bigger-130"></i>
                                    </div>
                
                                    <div class="ace-settings-box clearfix" id="ace-settings-box">
                                        <div class="pull-left width-50">
                                            <div class="ace-settings-item">
                                                <div class="pull-left">
                                                    <select id="skin-colorpicker" class="hide">
                                                        <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                                        <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                                        <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                                        <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                                    </select>
                                                </div>
                                                <span>&nbsp; Choose Skin</span>
                                            </div>
                
                                            <div class="ace-settings-item">
                                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
                                                <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                                            </div>
                
                                            <div class="ace-settings-item">
                                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off" />
                                                <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                                            </div>
                
                                            <div class="ace-settings-item">
                                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
                                                <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                                            </div>
                
                                            <div class="ace-settings-item">
                                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
                                                <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                                            </div>
                
                                            <div class="ace-settings-item">
                                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
                                                <label class="lbl" for="ace-settings-add-container">
                                                    Inside
                                                    <b>.container</b>
                                                </label>
                                            </div>
                                        </div> /.pull-left 
                
                                        <div class="pull-left width-50">
                                            <div class="ace-settings-item">
                                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
                                                <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                                            </div>
                
                                            <div class="ace-settings-item">
                                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
                                                <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                                            </div>
                
                                            <div class="ace-settings-item">
                                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
                                                <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                                            </div>
                                        </div> /.pull-left 
                                    </div> /.ace-settings-box 
                                </div> /.ace-settings-container -->

                <div class="page-header">
                    <center>
                        <%                            
                            String fy = request.getParameter("fy");
                            String fy1 = fy.substring(0, 4);
                            String fy2 = fy.substring(5, 9);
                            Connection connection = null;
                            PreparedStatement ps1 = null;
                            ResultSet rs1 = null;
                            String PER_ID = "0";
                            String NAME = "";
                            String DESIG = "";
                            String DESIGNATION = "";
                            String DEPT = "";
                            String DEPARTMENT = "";
                            String PF04 = "";
                            String PF05 = "";
                            String PF06 = "";
                            String PF07 = "";
                            String PF08 = "";
                            String PF09 = "";
                            String PF10 = "";
                            String PF11 = "";
                            String PF12 = "";
                            String PF01 = "";
                            String PF02 = "";
                            String PF03 = "";
                            String PFT = "";
                            String PFD04 = "";
                            String PFD05 = "";
                            String PFD06 = "";
                            String PFD07 = "";
                            String PFD08 = "";
                            String PFD09 = "";
                            String PFD10 = "";
                            String PFD11 = "";
                            String PFD12 = "";
                            String PFD01 = "";
                            String PFD02 = "";
                            String PFD03 = "";
                            String PFD13 = "";
                            String PFDT = "";
                            String PFR04 = "";
                            String PFR05 = "";
                            String PFR06 = "";
                            String PFR07 = "";
                            String PFR08 = "";
                            String PFR09 = "";
                            String PFR10 = "";
                            String PFR11 = "";
                            String PFR12 = "";
                            String PFR01 = "";
                            String PFR02 = "";
                            String PFR03 = "";
                            String PFRT = "";
                            String PFRD04 = "";
                            String PFRD05 = "";
                            String PFRD06 = "";
                            String PFRD07 = "";
                            String PFRD08 = "";
                            String PFRD09 = "";
                            String PFRD10 = "";
                            String PFRD11 = "";
                            String PFRD12 = "";
                            String PFRD01 = "";
                            String PFRD02 = "";
                            String PFRD03 = "";
                            String PFRD13 = "";
                            String PFRDT = "";
                            String PFL04 = "";
                            String PFL05 = "";
                            String PFL06 = "";
                            String PFL07 = "";
                            String PFL08 = "";
                            String PFL09 = "";
                            String PFL10 = "";
                            String PFL11 = "";
                            String PFL12 = "";
                            String PFL01 = "";
                            String PFL02 = "";
                            String PFL03 = "";
                            String PFLT = "";
                            String PFW04 = "";
                            String PFW05 = "";
                            String PFW06 = "";
                            String PFW07 = "";
                            String PFW08 = "";
                            String PFW09 = "";
                            String PFW10 = "";
                            String PFW11 = "";
                            String PFW12 = "";
                            String PFW01 = "";
                            String PFW02 = "";
                            String PFW03 = "";
                            String PFWT = "";
                            String OPENBAL = "";
                            String DEPREF = "";
                            String TOT12 = "";
                            String INTEREST = "";
                            String TOT34 = "";
                            String WITHLOAN = "";
                            String CLOSBAL = "";
                            String PAGENO = "";
                            String LEGNO = "";
                            String F_YR = "";

                            Class.forName("org.gjt.mm.mysql.Driver").newInstance();
                            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fosalary", "root", "Aaqib@123");
                            String period = "";
                            String sqlstring1 = "select NAME, DESIG, DESIGNATION, DEPT, DEPARTMENT, PF04, PF05, PF06, PF07, PF08, PF09, PF10, PF11, PF12, PF01, PF02, PF03, PFT, PFD04, PFD05, PFD06, PFD07, PFD08, PFD09, PFD10, PFD11, PFD12, PFD01, PFD02, PFD03+PFD13, PFDT, PFR04, PFR05, PFR06, PFR07, PFR08, PFR09, PFR10, PFR11, PFR12, PFR01, PFR02, PFR03, PFRT, PFRD04, PFRD05, PFRD06, PFRD07, PFRD08, PFRD09, PFRD10, PFRD11, PFRD12, PFRD01, PFRD02, PFRD03+PFRD13, PFRDT, PFL04, PFL05, PFL06, PFL07, PFL08, PFL09, PFL10, PFL11, PFL12, PFL01, PFL02, PFL03, PFLT, PFW04, PFW05, PFW06, PFW07, PFW08, PFW09, PFW10, PFW11, PFW12, PFW01, PFW02, PFW03, PFWT, OPENBAL, DEPREF, TOT12, INTEREST, TOT34, WITHLOAN, CLOSBAL, PAGENO, LEGNO, F_YR, PER_ID  from GPF  where PER_ID=? and F_YR=?";
                            ps1 = connection.prepareStatement(sqlstring1);
                            ps1.setString(1, pid);
                            ps1.setString(2, fy);
                            rs1 = ps1.executeQuery();

                            while (rs1.next()) {
                                NAME = rs1.getString(1);
                                DESIG = rs1.getString(2);
                                DESIGNATION = rs1.getString(3);
                                DEPT = rs1.getString(4);
                                DEPARTMENT = rs1.getString(5);
                                PF04 = rs1.getString(6);
                                PF05 = rs1.getString(7);
                                PF06 = rs1.getString(8);
                                PF07 = rs1.getString(9);
                                PF08 = rs1.getString(10);
                                PF09 = rs1.getString(11);
                                PF10 = rs1.getString(12);
                                PF11 = rs1.getString(13);
                                PF12 = rs1.getString(14);
                                PF01 = rs1.getString(15);
                                PF02 = rs1.getString(16);
                                PF03 = rs1.getString(17);
                                PFT = rs1.getString(18);
                                PFD04 = rs1.getString(19);
                                PFD05 = rs1.getString(20);
                                PFD06 = rs1.getString(21);
                                PFD07 = rs1.getString(22);
                                PFD08 = rs1.getString(23);
                                PFD09 = rs1.getString(24);
                                PFD10 = rs1.getString(25);
                                PFD11 = rs1.getString(26);
                                PFD12 = rs1.getString(27);
                                PFD01 = rs1.getString(28);
                                PFD02 = rs1.getString(29);
                                PFD03 = rs1.getString(30);
                                PFDT = rs1.getString(31);
                                PFR04 = rs1.getString(32);
                                PFR05 = rs1.getString(33);
                                PFR06 = rs1.getString(34);
                                PFR07 = rs1.getString(35);
                                PFR08 = rs1.getString(36);
                                PFR09 = rs1.getString(37);
                                PFR10 = rs1.getString(38);
                                PFR11 = rs1.getString(39);
                                PFR12 = rs1.getString(40);
                                PFR01 = rs1.getString(41);
                                PFR02 = rs1.getString(42);
                                PFR03 = rs1.getString(43);
                                PFRT = rs1.getString(44);
                                PFRD04 = rs1.getString(45);
                                PFRD05 = rs1.getString(46);
                                PFRD06 = rs1.getString(47);
                                PFRD07 = rs1.getString(48);
                                PFRD08 = rs1.getString(49);
                                PFRD09 = rs1.getString(50);
                                PFRD10 = rs1.getString(51);
                                PFRD11 = rs1.getString(52);
                                PFRD12 = rs1.getString(53);
                                PFRD01 = rs1.getString(54);
                                PFRD02 = rs1.getString(55);
                                PFRD03 = rs1.getString(56);
                                PFRDT = rs1.getString(57);
                                PFL04 = rs1.getString(58);
                                PFL05 = rs1.getString(59);
                                PFL06 = rs1.getString(60);
                                PFL07 = rs1.getString(61);
                                PFL08 = rs1.getString(62);
                                PFL09 = rs1.getString(63);
                                PFL10 = rs1.getString(64);
                                PFL11 = rs1.getString(65);
                                PFL12 = rs1.getString(66);
                                PFL01 = rs1.getString(67);
                                PFL02 = rs1.getString(68);
                                PFL03 = rs1.getString(69);
                                PFLT = rs1.getString(70);
                                PFW04 = rs1.getString(71);
                                PFW05 = rs1.getString(72);
                                PFW06 = rs1.getString(73);
                                PFW07 = rs1.getString(74);
                                PFW08 = rs1.getString(75);
                                PFW09 = rs1.getString(76);
                                PFW10 = rs1.getString(77);
                                PFW11 = rs1.getString(78);
                                PFW12 = rs1.getString(79);
                                PFW01 = rs1.getString(80);
                                PFW02 = rs1.getString(81);
                                PFW03 = rs1.getString(82);
                                PFWT = rs1.getString(83);
                                OPENBAL = rs1.getString(84);
                                DEPREF = rs1.getString(85);
                                TOT12 = rs1.getString(86);
                                INTEREST = rs1.getString(87);
                                TOT34 = rs1.getString(88);
                                WITHLOAN = rs1.getString(89);
                                CLOSBAL = rs1.getString(90);
                                PAGENO = rs1.getString(91);
                                LEGNO = rs1.getString(92);
                                F_YR = rs1.getString(93);
                                PER_ID = rs1.getString(94);
                            }
                            if (!PER_ID.equals("0")) {
                        %>
                        <div id="div1"><center><h4>ALIGARH MUSLIM UNIVERSITY, ALIGARH<BR>
                                    GENERAL PROVIDENT FUND STATEMENT FOR THE FINANCIAL YEAR : <%=F_YR%> <BR>
                                </h4>
                            </center>
                            <br><br>
                            <table style="width:100%">
                                <tr>
                                    <td colspan="10">PER-ID : <%=pid%> <br><br> NAME : <%=NAME%></td>
                                    <td>DESIGNATION : <%=DESIGNATION%> <br><br>DEPARTMENT : <%=DEPARTMENT%></td>

                                </tr>
                                <tr>
                                    <td colspan="12">MONTHLY DESCRIPTION<p class="text-right"><%=PAGENO%>/<%=LEGNO%></p></td>
                                </tr>
                            </table>

                            <table style="width:100%">
                                <tr align="center">
                                    <th rowspan="2">Month / Year</th>
                                    <th colspan="2">(A)<BR>Personal Contrib.</th>
                                    <th colspan="2">(B)<BR>Refund of Advances</th>
                                    <th rowspan="2">(C)<BR>Withdrawls</th>
                                    <th rowspan="2">(D)<BR>Loans</th>
                                </tr>
                                <tr>
                                    <th>Salary</th>
                                    <th>Cash</th>
                                    <th>Salary</th>
                                    <th>Cash</th>
                                </tr>
                                <tr>
                                    <td>April <%=fy1%></td>
                                    <td><%=PF04%></td>
                                    <td><%=PFD04%></td>
                                    <td><%=PFR04%></td>
                                    <td><%=PFRD04%></td>
                                    <td><%=PFW04%></td>
                                    <td><%=PFL04%></td>
                                </tr>
                                <tr>
                                    <td>May <%=fy1%></td>
                                    <td><%=PF05%></td>
                                    <td><%=PFD05%></td>
                                    <td><%=PFR05%></td>
                                    <td><%=PFRD05%></td>
                                    <td><%=PFW05%></td>
                                    <td><%=PFL05%></td>
                                </tr>
                                <tr>
                                    <td>June <%=fy1%></td>
                                    <td><%=PF06%></td>
                                    <td><%=PFD06%></td>
                                    <td><%=PFR06%></td>
                                    <td><%=PFRD06%></td>
                                    <td><%=PFW06%></td>
                                    <td><%=PFL06%></td>
                                </tr>
                                <tr>
                                    <td>July <%=fy1%></td>
                                    <td><%=PF07%></td>
                                    <td><%=PFD07%></td>
                                    <td><%=PFR07%></td>
                                    <td><%=PFRD07%></td>
                                    <td><%=PFW07%></td>
                                    <td><%=PFL07%></td>
                                </tr>
                                <tr>
                                    <td>August <%=fy1%></td>
                                    <td><%=PF08%></td>
                                    <td><%=PFD08%></td>
                                    <td><%=PFR08%></td>
                                    <td><%=PFRD08%></td>
                                    <td><%=PFW08%></td>
                                    <td><%=PFL08%></td>
                                </tr>
                                <tr>
                                    <td>September <%=fy1%></td>
                                    <td><%=PF09%></td>
                                    <td><%=PFD09%></td>
                                    <td><%=PFR09%></td>
                                    <td><%=PFRD09%></td>
                                    <td><%=PFW09%></td>
                                    <td><%=PFL09%></td>
                                </tr>
                                <tr>
                                    <td>October <%=fy1%></td>
                                    <td><%=PF10%></td>
                                    <td><%=PFD10%></td>
                                    <td><%=PFR10%></td>
                                    <td><%=PFRD10%></td>
                                    <td><%=PFW10%></td>
                                    <td><%=PFL10%></td>
                                </tr>
                                <tr>
                                    <td>November <%=fy1%></td>
                                    <td><%=PF11%></td>
                                    <td><%=PFD11%></td>
                                    <td><%=PFR11%></td>
                                    <td><%=PFRD11%></td>
                                    <td><%=PFW11%></td>
                                    <td><%=PFL11%></td>
                                </tr>
                                <tr>
                                    <td>December <%=fy1%></td>
                                    <td><%=PF12%></td>
                                    <td><%=PFD12%></td>
                                    <td><%=PFR12%></td>
                                    <td><%=PFRD12%></td>
                                    <td><%=PFW12%></td>
                                    <td><%=PFL12%></td>
                                </tr>
                                <tr>
                                    <td>January <%=fy2%></td>
                                    <td><%=PF01%></td>
                                    <td><%=PFD01%></td>
                                    <td><%=PFR01%></td>
                                    <td><%=PFRD01%></td>
                                    <td><%=PFW01%></td>
                                    <td><%=PFL01%></td>
                                </tr>
                                <tr>
                                    <td>Februray <%=fy2%></td>
                                    <td><%=PF02%></td>
                                    <td><%=PFD02%></td>
                                    <td><%=PFR02%></td>
                                    <td><%=PFRD02%></td>
                                    <td><%=PFW02%></td>
                                    <td><%=PFL02%></td>
                                </tr>
                                <tr>
                                    <td>March <%=fy2%></td>
                                    <td><%=PF03%></td>
                                    <td><%=PFD03%></td>
                                    <td><%=PFR03%></td>
                                    <td><%=PFRD03%></td>
                                    <td><%=PFW03%></td>
                                    <td><%=PFL03%></td>
                                </tr>
                                <tr>
                                    <th>Total</th>
                                    <td><%=PFT%></td>
                                    <td><%=PFDT%></td>
                                    <td><%=PFRT%></td>
                                    <td><%=PFRDT%></td>
                                    <td><%=PFWT%></td>
                                    <td><%=PFLT%></td>
                                </tr>
                            </table>
                            <br><br>
                            1. BALANCE AS ON 1 APRIL <%=fy1%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            : <%=OPENBAL%>/-<br>
                            2. DEPOSITS & REFUNDS AS ABOVE (A+B) &nbsp;&nbsp;: <%=DEPREF%>/-<br>
                            3. TOTAL (1 & 2) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            
                            : <%=TOT12%>/-<br>
                            4. INTEREST FOR <%=F_YR%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            : <%=INTEREST%>/-<br>
                            5. TOTAL (3 & 4) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        
                            : <%=TOT34%>/-<br>
                            6. WITHDRAWLS AS ABOVE (C + D) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            : <%=WITHLOAN%>/-<br>
                            7. BALANCE AS ON 31 MARCH <%=fy2%>      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            : <%=CLOSBAL%>/-<br>
                            <br>
                            ==========================================================================================================================
                            <br>
                            Note: 1. Above statement of GPF is subject to Audit.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            2. Errors if any, must be brought to the notice of PF Section.<br><br></div>
                        <center><button class="btn btn-dark" id="print" onclick="printContent('div1');" >Print</button> <br><br> <a href="epf.jsp">Go Back</a></center>

                        <%
                                String ipAddr = "";
                                if (request != null) {
                                    ipAddr = request.getHeader("X-FORWARDED-FOR");
                                    if (ipAddr == null || "".equals(ipAddr)) {
                                        ipAddr = request.getRemoteAddr();
                                    }
                                }
                                int i = 0;
                                String sqll = "insert into emplogs values(?,?,?,NOW())";
                                PreparedStatement ps2 = con.prepareStatement(sqll);
                                ps2.setString(1, pid);
                                ps2.setString(2, "4");
                                ps2.setString(3, ipAddr);
                                i = ps2.executeUpdate();
                                ps1.close();
                                rs1.close();
                                ps1.close();
                                con.close();
                                connection.close();
                            } else {
                                String msg = "No PF record available for financial year" + fy;
                                request.setAttribute("msg", msg);
                                request.getRequestDispatcher("epf.jsp").forward(request, response);
                            }
                        %>

                    </center>

                    <!--                        <div class="page-header">
                                                <h1>
                                                    Dashboard
                                                    <small>
                                                        <i class="ace-icon fa fa-angle-double-right"></i>
                                                        overview &amp; stats
                                                    </small>
                                                </h1>
                                            </div> /.page-header -->


                    <!-- basic scripts -->

                    <!--[if !IE]> -->
                    <script src="assets/js/jquery-2.1.4.min.js"></script>

                    <!-- <![endif]-->

                    <!--[if IE]>
            <script src="assets/js/jquery-1.11.3.min.js"></script>
            <![endif]-->
                    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement)
            document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
                    </script>
                    <script src="assets/js/bootstrap.min.js"></script>

                    <!-- page specific plugin scripts -->

                    <!--[if lte IE 8]>
                      <script src="assets/js/excanvas.min.js"></script>
                    <![endif]-->
                    <script src="assets/js/jquery-ui.custom.min.js"></script>
                    <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
                    <script src="assets/js/jquery.easypiechart.min.js"></script>
                    <script src="assets/js/jquery.sparkline.index.min.js"></script>
                    <script src="assets/js/jquery.flot.min.js"></script>
                    <script src="assets/js/jquery.flot.pie.min.js"></script>
                    <script src="assets/js/jquery.flot.resize.min.js"></script>

                    <!-- ace scripts -->
                    <script src="assets/js/ace-elements.min.js"></script>
                    <script src="assets/js/ace.min.js"></script>

                    <!-- inline scripts related to this page -->
                    <script type="text/javascript">
        jQuery(function ($) {
            $('.easy-pie-chart.percentage').each(function () {
                var $box = $(this).closest('.infobox');
                var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
                var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
                var size = parseInt($(this).data('size')) || 50;
                $(this).easyPieChart({
                    barColor: barColor,
                    trackColor: trackColor,
                    scaleColor: false,
                    lineCap: 'butt',
                    lineWidth: parseInt(size / 10),
                    animate: ace.vars['old_ie'] ? false : 1000,
                    size: size
                });
            })

            $('.sparkline').each(function () {
                var $box = $(this).closest('.infobox');
                var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
                $(this).sparkline('html',
                        {
                            tagValuesAttribute: 'data-values',
                            type: 'bar',
                            barColor: barColor,
                            chartRangeMin: $(this).data('min') || 0
                        });
            });


            //flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
            //but sometimes it brings up errors with normal resize event handlers
            $.resize.throttleWindow = false;

            var placeholder = $('#piechart-placeholder').css({'width': '90%', 'min-height': '150px'});
            var data = [
                {label: "social networks", data: 38.7, color: "#68BC31"},
                {label: "search engines", data: 24.5, color: "#2091CF"},
                {label: "ad campaigns", data: 8.2, color: "#AF4E96"},
                {label: "direct traffic", data: 18.6, color: "#DA5430"},
                {label: "other", data: 10, color: "#FEE074"}
            ]
            function drawPieChart(placeholder, data, position) {
                $.plot(placeholder, data, {
                    series: {
                        pie: {
                            show: true,
                            tilt: 0.8,
                            highlight: {
                                opacity: 0.25
                            },
                            stroke: {
                                color: '#fff',
                                width: 2
                            },
                            startAngle: 2
                        }
                    },
                    legend: {
                        show: true,
                        position: position || "ne",
                        labelBoxBorderColor: null,
                        margin: [-30, 15]
                    }
                    ,
                    grid: {
                        hoverable: true,
                        clickable: true
                    }
                })
            }
            drawPieChart(placeholder, data);

            /**
             we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
             so that's not needed actually.
             */
            placeholder.data('chart', data);
            placeholder.data('draw', drawPieChart);


            //pie chart tooltip example
            var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
            var previousPoint = null;

            placeholder.on('plothover', function (event, pos, item) {
                if (item) {
                    if (previousPoint != item.seriesIndex) {
                        previousPoint = item.seriesIndex;
                        var tip = item.series['label'] + " : " + item.series['percent'] + '%';
                        $tooltip.show().children(0).text(tip);
                    }
                    $tooltip.css({top: pos.pageY + 10, left: pos.pageX + 10});
                } else {
                    $tooltip.hide();
                    previousPoint = null;
                }

            });

            /////////////////////////////////////
            $(document).one('ajaxloadstart.page', function (e) {
                $tooltip.remove();
            });




            var d1 = [];
            for (var i = 0; i < Math.PI * 2; i += 0.5) {
                d1.push([i, Math.sin(i)]);
            }

            var d2 = [];
            for (var i = 0; i < Math.PI * 2; i += 0.5) {
                d2.push([i, Math.cos(i)]);
            }

            var d3 = [];
            for (var i = 0; i < Math.PI * 2; i += 0.2) {
                d3.push([i, Math.tan(i)]);
            }


            var sales_charts = $('#sales-charts').css({'width': '100%', 'height': '220px'});
            $.plot("#sales-charts", [
                {label: "Domains", data: d1},
                {label: "Hosting", data: d2},
                {label: "Services", data: d3}
            ], {
                hoverable: true,
                shadowSize: 0,
                series: {
                    lines: {show: true},
                    points: {show: true}
                },
                xaxis: {
                    tickLength: 0
                },
                yaxis: {
                    ticks: 10,
                    min: -2,
                    max: 2,
                    tickDecimals: 3
                },
                grid: {
                    backgroundColor: {colors: ["#fff", "#fff"]},
                    borderWidth: 1,
                    borderColor: '#555'
                }
            });


            $('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
            function tooltip_placement(context, source) {
                var $source = $(source);
                var $parent = $source.closest('.tab-content')
                var off1 = $parent.offset();
                var w1 = $parent.width();

                var off2 = $source.offset();
                //var w2 = $source.width();

                if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2))
                    return 'right';
                return 'left';
            }


            $('.dialogs,.comments').ace_scroll({
                size: 300
            });


            //Android's default browser somehow is confused when tapping on label which will lead to dragging the task
            //so disable dragging when clicking on label
            var agent = navigator.userAgent.toLowerCase();
            if (ace.vars['touch'] && ace.vars['android']) {
                $('#tasks').on('touchstart', function (e) {
                    var li = $(e.target).closest('#tasks li');
                    if (li.length == 0)
                        return;
                    var label = li.find('label.inline').get(0);
                    if (label == e.target || $.contains(label, e.target))
                        e.stopImmediatePropagation();
                });
            }

            $('#tasks').sortable({
                opacity: 0.8,
                revert: true,
                forceHelperSize: true,
                placeholder: 'draggable-placeholder',
                forcePlaceholderSize: true,
                tolerance: 'pointer',
                stop: function (event, ui) {
                    //just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
                    $(ui.item).css('z-index', 'auto');
                }
            }
            );
            $('#tasks').disableSelection();
            $('#tasks input:checkbox').removeAttr('checked').on('click', function () {
                if (this.checked)
                    $(this).closest('li').addClass('selected');
                else
                    $(this).closest('li').removeClass('selected');
            });


            //show the dropdowns on top or bottom depending on window height and menu position
            $('#task-tab .dropdown-hover').on('mouseenter', function (e) {
                var offset = $(this).offset();

                var $w = $(window)
                if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                    $(this).addClass('dropup');
                else
                    $(this).removeClass('dropup');
            });

        })
                    </script>
                    </body>
                    </html>
