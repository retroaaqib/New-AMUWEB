<%-- 
    Document   : leaveProcess.jsp
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
                        <%                            String pid1 = request.getParameter("pid");
                            String pid2 = Integer.valueOf(pid1).toString();
                            String fy = request.getParameter("fy");
                            Connection connection = null;
                            Statement statement = null;
                            PreparedStatement ps1 = null;
                            ResultSet rs1 = null;
                            String PER_ID = "0";
                            String NAME = "";
                            String DEPT = "";
                            String DEPT_NAME = "";
                            String DESIG = "";
                            String DESIG_NAME = "";
                            String EL = "";
                            String ELOB = "";
                            String DL = "";
                            String DLOB = "";
                            String HPL = "";
                            String HPLOB = "";
                            String YEAR = "";

                            Class.forName("org.gjt.mm.mysql.Driver").newInstance();
                            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fosalary", "root", "Aaqib@123");
                            String period = "";
                            String sqlstring1 = "select PER_ID, NAME, DEPT, DEPT_NAME, DESIG, DESIG_NAME, EL, ELOB, DL, DLOB, HPL, HPLOB, YEAR from EMP_LEAVE where PER_ID=? and YEAR=?";
                            ps1 = connection.prepareStatement(sqlstring1);
                            ps1.setString(1, pid2);
                            ps1.setString(2, fy);
                            rs1 = ps1.executeQuery();

                            while (rs1.next()) {

                                PER_ID = rs1.getString(1);
                                NAME = rs1.getString(2);
                                DEPT = rs1.getString(3);
                                DEPT_NAME = rs1.getString(4);
                                DESIG = rs1.getString(5);
                                DESIG_NAME = rs1.getString(6);
                                EL = rs1.getString(7);
                                ELOB = rs1.getString(8);
                                DL = rs1.getString(9);
                                DLOB = rs1.getString(10);
                                HPL = rs1.getString(11);
                                HPLOB = rs1.getString(12);
                                YEAR = rs1.getString(13);
                            }

                            if (!PER_ID.equals("0")) {
                        %>
                        <div id="div1"><center><h4>ALIGARH MUSLIM UNIVERSITY, ALIGARH<BR><br>
                                    Leave Balances as on 01.01.<%=YEAR%> <BR>
                                </h4>
                            </center>
                            <br><br>
                            <table style="width:100%">
                                <tr>
                                    <td>I.D.</td>
                                    <td><%=pid1%></td>
                                </tr>
                                <tr>
                                    <td>Name</td>
                                    <td><%=NAME%></td>
                                </tr>
                                <tr>
                                    <td>Designation</td>
                                    <td><%=DESIG_NAME%></td>   
                                </tr>
                                <tr>
                                    <td>Department</td>
                                    <td><%=DEPT_NAME%></td>   
                                </tr>
                                <tr>
                                    <td>Earned Leave</td>
                                    <td><%=ELOB%></td>   
                                </tr>
                                <tr>
                                    <td>Detention Leave</td>
                                    <td><%=DLOB%></td>   
                                </tr>
                                <tr>
                                    <td>Half Pay Leave</td>
                                    <td><%=HPLOB%></td>   
                                </tr>
                            </table>
                            <br>
                            Note: 1. Leave Balances are subject to Audit.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            2. Errors, if any, must be brought to the notice of Leave Section.<br><br></div>



                        <center><button class="btn btn-dark" id="print" onclick="printContent('div1');" >Print</button> <br><br> <a href="emppanel.jsp">Go Back</a></center>

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
                                ps2.setString(2, "5");
                                ps2.setString(3, ipAddr);
                                i = ps2.executeUpdate();
                                ps1.close();
                                rs1.close();
                                ps1.close();
                                con.close();
                                connection.close();
                            } else {
                                String msg = "No Leave Balance Statement Available for the Year " + fy;
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
