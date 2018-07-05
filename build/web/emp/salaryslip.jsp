<%-- 
    Document   : index.jsp
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
        <title>Pay Slip - AMU Employee</title>
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

                <%@ page import="java.io.*" %>
                <%@ page import="java.util.*" %>
                <%@ page import="java.sql.*" %>

                <%    String pid1 = "";
                    String year = "";
                    String month = "";
                    String tp = "";
                    pid1 = request.getParameter("pid");
                    year = request.getParameter("yr");
                    month = request.getParameter("month");
                    tp = request.getParameter("tp");

                    String tp_name = "";

                    String DESIG_NAME = "";
                    String DEPT_NAME = "";
                    String PAY_BAND = "";
                    String GRADE = "";
                    String SAL_NO = "";
                    String INCR = "";
                    String BASICSAL = "";
                    String ENAME = "";

                    String RNPA = "";
                    String RDA = "";
                    String RHRA = "";
                    String STRAN = "";
                    String EDU = "";
                    String OTH1N = "";
                    String OTH2N = "";
                    String OTH3N = "";
                    String OTH4N = "";
                    String OTH5N = "";
                    String OTH6N = "";

                    String OTH_DES1 = "";
                    String OTH_DES2 = "";
                    String OTH_DES3 = "";
                    String OTH_DES4 = "";
                    String OTH_DES5 = "";
                    String OTH_DES6 = "";

                    String ITAX = "";
                    String LIC = "";
                    String LIN_FEE = "";
                    String PF = "";
                    String PF_LOAN = "";
                    String NPS = "";
                    String CGIS = "";
                    String FEST_ADV = "";
                    String VEH_ADV = "";
                    String VC_LOAN = "";
                    String HBL_UGC = "";
                    String HBL_INT = "";
                    String ELECT = "";
                    String MAS = "";
                    String TSA = "";
                    String NTSA = "";
                    String TCHSA = "";
                    String TWS = "";
                    String VBSS = "";
                    String MIS_DES1 = "";
                    String MISC1 = "";
                    String MIS_DES2 = "";
                    String MISC2 = "";
                    String MIS_DES3 = "";
                    String MISC3 = "";
                    String MIS_DES4 = "";
                    String MISC4 = "";
                    String SAL_ADV = "";
                    String REV_STM = "";
                    String RECOVRY = "";

                    String DEDU = "";
                    String NET_PAY = "";
                    String RGROSS = "";
                    String BANK_NAME = "";
                    String BANK_AC = "";
                    String CHEQ_NO = "";
                    String CHEQ_DT = "";
                    String REMARK = "";
                    String VP_FROM = "";
                    String VP_TO = "";
                    String PER_ID = "000000";
                    String PAYPAYBAND = "";
                    String FG_DES = "";

                    String SPL_PAY = "";
                    String PER_PAY = "";
                    String PAN = "";

                    String month_name = "";

                    if (month.equals("1")) {
                        month_name = "January";
                    }
                    if (month.equals("2")) {
                        month_name = "February";
                    }
                    if (month.equals("3")) {
                        month_name = "March";
                    }
                    if (month.equals("4")) {
                        month_name = "April";
                    }
                    if (month.equals("5")) {
                        month_name = "May";
                    }
                    if (month.equals("6")) {
                        month_name = "June";
                    }
                    if (month.equals("7")) {
                        month_name = "July";
                    }
                    if (month.equals("8")) {
                        month_name = "August";
                    }
                    if (month.equals("9")) {
                        month_name = "September";
                    }
                    if (month.equals("10")) {
                        month_name = "October";
                    }
                    if (month.equals("11")) {
                        month_name = "November";
                    }
                    if (month.equals("12")) {
                        month_name = "December";
                    }

                    if (tp.equals("1.00")) {
                        tp_name = "Main";
                    }
                    if (tp.equals("2.00")) {
                        tp_name = "Supplementary-I";
                    }

                    if (tp.equals("3.00")) {
                        tp_name = "Supplementary-II";
                    }
                    if (tp.equals("4.00")) {
                        tp_name = "Supplementary-III";
                    }
                    if (tp.equals("5.00")) {
                        tp_name = "Supplementary-IV";
                    }

                    if (tp.equals("6.00")) {
                        tp_name = "Supplementary-V";
                    }
                    if (tp.equals("7.00")) {
                        tp_name = "Supplementary-VI";
                    }
                    if (tp.equals("8.00")) {
                        tp_name = "Supplementary-VII";
                    }

                    if (tp.equals("9.00")) {
                        tp_name = "Bonus";
                    }

                    ArrayList<String> a1 = new ArrayList<String>();
                    ArrayList<String> a2 = new ArrayList<String>();
                    ArrayList<String> a3 = new ArrayList<String>();
                    ArrayList<String> a4 = new ArrayList<String>();

                    try {

                        Class.forName("org.gjt.mm.mysql.Driver").newInstance();
                        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fosalary", "root", "Aaqib@123");
                        String period = "";
                        String sqlstring1 = "select DESIG_NAME,DEPT_NAME,PAYBAND,GRADE,SAL_NO,INCR,SUM(BASIC_CAL),NAME,SUM(RNPA),SUM(RDA) as RDA,SUM(RHRA),SUM(RTRAN),SUM(EDU),SUM(OTH1A),SUM(OTH2A),SUM(OTH3A),SUM(OTH4A),SUM(OTH5A),SUM(OTH6A),OTH_DES1,OTH_DES2,OTH_DES3,OTH_DES4,OTH_DES5, OTH_DES6,SUM(ITAX),SUM(LIC),SUM(LIN_FEE),SUM(PF),SUM(PF_LOAN),SUM(NPS),SUM(CGIS),SUM(FES_ADV),SUM(VEH_ADV),SUM(VC_LOAN),SUM(HBL_UGC),SUM(HBL_INT),SUM(ELECT),SUM(MAS),SUM(TSA),SUM(NTSA),SUM(TCHSA),SUM(TWS),SUM(VBSS),MIS_DES1,MISC1,MIS_DES2,MISC2,MIS_DES3,MISC3,MIS_DES4,MISC4,BANKNAME,BANK_AC,CHEQ_NO,CHEQ_DT,REMARK,SUM(DEDU),SUM(NET_PAY),SUM(RGROSS),FFDATE,FTDATE,PER_ID,PAYPAYBAND,FGDES,SUM(REV_STM),SUM(SAL_ADV),SUM(RECOVRY),SUM(PER_PAY),SUM(SPL_PAY),PAN, group_concat(concat(FFDATE, ' - ', FTDATE) separator ' , ') as period from SALARY  where PER_ID=? and MTH_NO=? and YR_NO=? and SAL_CODE=?";
                        ps = connection.prepareStatement(sqlstring1);
                        ps.setString(1, pid);
                        ps.setString(2, month);
                        ps.setString(3, year);
                        ps.setString(4, tp);
                        rs = ps.executeQuery();

                        while (rs.next()) {
                            DESIG_NAME = rs.getString(1);
                            DEPT_NAME = rs.getString(2);
                            PAY_BAND = rs.getString(3);
                            GRADE = rs.getString(4);
                            SAL_NO = rs.getString(5);
                            INCR = rs.getString(6);

                            BASICSAL = rs.getString(7);
                            ENAME = rs.getString(8);
                            RNPA = rs.getString(9);
                            RDA = rs.getString(10);
                            RHRA = rs.getString(11);
                            STRAN = rs.getString(12);
                            EDU = rs.getString(13);
                            OTH1N = rs.getString(14);
                            OTH2N = rs.getString(15);
                            OTH3N = rs.getString(16);
                            OTH4N = rs.getString(17);
                            OTH5N = rs.getString(18);
                            OTH6N = rs.getString(19);
                            OTH_DES1 = rs.getString(20);
                            OTH_DES2 = rs.getString(21);
                            OTH_DES3 = rs.getString(22);
                            OTH_DES4 = rs.getString(23);
                            OTH_DES5 = rs.getString(24);
                            OTH_DES6 = rs.getString(25);
                            ITAX = rs.getString(26);
                            LIC = rs.getString(27);
                            LIN_FEE = rs.getString(28);
                            PF = rs.getString(29);
                            PF_LOAN = rs.getString(30);
                            NPS = rs.getString(31);
                            CGIS = rs.getString(32);
                            FEST_ADV = rs.getString(33);
                            VEH_ADV = rs.getString(34);
                            VC_LOAN = rs.getString(35);
                            HBL_UGC = rs.getString(36);
                            HBL_INT = rs.getString(37);
                            ELECT = rs.getString(38);
                            MAS = rs.getString(39);
                            TSA = rs.getString(40);
                            NTSA = rs.getString(41);
                            TCHSA = rs.getString(42);
                            TWS = rs.getString(43);
                            VBSS = rs.getString(44);
                            MIS_DES1 = rs.getString(45);
                            MISC1 = rs.getString(46);
                            MIS_DES2 = rs.getString(47);
                            MISC2 = rs.getString(48);
                            MIS_DES3 = rs.getString(49);
                            MISC3 = rs.getString(50);
                            MIS_DES4 = rs.getString(51);
                            MISC4 = rs.getString(52);

                            BANK_NAME = rs.getString(53);
                            BANK_AC = rs.getString(54);
                            CHEQ_NO = rs.getString(55);
                            CHEQ_DT = rs.getString(56);
                            REMARK = rs.getString(57);
                            DEDU = rs.getString(58);
                            NET_PAY = rs.getString(59);
                            RGROSS = rs.getString(60);
                            VP_FROM = rs.getString(61);
                            VP_TO = rs.getString(62);
                            PER_ID = rs.getString(63);
                            PAYPAYBAND = rs.getString(64);
                            FG_DES = rs.getString(65);
                            REV_STM = rs.getString(66);
                            SAL_ADV = rs.getString(67);
                            RECOVRY = rs.getString(68);
                            PER_PAY = rs.getString(69);
                            SPL_PAY = rs.getString(70);
                            PAN = rs.getString(71);
                            period = rs.getString(72);

                        }

                        if (!(SPL_PAY.equals("") || SPL_PAY.equals("0") || SPL_PAY.equals("NULL") || SPL_PAY.equals(" ") || SPL_PAY.equals("0.00"))) {
                            a1.add("SPL. PAY");
                            a2.add(SPL_PAY);
                        }

                        if (!(PER_PAY.equals("") || PER_PAY.equals("0") || PER_PAY.equals("NULL") || PER_PAY.equals(" ") || PER_PAY.equals("0.00"))) {
                            a1.add("PERSONAL PAY");
                            a2.add(PER_PAY);
                        }

                        if (!(BASICSAL.equals("") || BASICSAL.equals("0") || BASICSAL.equals("NULL") || BASICSAL.equals(" ") || BASICSAL.equals("0.00"))) {
                            a1.add("PAY");
                            a2.add(BASICSAL);
                        }

                        if (!(RNPA.equals("") || RNPA.equals("0") || RNPA.equals("NULL") || RNPA.equals(" ") || RNPA.equals("0.00"))) {
                            a1.add("NPA");
                            a2.add(RNPA);
                        }

                        if (!(RDA.equals("") || RDA.equals("0") || RDA.equals("NULL") || RDA.equals(" ") || RDA.equals("0.00"))) {
                            a1.add("DA");
                            a2.add(RDA);
                        }

                        if (!(RHRA.equals("") || RHRA.equals("0") || RHRA.equals("NULL") || RHRA.equals(" ") || RHRA.equals("0.00"))) {
                            a1.add("HRA");
                            a2.add(RHRA);
                        }

                        if (!(STRAN.equals("") || STRAN.equals("0") || STRAN.equals("NULL") || STRAN.equals(" ") || STRAN.equals("0.00"))) {
                            a1.add("TRANS");
                            a2.add(STRAN);
                        }
                        if (!(EDU.equals("") || EDU.equals("0") || EDU.equals("NULL") || EDU.equals(" ") || EDU.equals("0.00"))) {
                            a1.add("C. EDU");
                            a2.add(EDU);
                        }

                        if (!(OTH1N.equals("") || OTH1N.equals("0") || OTH1N.equals("NULL") || OTH1N.equals(" ") || OTH1N.equals("0.00"))) {
                            a1.add(OTH_DES1);
                            a2.add(OTH1N);
                        }
                        if (!(OTH2N.equals("") || OTH2N.equals("0") || OTH2N.equals("NULL") || OTH2N.equals(" ") || OTH2N.equals("0.00"))) {
                            a1.add(OTH_DES2);
                            a2.add(OTH2N);
                        }
                        if (!(OTH3N.equals("") || OTH3N.equals("0") || OTH3N.equals("NULL") || OTH3N.equals(" ") || OTH3N.equals("0.00"))) {
                            a1.add(OTH_DES3);
                            a2.add(OTH3N);
                        }
                        if (!(OTH4N.equals("") || OTH4N.equals("0") || OTH4N.equals("NULL") || OTH4N.equals(" ") || OTH4N.equals("0.00"))) {
                            a1.add(OTH_DES4);
                            a2.add(OTH4N);
                        }
                        if (!(OTH5N.equals("") || OTH5N.equals("0") || OTH5N.equals("NULL") || OTH5N.equals(" ") || OTH5N.equals("0.00"))) {
                            a1.add(OTH_DES5);
                            a2.add(OTH5N);
                        }
                        if (!(OTH6N.equals("") || OTH6N.equals("0") || OTH6N.equals("NULL") || OTH6N.equals(" ") || OTH6N.equals("0.00"))) {
                            a1.add(OTH_DES6);
                            a2.add(OTH6N);
                        }

                        Iterator a1i = a1.iterator();
                        Iterator a2i = a2.iterator();

                        if (!(ITAX.equals("") || ITAX.equals("0") || ITAX.equals("NULL") || ITAX.equals(" ") || ITAX.equals("0.00"))) {
                            a3.add("INCOME TAX");
                            a4.add(ITAX);
                        }
                        if (!(LIC.equals("") || LIC.equals("0") || LIC.equals("NULL") || LIC.equals(" ") || LIC.equals("0.00"))) {
                            a3.add("LIC");
                            a4.add(LIC);
                        }
                        if (!(LIN_FEE.equals("") || LIN_FEE.equals("0") || LIN_FEE.equals("NULL") || LIN_FEE.equals(" ") || LIN_FEE.equals("0.00"))) {
                            a3.add("LICENSE FEE");
                            a4.add(LIN_FEE);
                        }

                        if (!(PF.equals("") || PF.equals("0") || PF.equals("NULL") || PF.equals(" ") || PF.equals("0.00"))) {
                            a3.add("PF");
                            a4.add(PF);
                        }
                        if (!(PF_LOAN.equals("") || PF_LOAN.equals("0") || PF_LOAN.equals("NULL") || PF_LOAN.equals(" ") || PF_LOAN.equals("0.00"))) {
                            a3.add("PF LOAN");
                            a4.add(PF_LOAN);
                        }
                        if (!(NPS.equals("") || NPS.equals("0") || NPS.equals("NULL") || NPS.equals(" ") || NPS.equals("0.00"))) {
                            a3.add("NPS");
                            a4.add(NPS);
                        }
                        if (!(CGIS.equals("") || CGIS.equals("0") || CGIS.equals("NULL") || CGIS.equals(" ") || CGIS.equals("0.00"))) {
                            a3.add("CGIS");
                            a4.add(CGIS);
                        }
                        if (!(FEST_ADV.equals("") || FEST_ADV.equals("0") || FEST_ADV.equals("NULL") || FEST_ADV.equals(" ") || FEST_ADV.equals("0.00"))) {
                            a3.add("FESTIVAL ADV.");
                            a4.add(FEST_ADV);
                        }

                        if (!(VEH_ADV.equals("") || VEH_ADV.equals("0") || VEH_ADV.equals("NULL") || VEH_ADV.equals(" ") || VEH_ADV.equals("0.00"))) {
                            a3.add("VEHICLE ADV.");
                            a4.add(VEH_ADV);
                        }

                        if (!(VC_LOAN.equals("") || VC_LOAN.equals("0") || VC_LOAN.equals("NULL") || VC_LOAN.equals(" ") || VC_LOAN.equals("0.00"))) {
                            a3.add("VC LOAN");
                            a4.add(VC_LOAN);
                        }

                        if (!(HBL_UGC.equals("") || HBL_UGC.equals("0") || HBL_UGC.equals("NULL") || HBL_UGC.equals(" ") || HBL_UGC.equals("0.00"))) {
                            a3.add("HBL UGC");
                            a4.add(HBL_UGC);
                        }
                        if (!(HBL_INT.equals("") || HBL_INT.equals("0") || HBL_INT.equals("NULL") || HBL_INT.equals(" ") || HBL_INT.equals("0.00"))) {
                            a3.add("HBL INT");
                            a4.add(HBL_INT);
                        }

                        if (!(ELECT.equals("") || ELECT.equals("0") || ELECT.equals("NULL") || ELECT.equals(" ") || ELECT.equals("0.00"))) {
                            a3.add("ELECTRICITY");
                            a4.add(ELECT);
                        }
                        if (!(MAS.equals("") || MAS.equals("0") || MAS.equals("NULL") || MAS.equals(" ") || MAS.equals("0.00"))) {
                            a3.add("MAS");
                            a4.add(MAS);
                        }

                        if (!(TSA.equals("") || TSA.equals("0") || TSA.equals("NULL") || TSA.equals(" ") || TSA.equals("0.00"))) {
                            a3.add("TEACHING STAFF ASSO.");
                            a4.add(TSA);
                        }

                        if (!(TCHSA.equals("") || TCHSA.equals("0") || TCHSA.equals("NULL") || TCHSA.equals(" ") || TCHSA.equals("0.00"))) {
                            a3.add("TECHNICAL");
                            a4.add(TCHSA);
                        }
                        if (!(NTSA.equals("") || NTSA.equals("0") || NTSA.equals("NULL") || NTSA.equals(" ") || NTSA.equals("0.00"))) {
                            a3.add("NTSA");
                            a4.add(NTSA);
                        }

                        if (!(TWS.equals("") || TWS.equals("0") || TWS.equals("NULL") || TWS.equals(" ") || TWS.equals("0.00"))) {
                            a3.add("TWS");
                            a4.add(TWS);
                        }
                        if (!(VBSS.equals("") || VBSS.equals("0") || VBSS.equals("NULL") || VBSS.equals(" ") || VBSS.equals("0.00"))) {
                            a3.add("VBSS");
                            a4.add(VBSS);
                        }
                        if (!(MISC1.equals("") || MISC1.equals("0") || MISC1.equals("NULL") || MISC1.equals(" ") || MISC1.equals("0.00"))) {
                            a3.add(MIS_DES1);
                            a4.add(MISC1);
                        }
                        if (!(MISC2.equals("") || MISC2.equals("0") || MISC2.equals("NULL") || MISC2.equals(" ") || MISC2.equals("0.00"))) {
                            a3.add(MIS_DES2);
                            a4.add(MISC2);
                        }
                        if (!(MISC3.equals("") || MISC3.equals("0") || MISC3.equals("NULL") || MISC3.equals(" ") || MISC3.equals("0.00"))) {
                            a3.add(MIS_DES3);
                            a4.add(MISC3);
                        }
                        if (!(MISC4.equals("") || MISC4.equals("0") || MISC4.equals("NULL") || MISC4.equals(" ") || MISC4.equals("0.00"))) {
                            a3.add(MIS_DES4);
                            a4.add(MISC4);
                        }

                        if (!(REV_STM.equals("") || REV_STM.equals("0") || REV_STM.equals("NULL") || REV_STM.equals(" ") || REV_STM.equals("0.00"))) {
                            a3.add("REVENUE STAMP");
                            a4.add(REV_STM);
                        }

                        if (!(SAL_ADV.equals("") || SAL_ADV.equals("0") || SAL_ADV.equals("NULL") || SAL_ADV.equals(" ") || SAL_ADV.equals("0.00"))) {
                            a3.add("SAL ADV");
                            a4.add(SAL_ADV);
                        }
                        if (!(RECOVRY.equals("") || RECOVRY.equals("0") || RECOVRY.equals("NULL") || RECOVRY.equals(" ") || RECOVRY.equals("0.00"))) {
                            a3.add("RECOVRY OF PAY");
                            a4.add(RECOVRY);
                        }

                        Iterator a3i = a3.iterator();
                        Iterator a4i = a4.iterator();

                        rs.close();
                        ps.close();
                        connection.close();
                %>


                <%
                    if (!PER_ID.equals("000000")) {
                %>

                <center>
                    <div id="sal">
                        <table style="text-align: left; width: 650px; height: 50px;" border="0" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td colspan="2" rowspan="1" style="width: 300px;"></td>
                                    <td style="text-align: right; width: 126px;"><%=month_name%>-<%=year%></%></td>
                                    <td style="text-align: right; width: 150px;"></td>
                                </tr>
                                <tr>
                                    <td colspan="4" rowspan="1" style="width: 451px; text-align: center;">Aligarh Muslim
                                        University - Aligarh, Finance &amp; Accounts Department</td>
                                </tr>
                                <tr>
                                    <td colspan="1" rowspan="1" style="width: 451px;">Salary
                                        Slip for the Month of <%=month_name%> &nbsp;<%=year%> </td>
                                    <td colspan="1" rowspan="1" style="width: 72px;"></td>
                                    <td><%=tp_name%></%> </td>
                                    <td><%=FG_DES%></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                        <table style="border: 1px solid black; text-align: left; width: 650px; height: 50px;" border="0" cellpadding="1" cellspacing="1">
                            <tbody>
                                <tr style="border-left: 1px solid rgb(221, 221, 221);">
                                    <td style="border-left: 0px solid rgb(221, 221, 221);">Name</td>
                                    <td>:</td>
                                    <td colspan="2" rowspan="1"><%=ENAME%></%></td>
                                    <td>Permanent ID</td>
                                    <td>:</td>
                                    <td><%=pid%></%></td>
                                </tr>
                                <tr>
                                    <td>Designation</td>
                                    <td>:</td>
                                    <td colspan="2" rowspan="1"><%=DESIG_NAME%></td>
                                    <td>Salary Register</td>
                                    <td>:</td>
                                    <td><%=SAL_NO%></td>
                                </tr>
                                <tr>
                                    <td>Department</td>
                                    <td>:</td>
                                    <td colspan="2" rowspan="1"><%=DEPT_NAME%></td>
                                    <td>Increment Due on</td>
                                    <td>:</td>
                                    <td><%=INCR%></td>
                                </tr>
                                <tr>
                                    <td>Pay Band</td>
                                    <td>:</td>
                                    <td><%=PAY_BAND%></td>
                                    <td>Grade Pay/Level :<%=GRADE%></td>
                                    <td>Pay in Pay &nbsp;Band</td>
                                    <td>:</td>
                                    <td><%=PAYPAYBAND%></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                        <table style="border: 1px solid black; text-align: left; width: 652px; height: 93px;" class="wage" border="0" cellpadding="6" cellspacing="1">
                            <tbody>
                                <tr style="border-left: 1px solid rgb(221, 221, 221);">
                                    <%

                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>




                                    <td style="width: 174px;" colspan="1" rowspan="1">Bank Name </td>



                                </tr>
                                <tr>
                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>


                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>






                                    <td style="width: 174px;" colspan="1" rowspan="2"><%=BANK_NAME%>&nbsp;</td>
                                </tr>
                                <tr>
                                    <%

                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>
                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>


                                </tr>
                                <tr>
                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right "><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>
                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px; "></td>

                                    <%
                                        }
                                    %>

                                    <td style="width: 174px;" colspan="1" rowspan="1">A/C
                                        No. <%=BANK_AC%></%></td>
                                </tr>
                                <tr>
                                    <%

                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>
                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td style="width: 174px;" colspan="1" rowspan="1">Cheque
                                        No. <%=CHEQ_NO%></%></td>
                                </tr>
                                <tr>
                                    <%

                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>
                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>


                                    <td style="width: 174px;" colspan="1" rowspan="1">Cheque
                                        Date <%=CHEQ_DT%></td>

                                </tr>
                                <tr>
                                    <%

                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px; text-align: right"></td>

                                    <%
                                        }
                                    %>
                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td style="width: 174px;" colspan="1" rowspan="1">Salary
                                        wage period
                                    </td>


                                </tr>
                                <tr>
                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>
                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td style="width: 174px;"><%=period%></td>

                                </tr>
                                <tr>
                                    <%

                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px; "></td>

                                    <%
                                        }
                                    %>
                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px; "></td>

                                    <%
                                        }
                                    %>

                                    <td style="width: 174px;"> PAN NO. :  <%=PAN%></td>
                                </tr>
                                <tr>
                                    <%

                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>
                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td style="width: 174px;"></td>
                                </tr>
                                <tr>
                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>


                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>


                                    <td></td></tr>
                                <tr>
                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>






                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr>
                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>
                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td>
                                </tr>
                                <tr> <%
                                    if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr><td></td><td></td><%
                                    if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px; text-align: right"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr>


                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>




                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr>

                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>




                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr>

                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>



                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr>
                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>



                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr>
                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>



                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr>

                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>


                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr>


                                    <%
                                        if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>


                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr> <%
                                    if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>


                                    <%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr> <%
                                    if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %><%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr> <%
                                    if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %><%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>

                                <tr> <%
                                    if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %><%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>
                                <tr> <%
                                    if (a2i.hasNext() && a2i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a1i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a2i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %><%
                                        if (a3i.hasNext() && a4i.hasNext()) {
                                    %>
                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"><%=a3i.next()%></td>
                                    <td style="width: 75px; text-align: right"><%=a4i.next()%></%></td>
                                    <%
                                    } else {
                                    %>

                                    <td style="border-left: 1px solid rgb(221, 221, 221); width: 131px;"></td>
                                    <td style="width: 75px;"></td>

                                    <%
                                        }
                                    %>

                                    <td></td></tr>


                                <tr class="hl" style="">
                                    <td colspan="5" rowspan="1" style="text-align: left;">
                                        <table style="text-align: left; width: 100%;" border="1" cellpadding="0" cellspacing="0">
                                            <tbody>
                                                <tr>
                                                    <td style="width: 140px; text-align: left;">
                                                        GROSS </td>
                                                    <td style="text-align: right; width: 80px;">
                                                        <%=RGROSS%></td>
                                                    <td style="width: 142px; text-align: left;">
                                                        DEDUCTION</td>
                                                    <td style="text-align: right; width: 85px;">
                                                        <%=DEDU%></td>
                                                    <td style="text-align: right; width: 175px;">
                                                        NET SALARY <%=NET_PAY%></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                        Note : Error if any, must brought to the notice of D.F.O. /J.F.O.
                        (Salary) <br>
                        Remark :<%=REMARK%><br>
                    </div><br>
                    <button class="btn btn-dark" id="print" onclick="printContent('sal');" >Print</button>
                </center>
                <br>

                <br>
                <CENTER>
                    <><><><a href=salary.jsp> back </a><><><>      
                </CENTER>

                <br>


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
                            PreparedStatement ps1 = con.prepareStatement(sqll);
                            ps1.setString(1, pid);
                            ps1.setString(2, "3");
                            ps1.setString(3, ipAddr);
                            i = ps1.executeUpdate();
                        } else {
                            String msg = "No Salary " + tp_name + " record available for " + month_name + " " + year;
                            request.setAttribute("msg", msg);
                            request.getRequestDispatcher("salary.jsp").forward(request, response);
                        }

                    } catch (Exception e) {

                        String msg = "No Salary " + tp_name + " record available for " + month_name + " " + year;
                        request.setAttribute("msg", msg);
                        request.getRequestDispatcher("salary.jsp").forward(request, response);
                        con.close();
                    }


                %>

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
